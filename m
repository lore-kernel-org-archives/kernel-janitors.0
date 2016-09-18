From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 06:18:45 +0000
Subject: [PATCH 07/10] firewire-net: Rename a jump label in fwnet_incoming_packet()
Message-Id: <ca7f4706-4f00-0bd5-0509-5e3502f58a78@users.sourceforge.net>
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
Date: Sat, 17 Sep 2016 22:32:14 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firewire/net.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firewire/net.c b/drivers/firewire/net.c
index a0ccab3..7e802e7 100644
--- a/drivers/firewire/net.c
+++ b/drivers/firewire/net.c
@@ -621,7 +621,7 @@ static int fwnet_incoming_packet(struct fwnet_device *dev, __be32 *buf, int len,
 	peer = fwnet_peer_find_by_node_id(dev, source_node_id, generation);
 	if (!peer) {
 		retval = -ENOENT;
-		goto fail;
+		goto unlock;
 	}
 
 	pd = fwnet_pd_find(peer, datagram_label);
@@ -636,7 +636,7 @@ static int fwnet_incoming_packet(struct fwnet_device *dev, __be32 *buf, int len,
 				  dg_size, buf, fg_off, len);
 		if (pd = NULL) {
 			retval = -ENOMEM;
-			goto fail;
+			goto unlock;
 		}
 		peer->pdg_size++;
 	} else {
@@ -652,7 +652,7 @@ static int fwnet_incoming_packet(struct fwnet_device *dev, __be32 *buf, int len,
 			if (pd = NULL) {
 				peer->pdg_size--;
 				retval = -ENOMEM;
-				goto fail;
+				goto unlock;
 			}
 		} else {
 			if (!fwnet_pd_update(peer, pd, buf, fg_off, len)) {
@@ -664,7 +664,7 @@ static int fwnet_incoming_packet(struct fwnet_device *dev, __be32 *buf, int len,
 				fwnet_pd_delete(pd);
 				peer->pdg_size--;
 				retval = -ENOMEM;
-				goto fail;
+				goto unlock;
 			}
 		}
 	} /* new datagram or add to existing one */
@@ -688,7 +688,7 @@ static int fwnet_incoming_packet(struct fwnet_device *dev, __be32 *buf, int len,
 	 * moment.
 	 */
 	retval = 0;
- fail:
+ unlock:
 	spin_unlock_irqrestore(&dev->lock, flags);
 
 	return retval;
-- 
2.10.0

