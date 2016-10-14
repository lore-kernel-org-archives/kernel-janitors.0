From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Oct 2016 07:32:24 +0000
Subject: [patch] [media] st-hva: fix some error handling in hva_hw_probe()
Message-Id: <20161014072928.GB15168@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Christophe Trotin <jean-christophe.trotin@st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The devm_ioremap_resource() returns error pointers, never NULL.  The
platform_get_resource() returns NULL on error, never error pointers.
The error code needs to be set, as well.  The current code returns
PTR_ERR(NULL) which is success.

Fixes: 57b2c0628b60 ("[media] st-hva: multi-format video encoder V4L2 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/platform/sti/hva/hva-hw.c b/drivers/media/platform/sti/hva/hva-hw.c
index d341d49..cf2a8d8 100644
--- a/drivers/media/platform/sti/hva/hva-hw.c
+++ b/drivers/media/platform/sti/hva/hva-hw.c
@@ -305,16 +305,16 @@ int hva_hw_probe(struct platform_device *pdev, struct hva_dev *hva)
 	/* get memory for registers */
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	hva->regs = devm_ioremap_resource(dev, regs);
-	if (IS_ERR_OR_NULL(hva->regs)) {
+	if (IS_ERR(hva->regs)) {
 		dev_err(dev, "%s     failed to get regs\n", HVA_PREFIX);
 		return PTR_ERR(hva->regs);
 	}
 
 	/* get memory for esram */
 	esram = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (IS_ERR_OR_NULL(esram)) {
+	if (!esram) {
 		dev_err(dev, "%s     failed to get esram\n", HVA_PREFIX);
-		return PTR_ERR(esram);
+		return -ENODEV;
 	}
 	hva->esram_addr = esram->start;
 	hva->esram_size = resource_size(esram);
