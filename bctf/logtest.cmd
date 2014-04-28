sudo tcpdump -i wlan0  -l |awk '{printf("%s\t %s\t %s\t %s\n",$1, $3, $5, $NF)}'
sudo tcpdump -i wlan0 -ttttt  -l |awk '$6 == "Flags" || NR==1 { printf("%s - - [%s] \"GET %s HTTP/1.1\" 200 %s \"-\" \"-\"\n",$3, $1, $5, $NF)}'
sudo tcpdump -i eth0  -l |awk '$(NF-1) == "length" || NR==1 { printf("%s - - [27/Apr/2014:%s +1200] \"GET %s HTTP/1.1\" 200 %s \"-\" \"-\"\n",$3, $1, $5, $NF)}' 2>&1 >log2.data


sudo tcpdump -i eth0  -l |awk '$(NF-1) == "length" || NR==1 { split($1, a, ".",sep); split($3, b, "."); printf("%s - - [27/Apr/2014:%s +1200] \"GET %s HTTP/1.1\" 200 %s \"-\" \"-\"\n", b[1]+"."+b[2]+"."+b[3]+"."+b[4], a[1] , $5, $NF)}'  >log2.data

sudo tcpdump -i eth0  -l |awk '$(NF-1) == "length" || NR==1 { split($1, a, ".",sep); printf("%s - - [27/Apr/2014:%s +1200] \"GET %s HTTP/1.1\" 200 %s \"-\" \"-\"\n", $3, a[1] , $5, $NF)}'  >log2.data

tail -f ../log.data | ./logstalgia --no-bounce --hide-paddle -


sudo tcpdump -i eth0 -l not dst port 22 and not arp and not icmp| ./convert.awk >log.data
