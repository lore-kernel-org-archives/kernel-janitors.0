From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 21 Sep 2019 17:02:52 +0000
Subject: [PATCH] EDAC: BlueField: Use devm_platform_ioremap_resource() in bluefield_edac_mc_probe()
Message-Id: <cda92ed6-feb8-87a0-1477-1f784e3dc576@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-edac@vger.kernel.org, Borislav Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Richter <rrichter@marvell.com>, Shravan Kumar Ramani <sramani@mellanox.com>, Tony Luck <tony.luck@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Sep 2019 18:56:54 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/edac/bluefield_edac.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/edac/bluefield_edac.c b/drivers/edac/bluefield_edac.c
index e4736eb37bfb..0d09add30460 100644
--- a/drivers/edac/bluefield_edac.c
+++ b/drivers/edac/bluefield_edac.c
@@ -245,7 +245,6 @@ static int bluefield_edac_mc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct edac_mc_layer layers[1];
 	struct mem_ctl_info *mci;
-	struct resource *emi_res;
 	unsigned int mc_idx, dimm_count;
 	int rc, ret;

@@ -266,10 +265,6 @@ static int bluefield_edac_mc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}

-	emi_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!emi_res)
-		return -EINVAL;
-
 	layers[0].type = EDAC_MC_LAYER_SLOT;
 	layers[0].size = dimm_count;
 	layers[0].is_virt_csrow = true;
@@ -281,7 +276,7 @@ static int bluefield_edac_mc_probe(struct platform_device *pdev)
 	priv = mci->pvt_info;

 	priv->dimm_per_mc = dimm_count;
-	priv->emi_base = devm_ioremap_resource(dev, emi_res);
+	priv->emi_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->emi_base)) {
 		dev_err(dev, "failed to map EMI IO resource\n");
 		ret = PTR_ERR(priv->emi_base);
--
2.23.0
