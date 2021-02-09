---
name: Bash Notes
---

# Bash Notes



### Directory Exists
```bash
[ -d "/path/to/dir" ] && echo "Directory X exists"
```  
or does not exists  
```bash
[! -d "/path/to/dir" ] && echo "Directory does not exist
```

If/Else block  
```bash
dir_path="/path/to/dir"
if [ -d $dir_path ]; then
    echo "Directory $dir_path exists." 
else
    echo "Error: Directory $dir_path does not exists."
fi
```

### While Loop
```bash
while true; do <command>; sleep 2; done
```

### For Loops 
* Looping over files in directory - For every file run command.
```bash
for i in *; do 
<command>
done
```
