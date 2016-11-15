From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Nov 2016 09:54:34 +0000
Subject: [patch] ARM: socfpga: checking the wrong variable
Message-Id: <20161115095433.GD15424@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Tull <atull@opensource.altera.com>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a cut and paste bug.  We had intended to check "sysmgr".

Fixes: e5f8efa5c8bf ("ARM: socfpga: fpga bridge driver support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/fpga/altera-fpga2sdram.c b/drivers/fpga/altera-fpga2sdram.c
index 7ab358e..d4eeb74 100644
--- a/drivers/fpga/altera-fpga2sdram.c
+++ b/drivers/fpga/altera-fpga2sdram.c
@@ -123,7 +123,7 @@ static int alt_fpga_bridge_probe(struct platform_device *pdev)
 	}
 
 	sysmgr = syscon_regmap_lookup_by_compatible("altr,sys-mgr");
-	if (IS_ERR(priv->sdrctl)) {
+	if (IS_ERR(sysmgr)) {
 		dev_err(dev, "regmap for altr,sys-mgr lookup failed.\n");
 		return PTR_ERR(sysmgr);
 	}
