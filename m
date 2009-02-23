From: Jesper Dangaard Brouer <jdb@comx.dk>
Date: Mon, 23 Feb 2009 14:40:43 +0000
Subject: [PATCH 3/3] Doc: Refer to ip-sysctl.txt for strict vs. loose
Message-Id: <1235400043.2351.52.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1235141957.2351.37.camel@localhost.localdomain>
	 <1235142193.2351.41.camel@localhost.localdomain>
	 <20090222.000656.74298101.davem@davemloft.net>
In-Reply-To: <20090222.000656.74298101.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org


The IP_ADVANCED_ROUTER Kconfig describes the rp_filter
proc option.  Recent changes added a loose mode.
Instead of documenting this change too places, refer to
the document describing it:
 Documentation/networking/ip-sysctl.txt

I'm considering moving the rp_filter description away
from the Kconfig file into ip-sysctl.txt.

Signed-off-by: Jesper Dangaard Brouer <hawk@comx.dk>
---

 net/ipv4/Kconfig |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)


diff --git a/net/ipv4/Kconfig b/net/ipv4/Kconfig
index c7a8148..b2cf91e 100644
--- a/net/ipv4/Kconfig
+++ b/net/ipv4/Kconfig
@@ -50,6 +50,8 @@ config IP_ADVANCED_ROUTER
 	  echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
 
 	  Note that some distributions enable it in startup scripts.
+	  For details about rp_filter strict and loose mode read
+	  <file:Documentation/networking/ip-sysctl.txt>.
 
 	  If unsure, say N here.
 

