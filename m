From: Ed Cashin <ecashin@coraid.com>
Date: Wed, 24 Oct 2012 18:26:13 +0000
Subject: [PATCH] aoe: avoid using skb member after dev_queue_xmit
Message-Id: <d1523cdc8a606d65418dc242e958ff1c@coraid.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org
Cc: ecashin@coraid.com, dan.carpenter@oracle.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

After calling dev_queue_xmit it is no longer safe to access the
members of the skb.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Ed Cashin <ecashin@coraid.com>
---
 drivers/block/aoe/aoenet.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/block/aoe/aoenet.c b/drivers/block/aoe/aoenet.c
index ae56828..2e47404 100644
--- a/drivers/block/aoe/aoenet.c
+++ b/drivers/block/aoe/aoenet.c
@@ -55,12 +55,14 @@ static int
 tx(void) __must_hold(&txlock)
 {
 	struct sk_buff *skb;
+	struct net_device *ifp;
 
 	while ((skb = skb_dequeue(&skbtxq))) {
 		spin_unlock_irq(&txlock);
+		ifp = skb->dev;
 		if (dev_queue_xmit(skb) = NET_XMIT_DROP && net_ratelimit())
 			pr_warn("aoe: packet could not be sent on %s.  %s\n",
-				skb->dev ? skb->dev->name : "netif",
+				ifp ? ifp->name : "netif",
 				"consider increasing tx_queue_len");
 		spin_lock_irq(&txlock);
 	}
-- 
1.7.1

