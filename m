From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 10:25:52 +0000
Subject: [PATCH 4/4] sgi-xpnet: Adjust five checks for null pointers
Message-Id: <59002d3f-49f1-dcfb-4e9d-aee6f24d29f0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f1f2d65f-940f-f835-db4e-878e911f6011@users.sourceforge.net>
In-Reply-To: <f1f2d65f-940f-f835-db4e-878e911f6011@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Cliff Whickman <cpw@sgi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin Holt <robinmholt@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 11:00:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/sgi-xp/xpnet.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/sgi-xp/xpnet.c b/drivers/misc/sgi-xp/xpnet.c
index 088c96a883f9..038d6bd59840 100644
--- a/drivers/misc/sgi-xp/xpnet.c
+++ b/drivers/misc/sgi-xp/xpnet.c
@@ -260,8 +260,7 @@ xpnet_connection_activity(enum xp_retval reason, short partid, int channel,
 
 	switch (reason) {
 	case xpMsgReceived:	/* message received */
-		DBUG_ON(data = NULL);
-
+		DBUG_ON(!data);
 		xpnet_receive(partid, channel, (struct xpnet_message *)data);
 		break;
 
@@ -341,8 +340,7 @@ xpnet_send_completed(enum xp_retval reason, short partid, int channel,
 {
 	struct xpnet_pending_msg *queued_msg = (struct xpnet_pending_msg *)__qm;
 
-	DBUG_ON(queued_msg = NULL);
-
+	DBUG_ON(!queued_msg);
 	dev_dbg(xpnet, "message to %d notified with reason %d\n",
 		partid, reason);
 
@@ -425,7 +423,7 @@ xpnet_dev_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	 * remain, release the skb.
 	 */
 	queued_msg = kmalloc(sizeof(*queued_msg), GFP_ATOMIC);
-	if (queued_msg = NULL) {
+	if (!queued_msg) {
 		dev->stats.tx_errors++;
 		goto free_skb;
 	}
@@ -516,7 +514,7 @@ xpnet_init(void)
 
 	xpnet_broadcast_partitions = kzalloc(BITS_TO_LONGS(xp_max_npartitions) *
 					     sizeof(long), GFP_KERNEL);
-	if (xpnet_broadcast_partitions = NULL)
+	if (!xpnet_broadcast_partitions)
 		return -ENOMEM;
 
 	/*
@@ -525,7 +523,7 @@ xpnet_init(void)
 	 */
 	xpnet_device = alloc_netdev(0, XPNET_DEVICE_NAME, NET_NAME_UNKNOWN,
 				    ether_setup);
-	if (xpnet_device = NULL) {
+	if (!xpnet_device) {
 		kfree(xpnet_broadcast_partitions);
 		return -ENOMEM;
 	}
-- 
2.15.1

