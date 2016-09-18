From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 06:12:45 +0000
Subject: [PATCH 02/10] firewire-net: Rename a jump label in fwnet_broadcast_start()
Message-Id: <1f06a795-8595-9f3d-7eb3-28c9d6c5289c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <cb0935d1-4a50-5a1c-a4f2-23937560abf5@users.sourceforge.net>
In-Reply-To: <cb0935d1-4a50-5a1c-a4f2-23937560abf5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux1394-devel@lists.sourceforge.net, Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 17 Sep 2016 22:02:44 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firewire/net.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/firewire/net.c b/drivers/firewire/net.c
index 7911f13..89afed3 100644
--- a/drivers/firewire/net.c
+++ b/drivers/firewire/net.c
@@ -1106,7 +1106,7 @@ static int fwnet_broadcast_start(struct fwnet_device *dev)
 	ptrptr = kmalloc_array(num_packets, sizeof(*ptrptr), GFP_KERNEL);
 	if (!ptrptr) {
 		retval = -ENOMEM;
-		goto failed;
+		goto stop_broadcast;
 	}
 	dev->broadcast_rcv_buffer_ptrs = ptrptr;
 
@@ -1116,13 +1116,13 @@ static int fwnet_broadcast_start(struct fwnet_device *dev)
 					fwnet_receive_broadcast, dev);
 	if (IS_ERR(context)) {
 		retval = PTR_ERR(context);
-		goto failed;
+		goto stop_broadcast;
 	}
 
 	retval = fw_iso_buffer_init(&dev->broadcast_rcv_buffer, dev->card,
 				    FWNET_ISO_PAGE_COUNT, DMA_FROM_DEVICE);
 	if (retval < 0)
-		goto failed;
+		goto stop_broadcast;
 
 	dev->broadcast_state = FWNET_BROADCAST_STOPPED;
 
@@ -1148,7 +1148,7 @@ static int fwnet_broadcast_start(struct fwnet_device *dev)
 		retval = fw_iso_context_queue(context, &packet,
 				&dev->broadcast_rcv_buffer, offset);
 		if (retval < 0)
-			goto failed;
+			goto stop_broadcast;
 
 		offset += max_receive;
 	}
@@ -1158,7 +1158,7 @@ static int fwnet_broadcast_start(struct fwnet_device *dev)
 	retval = fw_iso_context_start(context, -1, 0,
 			FW_ISO_CONTEXT_MATCH_ALL_TAGS); /* ??? sync */
 	if (retval < 0)
-		goto failed;
+		goto stop_broadcast;
 
 	/* FIXME: adjust it according to the min. speed of all known peers? */
 	dev->broadcast_xmt_max_payload = IEEE1394_MAX_PAYLOAD_S100
@@ -1166,8 +1166,7 @@ static int fwnet_broadcast_start(struct fwnet_device *dev)
 	dev->broadcast_state = FWNET_BROADCAST_RUNNING;
 
 	return 0;
-
- failed:
+ stop_broadcast:
 	__fwnet_broadcast_stop(dev);
 	return retval;
 }
-- 
2.10.0

