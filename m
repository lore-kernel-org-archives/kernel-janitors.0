From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Jul 2017 09:30:10 +0000
Subject: [PATCH] staging: fbtft: array underflow in fbtft_request_gpios_match()
Message-Id: <20170718093010.ejsy3cgmsswmnegn@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"val" can be negative, so we'd write before the start of the
par->gpio.db[] array.

Fixes: c296d5f9957c ("staging: fbtft: core support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index b742ee786615..6d0363deba61 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -84,7 +84,7 @@ static unsigned long fbtft_request_gpios_match(struct fbtft_par *par,
 					       const struct fbtft_gpio *gpio)
 {
 	int ret;
-	long val;
+	unsigned int val;
 
 	fbtft_par_dbg(DEBUG_REQUEST_GPIOS_MATCH, par, "%s('%s')\n",
 		      __func__, gpio->name);
@@ -108,7 +108,7 @@ static unsigned long fbtft_request_gpios_match(struct fbtft_par *par,
 		par->gpio.latch = gpio->gpio;
 		return GPIOF_OUT_INIT_LOW;
 	} else if (gpio->name[0] = 'd' && gpio->name[1] = 'b') {
-		ret = kstrtol(&gpio->name[2], 10, &val);
+		ret = kstrtouint(&gpio->name[2], 10, &val);
 		if (ret = 0 && val < 16) {
 			par->gpio.db[val] = gpio->gpio;
 			return GPIOF_OUT_INIT_LOW;
