From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 20 Sep 2019 04:56:56 +0000
Subject: [PATCH] qede: qede_fp: simplify a bit 'qede_rx_build_skb()'
Message-Id: <20190920045656.3725-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aelior@marvell.com, GR-everest-linux-l2@marvell.com, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Use 'skb_put_data()' instead of rewritting it.
This improves readability.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/qlogic/qede/qede_fp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qede/qede_fp.c b/drivers/net/ethernet/qlogic/qede/qede_fp.c
index 0ae28f0d2523..004c0bfec41d 100644
--- a/drivers/net/ethernet/qlogic/qede/qede_fp.c
+++ b/drivers/net/ethernet/qlogic/qede/qede_fp.c
@@ -779,8 +779,7 @@ qede_rx_build_skb(struct qede_dev *edev,
 			return NULL;
 
 		skb_reserve(skb, pad);
-		memcpy(skb_put(skb, len),
-		       page_address(bd->data) + offset, len);
+		skb_put_data(skb, page_address(bd->data) + offset, len);
 		qede_reuse_page(rxq, bd);
 		goto out;
 	}
-- 
2.20.1
