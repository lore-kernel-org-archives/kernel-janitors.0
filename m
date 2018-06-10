From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 10 Jun 2018 15:34:23 +0000
Subject: [PATCH] EDAC, altera: Fix an error handling path in 'mv64x60_pci_err_probe()'
Message-Id: <20180610153423.10769-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170816050506.14541-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170816050506.14541-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: thor.thayer@linux.intel.com, bp@alien8.de, mchehab@kernel.org
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

IF 'regmap_write()' fails, we should release some resources as done in all
the other error handling paths of the function.

Fixes: e9918d7fafae ("EDAC, altera: Handle SDRAM Uncorrectable Errors on Stratix10")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/edac/altera_edac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index d0d5c4dbe097..5762c3c383f2 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -730,7 +730,8 @@ static int altr_s10_sdram_probe(struct platform_device *pdev)
 			 S10_DDR0_IRQ_MASK)) {
 		edac_printk(KERN_ERR, EDAC_MC,
 			    "Error clearing SDRAM ECC count\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err2;
 	}
 
 	if (regmap_update_bits(drvdata->mc_vbase, priv->ecc_irq_en_offset,
-- 
2.17.0

