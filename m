From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 31 Jul 2019 08:06:38 +0000
Subject: [PATCH 1/2] net: ag71xx: Slighly simplify code in 'ag71xx_rings_init()'
Message-Id: <08fbcfe0f913644fe538656221a15790a1a83f1d.1564560130.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1564560130.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1564560130.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jcliburn@gmail.com, davem@davemloft.net, chris.snook@gmail.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

A few lines above, we have:
   tx_size = BIT(tx->order);

So use 'tx_size' directly to be consistent with the way 'rx->descs_cpu' and
'rx->descs_dma' are computed below.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/atheros/ag71xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index 77542bd1e5bd..40a8717f51b1 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -1148,7 +1148,7 @@ static int ag71xx_rings_init(struct ag71xx *ag)
 		return -ENOMEM;
 	}
 
-	rx->buf = &tx->buf[BIT(tx->order)];
+	rx->buf = &tx->buf[tx_size];
 	rx->descs_cpu = ((void *)tx->descs_cpu) + tx_size * AG71XX_DESC_SIZE;
 	rx->descs_dma = tx->descs_dma + tx_size * AG71XX_DESC_SIZE;
 
-- 
2.20.1
