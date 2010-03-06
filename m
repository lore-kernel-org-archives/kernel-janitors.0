From: Dan Carpenter <error27@gmail.com>
Date: Sat, 06 Mar 2010 11:14:09 +0000
Subject: [patch] bridge: cleanup: remove unneed check
Message-Id: <20100306111408.GJ4958@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, bridge@lists.linux-foundation.org, "David S. Miller" <davem@davemloft.net>

We dereference "port" on the lines immediately before and immediately 
after the test so port should hopefully never be null here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/bridge/br_multicast.c b/net/bridge/br_multicast.c
index 2559fb5..8b25887 100644
--- a/net/bridge/br_multicast.c
+++ b/net/bridge/br_multicast.c
@@ -627,8 +627,8 @@ static void br_multicast_port_query_expired(unsigned long data)
 	struct net_bridge *br = port->br;
 
 	spin_lock(&br->multicast_lock);
-	if (port && (port->state = BR_STATE_DISABLED ||
-		     port->state = BR_STATE_BLOCKING))
+	if (port->state = BR_STATE_DISABLED ||
+	    port->state = BR_STATE_BLOCKING)
 		goto out;
 
 	if (port->multicast_startup_queries_sent <
