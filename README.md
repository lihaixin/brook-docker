# brook 客户端使用
```
docker run -d \
	-p 1080:1080 \
	-e protocol=client \
	-e server=youserverip:port
	-e password=pwd \
	--name brook-client \
	lihaixin/brook:client
```	           
	           




