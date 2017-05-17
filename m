From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 17 May 2017 11:54:29 +0000
Subject: [PATCH 1/2] spi-bfin5xx: Delete an error message for a failed memory allocation in bfin_spi_setup()
Message-Id: <e3b3b509-7db7-ac85-c2ff-3a02d7cd900d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f8ad3eb5-d6aa-3e82-1265-a63ed2c7cb88@users.sourceforge.net>
In-Reply-To: <f8ad3eb5-d6aa-3e82-1265-a63ed2c7cb88-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 17 May 2017 13:00:34 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/spi/spi-bfin5xx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-bfin5xx.c b/drivers/spi/spi-bfin5xx.c
index 249c7a3677c9..3265f4967d2b 100644
--- a/drivers/spi/spi-bfin5xx.c
+++ b/drivers/spi/spi-bfin5xx.c
@@ -983,6 +983,5 @@ static int bfin_spi_setup(struct spi_device *spi)
 		chip = kzalloc(sizeof(*chip), GFP_KERNEL);
 		if (!chip) {
-			dev_err(&spi->dev, "cannot allocate chip data\n");
 			ret = -ENOMEM;
 			goto error;
 		}
-- 
2.13.0

