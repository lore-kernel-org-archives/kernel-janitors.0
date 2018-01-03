From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 03 Jan 2018 15:08:59 +0000
Subject: [PATCH] net: plip: Delete an error message for a failed memory allocation in plip_receive_packet()
Message-Id: <0beaf692-5639-f52a-d592-f8a157fe1e19@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 3 Jan 2018 16:00:23 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/plip/plip.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/plip/plip.c b/drivers/net/plip/plip.c
index feb92ecd1880..22f10d395d9c 100644
--- a/drivers/net/plip/plip.c
+++ b/drivers/net/plip/plip.c
@@ -632,10 +632,9 @@ plip_receive_packet(struct net_device *dev, struct net_local *nl,
 		}
 		/* Malloc up new buffer. */
 		rcv->skb = dev_alloc_skb(rcv->length.h + 2);
-		if (rcv->skb = NULL) {
-			printk(KERN_ERR "%s: Memory squeeze.\n", dev->name);
+		if (!rcv->skb)
 			return ERROR;
-		}
+
 		skb_reserve(rcv->skb, 2);	/* Align IP on 16 byte boundaries */
 		skb_put(rcv->skb,rcv->length.h);
 		rcv->skb->dev = dev;
-- 
2.15.1

