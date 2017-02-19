From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 19 Feb 2017 09:35:05 +0000
Subject: [PATCH] qlcnic: Fix a memory leak in error handling path
Message-Id: <20170219093505.8620-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: harish.patil@cavium.com, manish.chopra@cavium.com, Dept-GELinuxNICDev@cavium.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'dma_alloc_coherent()' fails, we should release resources allocated so
far, just as done in all other cases in this function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
checkpatch.pl complains about '= NULL'. I have left it as-is because both
'= NULL' and '!' are already used in the file.
---
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c
index daf05155b732..d344e9d43832 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c
@@ -573,8 +573,10 @@ int qlcnic_alloc_hw_resources(struct qlcnic_adapter *adapter)
 		ptr = (__le32 *)dma_alloc_coherent(&pdev->dev, sizeof(u32),
 						   &tx_ring->hw_cons_phys_addr,
 						   GFP_KERNEL);
-		if (ptr = NULL)
-			return -ENOMEM;
+		if (ptr = NULL) {
+			err = -ENOMEM;
+			goto err_out_free;
+		}
 
 		tx_ring->hw_consumer = ptr;
 		/* cmd desc ring */
-- 
2.9.3

