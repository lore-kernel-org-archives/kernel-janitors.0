From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 13 Jan 2017 17:18:15 +0000
Subject: [PATCH 09/17] spi/ppc4xx: Combine substrings for a message in spi_ppc4xx_of_probe()
Message-Id: <e5ef99cc-fa83-8001-aeba-5d2f7852bd40@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1413e173-dbac-7a6e-09cb-2287300a335e@users.sourceforge.net>
In-Reply-To: <1413e173-dbac-7a6e-09cb-2287300a335e-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 13 Jan 2017 14:43:06 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: quoted string split across lines

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/spi/spi-ppc4xx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-ppc4xx.c b/drivers/spi/spi-ppc4xx.c
index e0c39734d6ef..967d94844b30 100644
--- a/drivers/spi/spi-ppc4xx.c
+++ b/drivers/spi/spi-ppc4xx.c
@@ -428,8 +428,9 @@ static int spi_ppc4xx_of_probe(struct platform_device *op)
 				/* Real CS - set the initial state. */
 				ret = gpio_request(gpio, np->name);
 				if (ret < 0) {
-					dev_err(dev, "can't request gpio "
-							"#%d: %d\n", i, ret);
+					dev_err(dev,
+						"can't request gpio #%d: %d\n",
+						i, ret);
 					goto free_gpios;
 				}
 
-- 
2.11.0

