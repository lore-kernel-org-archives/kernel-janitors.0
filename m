From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Aug 2013 10:02:06 +0000
Subject: mtd: ndfc: silence an underflow static checker warning
Message-Id: <20130823100206.GS31293@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Bill Pemberton <wfp5p@virginia.edu>, Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org

"cs" is an index into the ndfc_ctrl[].  There is a sanity check which
does:

	if (cs >= NDFC_MAX_CS) {

It doesn't check for underflows and that upsets my static checker.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 8e148f1..cd78b81 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -201,8 +201,9 @@ static int ndfc_probe(struct platform_device *ofdev)
 {
 	struct ndfc_controller *ndfc;
 	const __be32 *reg;
+	unsigned int cs;
 	u32 ccr;
-	int err, len, cs;
+	int err, len;
 
 	/* Read the reg property to get the chip select */
 	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
