From: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
Date: Thu, 01 Sep 2011 12:52:19 +0000
Subject: [PATCH v3 -next] 6LoWPAN: fix skb_copy call
Message-Id: <1314885315-4033-1-git-send-email-alex.bluesman.smirnov@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1314879675-31989-1-git-send-email-alex.bluesman.smirnov@gmail.com>
In-Reply-To: <1314879675-31989-1-git-send-email-alex.bluesman.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
Cc: eric.dumazet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-zigbee-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org

This patch fixes 2 issues in lowpan_skb_deliver function:
1. Check for return status of skb_copy call;
2. Use skb_copy with proper GFP flag, drop check for non-interrupt
context.

Signed-off-by: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
---
 net/ieee802154/6lowpan.c |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/net/ieee802154/6lowpan.c b/net/ieee802154/6lowpan.c
index cf304cc..deb2adf 100644
--- a/net/ieee802154/6lowpan.c
+++ b/net/ieee802154/6lowpan.c
@@ -479,10 +479,10 @@ static int lowpan_skb_deliver(struct sk_buff *skb, struct ipv6hdr *hdr)
 	int stat = NET_RX_SUCCESS;
 
 	new = skb_copy_expand(skb, sizeof(struct ipv6hdr), skb_tailroom(skb),
-								GFP_KERNEL);
+								GFP_ATOMIC);
 	kfree_skb(skb);
 
-	if (NULL = new)
+	if (!new)
 		return -ENOMEM;
 
 	skb_push(new, sizeof(struct ipv6hdr));
@@ -495,13 +495,14 @@ static int lowpan_skb_deliver(struct sk_buff *skb, struct ipv6hdr *hdr)
 	rcu_read_lock();
 	list_for_each_entry_rcu(entry, &lowpan_devices, list)
 		if (lowpan_dev_info(entry->ldev)->real_dev = new->dev) {
-			skb = skb_copy(new, GFP_KERNEL);
-			skb->dev = entry->ldev;
+			skb = skb_copy(new, GFP_ATOMIC);
+			if (!skb) {
+				stat = -ENOMEM;
+				break;
+			}
 
-			if (in_interrupt())
-				stat = netif_rx(skb);
-			else
-				stat = netif_rx_ni(skb);
+			skb->dev = entry->ldev;
+			stat = netif_rx(skb);
 		}
 	rcu_read_unlock();
 
-- 
1.7.2.5

