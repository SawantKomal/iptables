    #!/bin/bash
     
    ##** MATCH BY QUOTA **##
     
    iptables -F
     
    # permit max QUOTA bytes from protocol tcp and port 80 (ROUTED TRAFFIC, we are the ROUTER)
    # traffic is generated by a server inside our LAN. This is downloaded traffic by Internet clients from our server.
     
    ### EDIT the values below ###
    PROTOCOL="tcp"
    PORT="80"
    #1GB
    QUOTA1="1000000000"
    #this is the outgoing interface
    INT="eth0"
    ###
     
    ###DO NOT EDIT BELOW THIS LINE
    iptables -A FORWARD -o $INT -p $PROTOCOL --sport $PORT -m quota --quota $QUOTA1 -j ACCEPT
    iptables -A FORWARD -o $INT -p $PROTOCOL --sport $PORT 				-j DROP
     
     
     
    # permit max 100MB of incoming https traffic from the web site with the address 100.0.0.1
     
    ### EDIT the values below ###
    HTTPS_SERVER="100.0.0.1"
    PROTOCOL="tcp"
    PORT="443"
    #100MB
    QUOTA2="100000000"
    ###
     
    ###DO NOT EDIT BELOW THIS LINE
    iptables -A INPUT -s $HTTPS_SERVER -p $PROTOCOL --sport $PORT -m quota --quota $QUOTA2 -j ACCEPT
    iptables -A INPUT 		   -p $PROTOCOL --sport $PORT 			       -j DROP
     
