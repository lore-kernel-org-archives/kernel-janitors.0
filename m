From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 21 Sep 2019 16:46:31 +0000
Subject: [PATCH] EDAC: Aspeed: Use devm_platform_ioremap_resource() in aspeed_probe()
Message-Id: <baabb9e9-a1b2-3a04-9fb6-aa632de5f722@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-edac@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>, Borislav Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>, Joel Stanley <joel@jms.id.au>, Robert Richter <rrichter@marvell.com>, Stefan Schaeckeler <sschaeck@cisco.com>, Tony Luck <tony.luck@intel.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Sep 2019 18:32:46 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/edac/aspeed_edac.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index 5634437bb39d..09a9e3de9595 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -281,16 +281,11 @@ static int aspeed_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct edac_mc_layer layers[2];
 	struct mem_ctl_info *mci;
-	struct resource *res;
 	void __iomem *regs;
 	u32 reg04;
 	int rc;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENOENT;
-
-	regs = devm_ioremap_resource(dev, res);
+	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);

--
2.23.0
