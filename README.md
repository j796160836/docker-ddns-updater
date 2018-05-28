# docker-ddns-updater

A docker wrapper for [evil-shrike/ddns-updater](https://github.com/evil-shrike/ddns-updater) to implement auto update DDNS for [namecheap](http://namecheap.com/). 

### Installations & Usages

#### 1. Create `config.json` file

Create a `config.json` as following:

```
{
 "domains": [{
   "service": "namecheap",
   "name": "example.com",
   "hosts": ["@", "www"],
   "settings": {
     "password": "NAMECHEAP_API_KEY"
   }
 }],
 "interval": { "days": 1 }
}
```

Some parameters need to change:

- `name` - name of domain, e.g. "example.com"
Change the domain 
- `hosts` - an array of host to map to the domain, if you only want naked domain ("example.com") specify "@" or omit field completely.
- `settings:password` - put your namecheap DDNS token here.  
(Located at Accounts > Domain List > Advanced DNS)

for futher details, please check [evil-shrike/ddns-updater](https://github.com/evil-shrike/ddns-updater).

#### 2. Run docker at your machine

Run the command and mount the `config.json` into container.

```
docker run --restart=always -d --name ddns-updater -v $PWD/config.json:/opt/my-ddns/config.json j796160836/docker-ddns-updater
```

It will display something like this if no errors.

```
Checking. Next check in 1 days
External IP resolved via ipify : xxx.xxx.xxx.xxx
IP changed from undefined to xxx.xxx.xxx.xxx
updated: {"service":"namecheap","name":"example.com","host":"www"}
```

## Acknowledgments

Thanks [evil-shrike/ddns-updater](https://github.com/evil-shrike/ddns-updater) for this awesome project.

## License
MIT