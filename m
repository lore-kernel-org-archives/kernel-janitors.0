From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 02 Nov 2017 21:18:13 +0000
Subject: [PATCH] staging: fbtft: fb_ra8875: Use common error handling code in write_reg8_bus8()
Message-Id: <47dd8732-253b-a640-1c73-2bfe626037b3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 2 Nov 2017 22:12:58 +0100

* Add a jump target so that a specific error message is stored only once
  at the end of this function implementation.

* Replace two calls of the function "dev_err" by goto statements.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/fbtft/fb_ra8875.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 6d1cad85957b..6a94b5810a31 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -218,12 +218,9 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	*buf++ = 0x80;
 	*buf = (u8)va_arg(args, unsigned int);
 	ret = par->fbtftops.write(par, par->buf, 2);
-	if (ret < 0) {
-		va_end(args);
-		dev_err(par->info->device, "write() failed and returned %dn",
-			ret);
-		return;
-	}
+	if (ret < 0)
+		goto end_va;
+
 	len--;
 
 	udelay(100);
@@ -236,18 +233,19 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 			*buf++ = (u8)va_arg(args, unsigned int);
 
 		ret = par->fbtftops.write(par, par->buf, len + 1);
-		if (ret < 0) {
-			va_end(args);
-			dev_err(par->info->device,
-				"write() failed and returned %dn", ret);
-			return;
-		}
+		if (ret < 0)
+			goto end_va;
 	}
 	va_end(args);
 
 	/* restore user spi-speed */
 	par->fbtftops.write = fbtft_write_spi;
 	udelay(100);
+	return;
+
+end_va:
+	va_end(args);
+	dev_err(par->info->device, "write() failed and returned %dn", ret);
 }
 
 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
-- 
2.15.0

