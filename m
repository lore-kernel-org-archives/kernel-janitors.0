From: Daniele Venzano <venza@brownhat.org>
Date: Tue, 20 Jan 2009 16:18:59 +0000
Subject: [PATCH] Fix warning in aty128fb
Message-Id: <20090120161859.GA31365@milesteg.arr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vkogqOf2sHV7VnPd"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The attached patch fixes a "defined but not used" warning in aty128fb
when CONFIG_PMAC_BACKLIGHT is not defined. Made against 2.6.28.1.

If all is well I think I will make other similar patches, fixing warnings
and errors found with randconfig.

Signed-off-by: Daniele Venzano <venza@brownhat.org>


--vkogqOf2sHV7VnPd
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="aty128fb_fix_warning.diff"

--- linux-2.6.28.1/drivers/video/aty/aty128fb.c.old	2009-01-20 16:08:06.000000000 +0100
+++ linux-2.6.28.1/drivers/video/aty/aty128fb.c	2009-01-20 16:08:13.000000000 +0100
@@ -359,8 +359,6 @@ static int mtrr = 1;
 
 #ifdef CONFIG_PMAC_BACKLIGHT
 static int backlight __devinitdata = 1;
-#else
-static int backlight __devinitdata = 0;
 #endif
 
 /* PLL constants */

--vkogqOf2sHV7VnPd--
