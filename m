From: Alan Tull <atull@opensource.altera.com>
Date: Thu, 17 Nov 2016 01:54:40 +0000
Subject: [PATCH 1/1] ARM: socfpga: checking the wrong variable
Message-Id: <20161117015440.3113-2-atull@opensource.altera.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161117015440.3113-1-atull@opensource.altera.com>
In-Reply-To: <20161117015440.3113-1-atull@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Dan Carpenter <dan.carpenter@oracle.com>, kernel-janitors@vger.kernel.org, delicious.quinoa@gmail.com

From: Dan Carpenter <dan.carpenter@oracle.com>

This is a cut and paste bug.  We had intended to check "sysmgr".

Fixes: e5f8efa5c8bf ("ARM: socfpga: fpga bridge driver support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Moritz Fischer <moritz.fischer@ettus.com>
Acked-by: Alan Tull <atull@opensource.altera.com>
---
 drivers/fpga/altera-fpga2sdram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.7.4

