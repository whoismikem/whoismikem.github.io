---
name: Bash Notes
---

# Bash Notes



### Directory Exists
`[ -d "/path/to/dir" ] && echo "Directory X exists"`  
or does not exists  
`[! -d "/path/to/dir" ] && echo "Directory does not exist`

If/Else block  
```
dir_path="/path/to/dir"
if [ -d $dir_path ]; then
    echo "Directory $dir_path exists." 
else
    echo "Error: Directory $dir_path does not exists."
fi
```

### While Loop
`while true; do <command>; sleep 2; done`