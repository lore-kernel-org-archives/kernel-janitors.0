From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 13 Jan 2017 17:11:12 +0000
Subject: [PATCH 03/17] spi: fsl: Use kcalloc() in of_fsl_spi_get_chipselects()
Message-Id: <0b7517f1-5f9f-a002-ac59-c5921fec1eeb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1413e173-dbac-7a6e-09cb-2287300a335e@users.sourceforge.net>
In-Reply-To: <1413e173-dbac-7a6e-09cb-2287300a335e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 13 Jan 2017 13:33:02 +0100

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus reuse the corresponding function "kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/spi/spi-fsl-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-spi.c b/drivers/spi/spi-fsl-spi.c
index 8b290d9d7935..d1b26c9fe950 100644
--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -732,7 +732,7 @@ static int of_fsl_spi_get_chipselects(struct device *dev)
 		return -ENOMEM;
 	memset(pinfo->gpios, -1, ngpios * sizeof(*pinfo->gpios));
 
-	pinfo->alow_flags = kzalloc(ngpios * sizeof(*pinfo->alow_flags),
+	pinfo->alow_flags = kcalloc(ngpios, sizeof(*pinfo->alow_flags),
 				    GFP_KERNEL);
 	if (!pinfo->alow_flags) {
 		ret = -ENOMEM;
-- 
2.11.0

