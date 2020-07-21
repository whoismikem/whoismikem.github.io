---
name: Linux Admin
---

# Sys Admin Tasks

## Add user to group
`usermod -a -G <group> <user>`


## Process Management

### Find/Search Process by Name

`pgrep <name>`  
Exact match.
`pgrep -x <pname>`  
Long output.  
`pgrep -l <pname>`

### Kill Process
Kill all processes matching <pattern>. `-f` matches process name and argument list.  
`pkill -f <pattern>`
