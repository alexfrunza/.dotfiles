import os
import re
import subprocess
import sys

def get_mic_status(name: str) -> (str, str):
    result = subprocess.run(['amixer', 'sget', name], stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE)

    if err := result.stderr:
        err = str(err, 'UTF-8')
        sys.exit(f"Error in running 'amixer sget {name}':\n{err}")

    s = re.search('\[(\d+)%\].*\[(on|off)\].*\[(\d+)%\].*\[(on|off)\]', str(result.stdout, 'UTF-8'),
                  flags=re.DOTALL)

    return (int(s.group(1)), s.group(2), int(s.group(3)), s.group(4))

def unmute(name: str):
    result = subprocess.run(['amixer', '-q', 'sset', name, 'unmute'],
                            stderr=subprocess.PIPE)

    if err := result.stderr:
        err = str(err, 'UTF-8')
        sys.exit(f"Error in running 'amixer -q sset {name} unmute':\n{err}")


def restore_volume(name: str):
    result = subprocess.run(['amixer', '-q', 'sset', name, '20%'],
                            stderr=subprocess.PIPE)

    if err := result.stderr:
        err = str(err, 'UTF-8')
        sys.exit(f"Error in running 'amixer -q sset {name} 20%':\n{err}")


def send_notification_with_status(expire_time: int, status: str):
    """
    send a notification with notify-send
        - expire time is in miliseconds
        - status is "on" or "off"
    """
    icons_path = os.environ.get("ICONS_PATH")

    result = subprocess.run(['notify-send',
                             f'--replace-id=1001',
                             f'--icon={icons_path}/mic-{status}.png',
                             f'--expire-time={expire_time}',
                             f"Microphone is {status}"],
                            stderr=subprocess.PIPE)

    if err := result.stderr:
        err = str(err, 'UTF-8')
        sys.exit(f"Error in running 'notify-send --replace-id=1001 --icon={icons_path}/mic-{status}.png --expire_time={expire_time} Microphone is {status}':\n{err}")


if __name__ == '__main__':
    name = sys.argv[1] # mix name
    volume_left, status_left, volume_right, status_right = get_mic_status(name)
    status = 'on'

    if volume_left != volume_right or volume_left != 20:
        restore_volume(name)

    if status_left != status_right:
        unmute(name)
    elif status_left == 'off':
        status = 'off'

    send_notification_with_status(2000, status)
