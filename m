From: Jesper Dangaard Brouer <jdb@comx.dk>
Date: Fri, 20 Feb 2009 15:03:13 +0000
Subject: [PATCH 1/2] Doc: Fix rp_filter description in net/ipv4/Kconfig.
Message-Id: <1235142193.2351.41.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1235141957.2351.37.camel@localhost.localdomain>
In-Reply-To: <1235141957.2351.37.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Kernel Janitors <kernel-janitors@vger.kernel.org>

Author: Jesper Dangaard Brouer <hawk@comx.dk>
Date:   Fri Feb 20 15:20:57 2009 +0100

    Doc: Fix rp_filter description in net/ipv4/Kconfig.
    
    The reverse path filter (rp_filter) will NOT get enabled
    when enabling forwarding.  Read the code and tested in
    in practice.
    
    Most distributions does enable it in startup scripts.
    
    Signed-off-by: Jesper Dangaard Brouer <hawk@comx.dk>

diff --git a/net/ipv4/Kconfig b/net/ipv4/Kconfig
index 691268f..10c944d 100644
--- a/net/ipv4/Kconfig
+++ b/net/ipv4/Kconfig
@@ -35,7 +35,7 @@ config IP_ADVANCED_ROUTER
 
 	  at boot time after the /proc file system has been mounted.
 
-	  If you turn on IP forwarding, you will also get the rp_filter, which
+	  If you turn on IP forwarding, you should consider the rp_filter, which
 	  automatically rejects incoming packets if the routing table entry
 	  for their source address doesn't match the network interface they're
 	  arriving on. This has security advantages because it prevents the
@@ -46,9 +46,11 @@ config IP_ADVANCED_ROUTER
 	  rp_filter on use:
 
 	  echo 1 > /proc/sys/net/ipv4/conf/<device>/rp_filter
-	  or
+	   and
 	  echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
 
+	  Note that some distributions enable it in startup scripts.
+
 	  If unsure, say N here.
 
 choice 

