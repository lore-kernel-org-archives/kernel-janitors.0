From: Dan Carpenter <error27@gmail.com>
Date: Tue, 30 Aug 2011 13:51:09 +0000
Subject: [patch 3/3 -next] 6LoWPAN: call dev_put() on error in
Message-Id: <20110830135109.GJ3705@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Sergey Lapin <slapin@ossfans.org>, "David S. Miller" <davem@davemloft.net>, "open list:IEEE 802.15.4 SUB..." <linux-zigbee-devel@lists.sourceforge.net>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

We should release the dev_hold() on error before returning here.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
All three of these patches were compile tested only, but this is the
one I'm not very certain of.  I've obviously tried to get it right,
but please review it carefully.

diff --git a/net/ieee802154/6lowpan.c b/net/ieee802154/6lowpan.c
index 5dc0489..f0d1536 100644
--- a/net/ieee802154/6lowpan.c
+++ b/net/ieee802154/6lowpan.c
@@ -793,8 +793,11 @@ static int lowpan_newlink(struct net *src_net, struct net_device *dev,
 	mutex_init(&lowpan_dev_info(dev)->dev_list_mtx);
 
 	entry = kzalloc(sizeof(struct lowpan_dev_record), GFP_KERNEL);
-	if (!entry)
+	if (!entry) {
+		dev_put(real_dev);
+		lowpan_dev_info(dev)->real_dev = NULL;
 		return -ENOMEM;
+	}
 
 	entry->ldev = dev;
 
