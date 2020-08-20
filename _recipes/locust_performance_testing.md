---
name: Locust Performance Testing Notes
---
# Locust
An open source load testing tool. 
# Install
Install:
`pip3 install locust`  
Check if installed:
`locust --help`

## Increasing Maximum Number of Open Files Limit
Every HTTP connection on a machine opens a new file (technically a file descriptor). Increase the operating system’s default maximum number of files limit to a number higher than the number of simulated users you’ll want to run.

### MacOS
Link: [Extra info](https://wilsonmar.github.io/maximum-limits/)  
Check current limit: `launchctl limit maxfiles`  
To increase the limit: `sudo launchctl limit maxfiles 65536 200000`

# General Notes
* `on_start()` method: Executed for every simulated user when they start.
* When started, web interface: http://127.0.0.1:8089
* To start tests directly, without using the web interface, use `--headless`

# Writing a locustfile

* A locustfile is a normal python file. The only requirement is that it declares at least one class - let’s call it the user class - that inherits from the class `User`.
* 



# Running
Save simulation in `locustfile.py` and run: `locust`  
For files located in different location: `locust -f locust_files/my_locust_file.py`
