#!/usr/bin/awk -f

#别忘了改Date

BEGIN {
        c[1]="Team01"; 
        c[2]="Team02"; 
        c[3]="Team03"; 
        c[4]="Team04"; 
        c[5]="Team05"; 
        c[6]="Team06"; 
        c[7]="Team07"; 
        c[8]="Team08"; 
        c[9]="Team09";
        c[10]="BCTF-Server";

        service[7156]="BlueMine"
        service[2014]="Hrms"
        service[1234]="Jas"
        service[910]="YourStyle"
        service[3600]="Secret-Guard"
        service[8080]="Game"
    }

{
    if($(NF-1) == "length") {
        split($1, a, ".",sep); 
        split($3, b, ".", sep); 
        if(b[1]!=10 || b[3]>10){
            c[b[3]] = $3;
            }

        if(b[1]==10 && b[3]==10){
            d[b[3]] == "Service";
            }
        else {
            d[b[3]] = "Attack";
            }

        split($5, sr, ".", sep)
        split(sr[5], pr, ":", sep)
        if(pr[1]!=7156&&pr[1]!=2014&&pr[1]!=1234&&pr[1]!=910&&pr[1]!=3600&&pr[1]!=8080){
            service[pr[1]] = pr[1]
            }
        
        printf("[%s] - - [28/Apr/2014:%s +800] \"GET %s@%s.%s.%s.%s HTTP/1.1\" %s %s \"-\" \"-\"\n",c[b[3]], a[1],  service[pr[1]],sr[1],sr[2],sr[3],sr[4], d[b[3]], $NF)
        }
    }

{

    }

