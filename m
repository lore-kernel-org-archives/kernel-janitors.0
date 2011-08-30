From: Dan Carpenter <error27@gmail.com>
Date: Tue, 30 Aug 2011 13:45:52 +0000
Subject: [patch 1/3 -next] 6LoWPAN: use kfree_skb() instead of kfree()
Message-Id: <20110830134552.GH3705@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Sergey Lapin <slapin@ossfans.org>, "David S. Miller" <davem@davemloft.net>, "open list:IEEE 802.15.4 SUB..." <linux-zigbee-devel@lists.sourceforge.net>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

Use kfree_skb() to free sbk_buffs.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/ieee802154/6lowpan.c b/net/ieee802154/6lowpan.c
index cf304cc..8a9dbaa 100644
--- a/net/ieee802154/6lowpan.c
+++ b/net/ieee802154/6lowpan.c
@@ -674,7 +674,7 @@ lowpan_process_data(struct sk_buff *skb)
 							sizeof(hdr));
 	return lowpan_skb_deliver(skb, &hdr);
 drop:
-	kfree(skb);
+	kfree_skb(skb);
 	return -EINVAL;
 }
 
