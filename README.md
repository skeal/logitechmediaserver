# docker-logitechmediaserver

Docker image for Logitech Media Server (SqueezeCenter, SqueezeboxServer, SlimServer)

Run with:

```
docker run -t -i --rm=true --net="host" \
      -v "/mnt/user/appdata/LogitechMediaServer":"/config":rw \
	  -v "/mnt/music":"/music":ro \
      -v "/etc/localtime":"/etc/localtime":ro \
      snoopy86/logitechmediaserver
```

<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="GSRTR79H7Q47J">
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
</form>