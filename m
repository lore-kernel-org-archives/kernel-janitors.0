From: Dan Carpenter <error27@gmail.com>
Date: Tue, 30 Aug 2011 13:46:40 +0000
Subject: [patch 2/3 -next] 6LoWPAN: use the _safe version of list_for_each
Message-Id: <20110830134640.GI3705@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Sergey Lapin <slapin@ossfans.org>, "David S. Miller" <davem@davemloft.net>, "open list:IEEE 802.15.4 SUB..." <linux-zigbee-devel@lists.sourceforge.net>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

When we kfree(entry) that causes a use-after-free bug so we have to
use list_for_each_entry_safe() safe here.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Curly parens are not needed here, but kernel style is to use them for
multi-line indent blocks.

diff --git a/net/ieee802154/6lowpan.c b/net/ieee802154/6lowpan.c
index cf304cc..5dc0489 100644
--- a/net/ieee802154/6lowpan.c
+++ b/net/ieee802154/6lowpan.c
@@ -813,15 +813,17 @@ static void lowpan_dellink(struct net_device *dev, struct list_head *head)
 	struct lowpan_dev_info *lowpan_dev = lowpan_dev_info(dev);
 	struct net_device *real_dev = lowpan_dev->real_dev;
 	struct lowpan_dev_record *entry;
+	struct lowpan_dev_record *tmp;
 
 	ASSERT_RTNL();
 
 	mutex_lock(&lowpan_dev_info(dev)->dev_list_mtx);
-	list_for_each_entry(entry, &lowpan_devices, list)
+	list_for_each_entry_safe(entry, tmp, &lowpan_devices, list) {
 		if (entry->ldev = dev) {
 			list_del(&entry->list);
 			kfree(entry);
 		}
+	}
 	mutex_unlock(&lowpan_dev_info(dev)->dev_list_mtx);
 
 	mutex_destroy(&lowpan_dev_info(dev)->dev_list_mtx);
