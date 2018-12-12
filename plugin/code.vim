function! TOCode() range
python3 << EOF
#! -*- coding:utf-8 -*-
from bs4 import BeautifulSoup
import os
import vim

vim.command("let g:html_use_css = 0")


# write visual selected range into html
buf = vim.current.buffer
beg = buf.mark('<')
end = buf.mark('>')
htmlrng = "%d,%dTOhtml" % (beg[0],end[0])
vim.command(htmlrng)
vim.command("wq! /tmp/tmp.html")
html = "/tmp/tmp.html"

# parse the html and change the style
with open(html) as fp:
    soup = BeautifulSoup(fp, 'html.parser')
if(os.path.exists(html)): os.remove(html)

bgcolor = soup.body['bgcolor']
txtcolor = soup.body['text']

soup.body.name = "pre"

# remove attributes
del soup.pre['bgcolor']
del soup.pre['text']

# add attibute
soup.pre["style"] = "background-color:%s;color:%s;padding:1%%;border-radius:20px;line-height:10px;" % (bgcolor, txtcolor)

what_we_need =  str(soup.pre)

# The following code snippet is from
# https://stackoverflow.com/questions/2695443/can-you-access-registers-from-python-functions-in-vim?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
def setRegister(reg, value):
  vim.command( "let @%s='%s'" % (reg, value.replace("'","''") ) )

setRegister(0,what_we_need)

EOF
endfunction

command! -range TOCode call TOCode()

