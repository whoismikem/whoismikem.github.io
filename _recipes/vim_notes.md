---
name: Vim Notes
---

# Vim Notes

### Copy / Cut / Paste
`yy` Copy/Yank line
`dd` Delete or Cut line
`p` Paste line below
`P` Paste line above

### Visual Mode
`V` Enter visual mode

### Undo / Redo
`u` undo
`CTRL+r` redo

### Indent
`>>`  
`x>>` indent x lines 

### Navigate
`w` Jump forward to word  
`W` Jump forward to word (ignoring punctuation)  
`b` Jump backward to word  
`B` Jump backward to word  
`:x` Jump to line where x is the line number  
`0` Jump to beginning of line  
`^` Jump to first word on line  
`$` End of line  
`f<char>` Go to character  
`t<char>` Go to character  
`{` Move up a block  
`}` Move down a block  
`gg` Go to top of file  
`G` Go to bottom of the file  
`Ctrl + d` Move down by 16 lines  
`Ctrl + u` Move up by 16 lines  

## Searching
`/<word>` Search for word  
`n` Next instance  
`N` Next instance, backward  

## Other
`o` Add new line below and enter insert mode  
`O` Add line above and enter insert mode  
`D` Delete to end of line  
`C` Change to end of line and enter insert mode  
`cw` Change word  
`ct<char>` Change up to character `<char>`  
`dt<char>` Delete up to character `<char>`  
`*` Find all instances of word  
`zz` Center current line on page  
`x` Delete character  
`~` Change character case Lower/Upper  
    - `10~` Change case of 10 characters  
`.` Perform previous command  
`r` Replace character  
    - `3r<char>` Replace 3 characters with `<char>`  

