From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jun 2012 06:53:09 +0000
Subject: [patch -next] 6lowpan: double unlock on an error path
Message-Id: <20120627065309.GA25774@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-zigbee-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>

We already unlocked a few lines earlier here, so we can go directly to
drop without passing through unlock.  This was introduced recently in
c5d3687f6c ('6lowpan: read data from skb safely').

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/ieee802154/6lowpan.c b/net/ieee802154/6lowpan.c
index ad0c226..cd5007f 100644
--- a/net/ieee802154/6lowpan.c
+++ b/net/ieee802154/6lowpan.c
@@ -771,7 +771,7 @@ lowpan_process_data(struct sk_buff *skb)
 			kfree(frame);
 
 			if (lowpan_fetch_skb_u8(skb, &iphc0))
-				goto unlock_and_drop;
+				goto drop;
 
 			break;
 		}
