From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Apr 2017 10:39:09 +0000
Subject: [PATCH] HSI: ssi_protocol: double free in ssip_pn_xmit()
Message-Id: <20170421103909.y5zdbq7joxw6leam@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>
Cc: Jarod Wilson <jarod@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If skb_pad() fails then it frees skb and we don't need to free it again
at the end of the function.

Fixes: dc7bf5d7 ("HSI: Introduce driver for SSI Protocol")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hsi/clients/ssi_protocol.c b/drivers/hsi/clients/ssi_protocol.c
index 7ef819680acd..26b05106f0d3 100644
--- a/drivers/hsi/clients/ssi_protocol.c
+++ b/drivers/hsi/clients/ssi_protocol.c
@@ -980,7 +980,7 @@ static int ssip_pn_xmit(struct sk_buff *skb, struct net_device *dev)
 		goto drop;
 	/* Pad to 32-bits - FIXME: Revisit*/
 	if ((skb->len & 3) && skb_pad(skb, 4 - (skb->len & 3)))
-		goto drop;
+		goto inc_dropped;
 
 	/*
 	 * Modem sends Phonet messages over SSI with its own endianess...
@@ -1032,8 +1032,9 @@ static int ssip_pn_xmit(struct sk_buff *skb, struct net_device *dev)
 drop2:
 	hsi_free_msg(msg);
 drop:
-	dev->stats.tx_dropped++;
 	dev_kfree_skb(skb);
+inc_dropped:
+	dev->stats.tx_dropped++;
 
 	return 0;
 }
