From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 06:21:14 +0000
Subject: [PATCH 09/10] firewire-net: Rename jump labels in fwnet_pd_new()
Message-Id: <01aa445f-96c0-48db-f0e4-22ba1a826fc6@users.sourceforge.net>
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
Date: Sat, 17 Sep 2016 22:48:46 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firewire/net.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/firewire/net.c b/drivers/firewire/net.c
index 6dd3174..eb7ce5e 100644
--- a/drivers/firewire/net.c
+++ b/drivers/firewire/net.c
@@ -362,18 +362,18 @@ static struct fwnet_partial_datagram *fwnet_pd_new(struct net_device *net,
 
 	new = kmalloc(sizeof(*new), GFP_ATOMIC);
 	if (!new)
-		goto fail;
+		goto exit;
 
 	INIT_LIST_HEAD(&new->fi_list);
 	fi = fwnet_frag_new(new, frag_off, frag_len);
 	if (fi = NULL)
-		goto fail_w_new;
+		goto free_new;
 
 	new->datagram_label = datagram_label;
 	new->datagram_size = dg_size;
 	new->skb = dev_alloc_skb(dg_size + LL_RESERVED_SPACE(net));
 	if (new->skb = NULL)
-		goto fail_w_fi;
+		goto free_fragment_info;
 
 	skb_reserve(new->skb, LL_RESERVED_SPACE(net));
 	new->pbuf = skb_put(new->skb, dg_size);
@@ -381,12 +381,11 @@ static struct fwnet_partial_datagram *fwnet_pd_new(struct net_device *net,
 	list_add_tail(&new->pd_link, &peer->pd_list);
 
 	return new;
-
-fail_w_fi:
+ free_fragment_info:
 	kfree(fi);
-fail_w_new:
+ free_new:
 	kfree(new);
-fail:
+ exit:
 	return NULL;
 }
 
-- 
2.10.0

