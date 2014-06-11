From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jun 2014 06:04:33 +0000
Subject: [patch] char: xilinx_hwicap: missing error code if ioremap() fails
Message-Id: <20140611060433.GB7569@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Return -ENOMEM instead of success if ioremap() fails.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff, I can't compile this.

diff --git a/drivers/char/xilinx_hwicap/xilinx_hwicap.c b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
index f6345f9..9b1a5ac 100644
--- a/drivers/char/xilinx_hwicap/xilinx_hwicap.c
+++ b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
@@ -661,6 +661,7 @@ static int hwicap_setup(struct device *dev, int id,
 	drvdata->base_address = ioremap(drvdata->mem_start, drvdata->mem_size);
 	if (!drvdata->base_address) {
 		dev_err(dev, "ioremap() failed\n");
+		retval = -ENOMEM;
 		goto failed2;
 	}
 
