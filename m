From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 10:22:25 +0000
Subject: [PATCH 1/4] sgi-xpnet: Delete an error message for a failed memory allocation in two functions
Message-Id: <c85a9ea2-431c-c436-b1f6-3694bb4ebdfb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f1f2d65f-940f-f835-db4e-878e911f6011@users.sourceforge.net>
In-Reply-To: <f1f2d65f-940f-f835-db4e-878e911f6011@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Cliff Whickman <cpw@sgi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin Holt <robinmholt@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 10:46:46 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/sgi-xp/xpnet.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/misc/sgi-xp/xpnet.c b/drivers/misc/sgi-xp/xpnet.c
index 0c26eaf5f62b..e13aa6c74028 100644
--- a/drivers/misc/sgi-xp/xpnet.c
+++ b/drivers/misc/sgi-xp/xpnet.c
@@ -168,9 +168,6 @@ xpnet_receive(short partid, int channel, struct xpnet_message *msg)
 	/* reserve an extra cache line */
 	skb = dev_alloc_skb(msg->size + L1_CACHE_BYTES);
 	if (!skb) {
-		dev_err(xpnet, "failed on dev_alloc_skb(%d)\n",
-			msg->size + L1_CACHE_BYTES);
-
 		xpc_received(partid, channel, (void *)msg);
 
 		xpnet_device->stats.rx_errors++;
@@ -432,9 +429,6 @@ xpnet_dev_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	 */
 	queued_msg = kmalloc(sizeof(struct xpnet_pending_msg), GFP_ATOMIC);
 	if (queued_msg = NULL) {
-		dev_warn(xpnet, "failed to kmalloc %ld bytes; dropping "
-			 "packet\n", sizeof(struct xpnet_pending_msg));
-
 		dev->stats.tx_errors++;
 		dev_kfree_skb(skb);
 		return NETDEV_TX_OK;
-- 
2.15.1

