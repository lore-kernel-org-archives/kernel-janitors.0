From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 02 Aug 2020 15:33:46 +0000
Subject: [PATCH] atm: he: Fix the size used in a 'dma_free_coherent()' call
Message-Id: <20200802153346.702267-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 3chas3@gmail.com
Cc: linux-atm-general@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Update the size used in 'dma_free_coherent()' in order to match the one
used in the corresponding 'dma_alloc_coherent()', in 'he_init_tpdrq()'.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/atm/he.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/atm/he.c b/drivers/atm/he.c
index 8af793f5e811..16862ac50c9e 100644
--- a/drivers/atm/he.c
+++ b/drivers/atm/he.c
@@ -1590,7 +1590,7 @@ he_stop(struct he_dev *he_dev)
 				  he_dev->tbrq_base, he_dev->tbrq_phys);
 
 	if (he_dev->tpdrq_base)
-		dma_free_coherent(&he_dev->pci_dev->dev, CONFIG_TBRQ_SIZE * sizeof(struct he_tbrq),
+		dma_free_coherent(&he_dev->pci_dev->dev, CONFIG_TBRQ_SIZE * sizeof(struct he_tpdrq),
 				  he_dev->tpdrq_base, he_dev->tpdrq_phys);
 
 	dma_pool_destroy(he_dev->tpd_pool);
-- 
2.25.1
