From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 18 Oct 2018 14:15:22 +0000
Subject: [PATCH v2] edac: qcom_edac: uninitialized variable in IRQ handler
Message-Id: <20181018141522.rywdvjmlpk4ticiw@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Channagoud Kadabi <ckadabi@codeaurora.org>
Cc: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org

We forgot to initialize "irq_handled" to false.  But really it's
cleaner to just get rid of that variable and use "irq_rc" directly
instead.

Fixes: 27450653f1db ("drivers: edac: Add EDAC driver support for QCOM SoCs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Get rid of the "irq_handled" variable.

 drivers/edac/qcom_edac.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
index 82bd775124f2..97a27e42dd61 100644
--- a/drivers/edac/qcom_edac.c
+++ b/drivers/edac/qcom_edac.c
@@ -292,7 +292,6 @@ llcc_ecc_irq_handler(int irq, void *edev_ctl)
 	struct llcc_drv_data *drv = edac_dev_ctl->pvt_info;
 	irqreturn_t irq_rc = IRQ_NONE;
 	u32 drp_error, trp_error, i;
-	bool irq_handled;
 	int ret;
 
 	/* Iterate over the banks and look for Tag RAM or Data RAM errors */
@@ -311,7 +310,7 @@ llcc_ecc_irq_handler(int irq, void *edev_ctl)
 			ret = dump_syn_reg(edev_ctl, LLCC_DRAM_UE, i);
 		}
 		if (!ret)
-			irq_handled = true;
+			irq_rc = IRQ_HANDLED;
 
 		ret = regmap_read(drv->regmap,
 				  drv->offsets[i] + TRP_INTERRUPT_0_STATUS,
@@ -327,12 +326,9 @@ llcc_ecc_irq_handler(int irq, void *edev_ctl)
 			ret = dump_syn_reg(edev_ctl, LLCC_TRAM_UE, i);
 		}
 		if (!ret)
-			irq_handled = true;
+			irq_rc = IRQ_HANDLED;
 	}
 
-	if (irq_handled)
-		irq_rc = IRQ_HANDLED;
-
 	return irq_rc;
 }
 
-- 
2.11.0
