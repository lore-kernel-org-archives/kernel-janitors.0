From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 Jul 2014 15:36:20 +0000
Subject: [patch] mtd: ndfc: silence an array underflow static checker warning
Message-Id: <20140731153620.GH31539@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Grant Likely <grant.likely@linaro.org>, kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>

We check "cs" for array overflows but we don't check for underflows and
it upsets the static checkers.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 69eaba6..253a644 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -203,7 +203,8 @@ static int ndfc_probe(struct platform_device *ofdev)
 	struct ndfc_controller *ndfc;
 	const __be32 *reg;
 	u32 ccr;
-	int err, len, cs;
+	u32 cs;
+	int err, len;
 
 	/* Read the reg property to get the chip select */
 	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
