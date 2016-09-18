From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 06:17:46 +0000
Subject: [PATCH 06/10] firewire-net: Rename a jump label in fwnet_send_packet()
Message-Id: <e903ed45-9a39-04f7-fb80-6c7ca46d49bf@users.sourceforge.net>
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
Date: Sat, 17 Sep 2016 22:27:52 +0200

Adjust a jump label according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firewire/net.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/firewire/net.c b/drivers/firewire/net.c
index 24725be..a0ccab3 100644
--- a/drivers/firewire/net.c
+++ b/drivers/firewire/net.c
@@ -1003,8 +1003,7 @@ static int fwnet_send_packet(struct fwnet_packet_task *ptask)
 			dec_queued_datagrams(dev);
 
 		spin_unlock_irqrestore(&dev->lock, flags);
-
-		goto out;
+		goto check_free;
 	}
 
 	fw_send_request(dev->card, &ptask->transaction,
@@ -1024,7 +1023,7 @@ static int fwnet_send_packet(struct fwnet_packet_task *ptask)
 	spin_unlock_irqrestore(&dev->lock, flags);
 
 	netif_trans_update(dev->netdev);
- out:
+ check_free:
 	if (free)
 		fwnet_free_ptask(ptask);
 
-- 
2.10.0

