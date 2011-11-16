From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Nov 2011 08:21:38 +0000
Subject: [patch -next] 6LoWPAN: double free in lowpan_fragment_xmit()
Message-Id: <20111116082138.GA10264@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
Cc: Sergey Lapin <slapin@ossfans.org>, "David S. Miller" <davem@davemloft.net>, linux-zigbee-devel@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

dev_queue_xmit() consumes its own skb, so the call to dev_kfree_skb()
ieee802154/6lowpan.clowpan_fragment_xmits a double free.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/ieee802154/6lowpan.c b/net/ieee802154/6lowpan.c
index 602f318..e4ecc1e 100644
--- a/net/ieee802154/6lowpan.c
+++ b/net/ieee802154/6lowpan.c
@@ -980,9 +980,6 @@ lowpan_fragment_xmit(struct sk_buff *skb, u8 *head,
 
 	ret = dev_queue_xmit(frag);
 
-	if (ret < 0)
-		dev_kfree_skb(frag);
-
 	return ret;
 }
 
