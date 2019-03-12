# docker-server-redirector

Listens and redirects common ports to a specific IP, used for server migrations until DNS provisions

Very low resource usage, using layer2 (transparent) load balancing

View **docker-compose-sample.yml** in the source repository for usage

# features
Alpine latest with s6
HAProxy

# available ports
### EMAIL
25, 465, 587, 110, 995, 143, 993

### NNTP
119, 563

### DNS
53

### HTTP
80, 8080, 443, 8443, 1080, 3128

### RSYNC
587

### SQL
3306, 5432, 4333

### VNC
5800

### Control Panels
2082, 2083, 10000, 20000

### EMAIL
- 25:25
- 465:465
- 587:587
- 110:110
- 995:995
- 143:143
- 993:993

### NNTP
- 119:119
- 563:563

### DNS
- 53:53

### HTTP
- 80:80
- 8080:8080
- 443:443
- 8443:8443
- 1080:1080
- 3128:3128

### RSYNC
- 587:587

### SQL
- 3306:3306
- 5432:5432
- 4333:4333

### Control Panels
- 2082:2082
- 2083:2083
- 10000:10000
- 20000:20000
