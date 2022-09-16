import sys
import re
import subprocess
import os

def get_sound_volume(sink: str) -> (int, str, int, str):
    """
    return left and right volume of the sink in this order
    """

    result = subprocess.run(['amixer', 'sget', sink],
                            stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE
                            )

    if err := result.stderr:
        err = str(err, "UTF-8")
        sys.exit(f"Error in running 'amixer sget {sink}':\n{err}") 

    s = re.search('.*\[(\d+)%\].*\[(on|off)\].*\[(\d+)%\].*\[(on|off)\]',
                  str(result.stdout, 'UTF-8'),
                  flags=re.DOTALL)


    return (int(s.group(1)), s.group(2), int(s.group(3)), s.group(4))


def balance_sound_volume(sink: str, volume: int):
    """
    balance left and right volume of the sink
    """

    result = subprocess.run(['amixer', '-q', 'sset', sink, f'{volume}%,{volume}%'],
                            stderr=subprocess.PIPE
                            )

    if err := result.stderr:
        err = str(err, "UTF-8")
        sys.exit(f"Error in running 'amixer -q sset {sink} {volume}%,{volume}%':\n{err}")

def send_notification_with_volume(volume: int, expire_time: int, action: str):
    """
    send a notification with notify-send
        - volume is in precentage
        - expire time is in miliseconds
        - action is "down" or "up" 
    """
    icons_path = os.environ.get('ICONS_PATH')
    
    result = subprocess.run(['notify-send',
                             f'--replace-id=1000',
                             f'--icon={icons_path}/volume-{action}.png',
                             f'--expire-time={expire_time}',
                             f"Volume: {volume}%"],
                            stderr=subprocess.PIPE)

    if err := result.stderr:
        err = str(err, "UTF-8")
        sys.exit(f"Error in running 'notify-send --replace-id=1000 --icon={icons_path}/volume-{action}.png --expire-time={expire_time} Volume: {volume}%'\n{err}")

def unmute(sink: str):
    """
    unmute sink
    """
    result = subprocess.run(['amixer', '-q', sink, 'unmute'], stderr=subprocess.PIPE)
    
    if err := result.stderr:
        err = str(err, "UTF-8")
        sys.exit(f"Error in running 'amixer -q {sink} unmute'\n{err}")

def send_notification_with_status(volume: int, expire_time: int, status: bool):
    """
    send a notification with notify-send
        - volume is in precentage
        - expire time is in miliseconds
        - status is "off" or "on"
    """
    icons_path = os.environ.get('ICONS_PATH')
    
    result = subprocess.run(['notify-send',
                             f'--replace-id=1000',
                             f'--icon={icons_path}/volume-{status}.png',
                             f'--expire-time={expire_time}',
                             f"Volume: {volume}%"],
                            stderr=subprocess.PIPE)

    if err := result.stderr:
        err = str(err, "UTF-8")
        sys.exit(f"Error in running 'notify-send --replace-id=1000 --icon={icons_path}/volume-{status}.png --expire-time={expire_time} Volume: {volume}%'\n{err}")


if __name__ == '__main__':
    sink = sys.argv[1] # sink name
    action = sys.argv[2] # up, down or mute
    status = "on"
    
    left_volume, left_status, right_volume, right_status = get_sound_volume(sink)

    if left_status != right_status:
        unmute(sink)
    elif left_status == right_status == "off":
        status = "off"
    
    if left_volume != right_volume:
        if left_volume > right_volume:
            balance_sound_volume(sink, right_volume)
        else:
            balance_sound_volume(sink, left_volume)

    if action == "mute":
        send_notification_with_status(min(left_volume, right_volume), 2000, status)
    else:
        send_notification_with_volume(min(left_volume, right_volume), 2000, action)

