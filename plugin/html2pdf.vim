"If user do not have absolute path of wkhtmltopdf set,
"then we regard it as in PATH environment
if exists("g:html2pdf_exepath") == 0
    let g:html2pdf_exepath = "wkhtmltopdf"
endif

function! TOpdf()
    let g:file_name = expand('%:t:r')
    TOhtml
    wq! /tmp/tmp.html
    call system(g:html2pdf_exepath .
                \" --header-center " .
                \g:file_name .
                \" --header-spacing 3 " .
                \" /tmp/tmp.html " .
                \"PDF@".g:file_name.".pdf")
    call system("rm -rf /tmp/tmp.html")
endfunction

command! TOpdf call TOpdf()
