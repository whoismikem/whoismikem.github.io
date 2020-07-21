# Netcat listening on port of your choice and responds with 200 OK and date.
while true; do echo -e "HTTP/1.1 200 OK\n\n $(date)" | nc -l localhost 8000; done
