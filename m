From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 13 Jan 2017 17:12:23 +0000
Subject: [PATCH 04/17] spi: fsl: Use kmalloc_array() in of_fsl_spi_get_chipselects()
Message-Id: <2abbbc08-f5bf-28de-e513-5f1074996189@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1413e173-dbac-7a6e-09cb-2287300a335e@users.sourceforge.net>
In-Reply-To: <1413e173-dbac-7a6e-09cb-2287300a335e-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 13 Jan 2017 13:37:25 +0100

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/spi/spi-fsl-spi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-spi.c b/drivers/spi/spi-fsl-spi.c
index d1b26c9fe950..cdee556037f9 100644
--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -727,7 +727,8 @@ static int of_fsl_spi_get_chipselects(struct device *dev)
 		return 0;
 	}
 
-	pinfo->gpios = kmalloc(ngpios * sizeof(*pinfo->gpios), GFP_KERNEL);
+	pinfo->gpios = kmalloc_array(ngpios, sizeof(*pinfo->gpios),
+				     GFP_KERNEL);
 	if (!pinfo->gpios)
 		return -ENOMEM;
 	memset(pinfo->gpios, -1, ngpios * sizeof(*pinfo->gpios));
-- 
2.11.0

