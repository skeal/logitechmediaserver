# docker-logitechmediaserver

Docker image for Logitech Media Server (SqueezeCenter, SqueezeboxServer, SlimServer)

Also with airplay function!

Run with:

```
docker run -t -i --rm=true --net="bridge" \
      -v "/mnt/user/appdata/LogitechMediaServer":"/config":rw \
      -v "/mnt/music":"/music":ro \
      -v "/var/run/dbus":"/var/run/dbus":rw \
      -v "/etc/localtime":"/etc/localtime":ro \
      -p 9000:9000/tcp \
      -p 9090:9090/tcp \
      -p 3483:3483/tcp \
      -p 3483:3483/udp \
      snoopy86/logitechmediaserver
```

or compose
```
version: '3'
services:
  lms:
    container_name: lms
    image: snoopy86/logitechmediaserver
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /<somewhere>:/config:rw
      - /<somewhere else>:/music:ro
      - /var/run/dbus:/var/run/dbus:rw
    ports:
      - 9000:9000/tcp
      - 9090:9090/tcp
      - 3483:3483/tcp
      - 3483:3483/udp
    restart: always
```
DONATE - https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=FDMP56NCG5A26&source=url
