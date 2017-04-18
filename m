From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Apr 2017 19:51:51 +0000
Subject: [PATCH] esp6: Fix esp6_gso_segment()
Message-Id: <20170418195151.GA24793@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This NULL test is inverted so the function become a no-op.

Fix: 7862b4058b9f10 ("esp: Add gso handlers for esp4 and esp6")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is still in Steffen's git tree and not yet in the networking tree.

diff --git a/net/ipv6/esp6_offload.c b/net/ipv6/esp6_offload.c
index 1cceeee7cc33..95f10728abaa 100644
--- a/net/ipv6/esp6_offload.c
+++ b/net/ipv6/esp6_offload.c
@@ -120,7 +120,7 @@ static struct sk_buff *esp6_gso_segment(struct sk_buff *skb,
 	netdev_features_t esp_features = features;
 	struct xfrm_offload *xo = xfrm_offload(skb);
 
-	if (xo)
+	if (!xo)
 		goto out;
 
 	seq = xo->seq.low;
