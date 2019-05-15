From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 May 2019 09:52:46 +0000
Subject: [PATCH] staging: kpc2000: double unlock in error handling in kpc_dma_transfer()
Message-Id: <20190515095246.GH3409@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The goto err_descr_too_many; calls unlock_engine() so this unlocks
twice.

Fixes: 7df95299b94a ("staging: kpc2000: Add DMA driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/kpc2000/kpc_dma/fileops.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/kpc2000/kpc_dma/fileops.c b/drivers/staging/kpc2000/kpc_dma/fileops.c
index 5741d2b49a7d..d96eaa5e72a6 100644
--- a/drivers/staging/kpc2000/kpc_dma/fileops.c
+++ b/drivers/staging/kpc2000/kpc_dma/fileops.c
@@ -116,13 +116,11 @@ int  kpc_dma_transfer(struct dev_private_data *priv, struct kiocb *kcb, unsigned
 	if (desc_needed >= ldev->desc_pool_cnt){
 		dev_warn(&priv->ldev->pldev->dev, "    mapped_entry_count = %d    num_descrs_needed = %d    num_descrs_avail = %d    TOO MANY to ever complete!\n", acd->mapped_entry_count, desc_needed, num_descrs_avail);
 		rv = -EAGAIN;
-		unlock_engine(ldev);
 		goto err_descr_too_many;
 	}
 	if (desc_needed > num_descrs_avail){
 		dev_warn(&priv->ldev->pldev->dev, "    mapped_entry_count = %d    num_descrs_needed = %d    num_descrs_avail = %d    Too many to complete right now.\n", acd->mapped_entry_count, desc_needed, num_descrs_avail);
 		rv = -EMSGSIZE;
-		unlock_engine(ldev);
 		goto err_descr_too_many;
 	}
 
-- 
2.20.1
