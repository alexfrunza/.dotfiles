if(string.find(vim.fn.expand('%:p'), "^/home/alex/Playground/asii[-]ziar") ~= nil)
then
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
end