From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 31 Jul 2019 08:06:48 +0000
Subject: [PATCH 2/2] net: ag71xx: Use GFP_KERNEL instead of GFP_ATOMIC in 'ag71xx_rings_init()'
Message-Id: <75ee52ae065ce9cb1f32d88939b166773316dc45.1564560130.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1564560130.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1564560130.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jcliburn@gmail.com, davem@davemloft.net, chris.snook@gmail.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is no need to use GFP_ATOMIC here, GFP_KERNEL should be enough.
The 'kcalloc()' just a few lines above, already uses GFP_KERNEL.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I've done my best to check if a spinlock can be hold when reaching this
code. Apparently it is never the case.
But double check to be sure that it is not the kcalloc that should use
GFP_ATOMIC.
---
 drivers/net/ethernet/atheros/ag71xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index 40a8717f51b1..7548247455d7 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -1141,7 +1141,7 @@ static int ag71xx_rings_init(struct ag71xx *ag)
 
 	tx->descs_cpu = dma_alloc_coherent(&ag->pdev->dev,
 					   ring_size * AG71XX_DESC_SIZE,
-					   &tx->descs_dma, GFP_ATOMIC);
+					   &tx->descs_dma, GFP_KERNEL);
 	if (!tx->descs_cpu) {
 		kfree(tx->buf);
 		tx->buf = NULL;
-- 
2.20.1
