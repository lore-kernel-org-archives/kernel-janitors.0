From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 02 Nov 2017 21:30:31 +0000
Subject: [PATCH] staging: fbtft: fb_ssd1331: Use common error handling code in write_reg8_bus8()
Message-Id: <233f4d2c-e099-e097-5484-7df2770d076f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 2 Nov 2017 22:27:13 +0100

* Add a jump target so that a specific error message is stored only once
  at the end of this function implementation.

* Replace two calls of the function "dev_err" by goto statements.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/fbtft/fb_ssd1331.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1331.c b/drivers/staging/fbtft/fb_ssd1331.c
index 9aa9864fcf30..b3a8f2668951 100644
--- a/drivers/staging/fbtft/fb_ssd1331.c
+++ b/drivers/staging/fbtft/fb_ssd1331.c
@@ -76,12 +76,9 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	if (par->gpio.dc != -1)
 		gpio_set_value(par->gpio.dc, 0);
 	ret = par->fbtftops.write(par, par->buf, sizeof(u8));
-	if (ret < 0) {
-		va_end(args);
-		dev_err(par->info->device,
-			"write() failed and returned %d\n", ret);
-		return;
-	}
+	if (ret < 0)
+		goto end_va;
+
 	len--;
 
 	if (len) {
@@ -89,16 +86,17 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 		while (i--)
 			*buf++ = (u8)va_arg(args, unsigned int);
 		ret = par->fbtftops.write(par, par->buf, len * (sizeof(u8)));
-		if (ret < 0) {
-			va_end(args);
-			dev_err(par->info->device,
-				"write() failed and returned %d\n", ret);
-			return;
-		}
+		if (ret < 0)
+			goto end_va;
 	}
 	if (par->gpio.dc != -1)
 		gpio_set_value(par->gpio.dc, 1);
 	va_end(args);
+	return;
+
+end_va:
+	va_end(args);
+	dev_err(par->info->device, "write() failed and returned %d\n", ret);
 }
 
 /*
-- 
2.15.0

