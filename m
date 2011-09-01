From: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
Date: Thu, 01 Sep 2011 11:16:52 +0000
Subject: [PATCH 1/1 -next] 6LoWPAN: fix skb_copy call
Message-Id: <1314879675-31989-1-git-send-email-alex.bluesman.smirnov@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
Cc: eric.dumazet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-zigbee-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org

This patch fixes 2 issues in lowpan_skb_deliver function:
1. Check for return status of skb_copy call;
2. Use skb_copy with proper GFP flag depending on context.

Signed-off-by: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
---
 net/ieee802154/6lowpan.c |   18 +++++++++++++++---
 1 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/net/ieee802154/6lowpan.c b/net/ieee802154/6lowpan.c
index cf304cc..cac1361 100644
--- a/net/ieee802154/6lowpan.c
+++ b/net/ieee802154/6lowpan.c
@@ -477,9 +477,15 @@ static int lowpan_skb_deliver(struct sk_buff *skb, struct ipv6hdr *hdr)
 	struct sk_buff *new;
 	struct lowpan_dev_record *entry;
 	int stat = NET_RX_SUCCESS;
+	gfp_t mask;
 
-	new = skb_copy_expand(skb, sizeof(struct ipv6hdr), skb_tailroom(skb),
-								GFP_KERNEL);
+	if (in_interrupt())
+		mask = GFP_ATOMIC;
+	else
+		mask = GFP_KERNEL;
+
+	new = skb_copy_expand(skb, sizeof(struct ipv6hdr),
+					skb_tailroom(skb), mask);
 	kfree_skb(skb);
 
 	if (NULL = new)
@@ -495,7 +501,13 @@ static int lowpan_skb_deliver(struct sk_buff *skb, struct ipv6hdr *hdr)
 	rcu_read_lock();
 	list_for_each_entry_rcu(entry, &lowpan_devices, list)
 		if (lowpan_dev_info(entry->ldev)->real_dev = new->dev) {
-			skb = skb_copy(new, GFP_KERNEL);
+			skb = skb_copy(new, mask);
+
+			if (NULL = skb) {
+				kfree_skb(new);
+				return -ENOMEM;
+			}
+
 			skb->dev = entry->ldev;
 
 			if (in_interrupt())
-- 
1.7.2.5

