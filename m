From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 10:23:40 +0000
Subject: [PATCH 2/4] sgi-xpnet: Improve a size determination in xpnet_dev_hard_start_xmit()
Message-Id: <41b59f3b-00e4-13e2-2952-50781804b52f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f1f2d65f-940f-f835-db4e-878e911f6011@users.sourceforge.net>
In-Reply-To: <f1f2d65f-940f-f835-db4e-878e911f6011@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Cliff Whickman <cpw@sgi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin Holt <robinmholt@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 10:48:25 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/sgi-xp/xpnet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/sgi-xp/xpnet.c b/drivers/misc/sgi-xp/xpnet.c
index e13aa6c74028..a4415616c03c 100644
--- a/drivers/misc/sgi-xp/xpnet.c
+++ b/drivers/misc/sgi-xp/xpnet.c
@@ -427,7 +427,7 @@ xpnet_dev_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	 * xpc_send_notifies are relying on this skb.  When none
 	 * remain, release the skb.
 	 */
-	queued_msg = kmalloc(sizeof(struct xpnet_pending_msg), GFP_ATOMIC);
+	queued_msg = kmalloc(sizeof(*queued_msg), GFP_ATOMIC);
 	if (queued_msg = NULL) {
 		dev->stats.tx_errors++;
 		dev_kfree_skb(skb);
-- 
2.15.1

