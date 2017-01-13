From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 13 Jan 2017 17:13:32 +0000
Subject: [PATCH 05/17] spi: fsl: Combine substrings for two messages
Message-Id: <0ff54345-a877-fe39-0aa2-a3db617fba38@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1413e173-dbac-7a6e-09cb-2287300a335e@users.sourceforge.net>
In-Reply-To: <1413e173-dbac-7a6e-09cb-2287300a335e-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 13 Jan 2017 13:50:21 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: quoted string split across lines

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/spi/spi-fsl-spi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-fsl-spi.c b/drivers/spi/spi-fsl-spi.c
index cdee556037f9..0fc3452652ae 100644
--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -267,10 +267,9 @@ static int fsl_spi_setup_transfer(struct spi_device *spi,
 	if ((mpc8xxx_spi->spibrg / hz) > 64) {
 		cs->hw_mode |= SPMODE_DIV16;
 		pm = (mpc8xxx_spi->spibrg - 1) / (hz * 64) + 1;
-
-		WARN_ONCE(pm > 16, "%s: Requested speed is too low: %d Hz. "
-			  "Will use %d Hz instead.\n", dev_name(&spi->dev),
-			  hz, mpc8xxx_spi->spibrg / 1024);
+		WARN_ONCE(pm > 16,
+			  "%s: Requested speed is too low: %d Hz. Will use %d Hz instead.\n",
+			  dev_name(&spi->dev), hz, mpc8xxx_spi->spibrg / 1024);
 		if (pm > 16)
 			pm = 16;
 	} else {
@@ -763,8 +762,9 @@ static int of_fsl_spi_get_chipselects(struct device *dev)
 		ret = gpio_direction_output(pinfo->gpios[i],
 					    pinfo->alow_flags[i]);
 		if (ret) {
-			dev_err(dev, "can't set output direction for gpio "
-				"#%d: %d\n", i, ret);
+			dev_err(dev,
+				"can't set output direction for gpio #%d: %d\n",
+				i, ret);
 			goto err_loop;
 		}
 	}
-- 
2.11.0

