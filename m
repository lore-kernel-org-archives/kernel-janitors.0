From: Daniele Venzano <venza@brownhat.org>
Date: Fri, 23 Jan 2009 10:39:35 +0000
Subject: Re: [PATCH] Fix warning in aty128fb
Message-Id: <20090123103935.GA31264@milesteg.arr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090120161859.GA31365@milesteg.arr>
In-Reply-To: <20090120161859.GA31365@milesteg.arr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I changed the patch to not define backlight only in case the driver is
compiled as module. Now it compiles both statically or as module without
errors or warnings.

Patch is against 2.6.28.1

Signed-off-by: Daniele Venzano <venza@brownhat.org>

--- linux-2.6.28.1/drivers/video/aty/aty128fb.c.old	2009-01-20 16:08:06.000000000 +0100
+++ linux-2.6.28.1/drivers/video/aty/aty128fb.c	2009-01-23 11:34:16.000000000 +0100
@@ -360,8 +360,10 @@ static int mtrr = 1;
 #ifdef CONFIG_PMAC_BACKLIGHT
 static int backlight __devinitdata = 1;
 #else
+#ifndef MODULE
 static int backlight __devinitdata = 0;
 #endif
+#endif
 
 /* PLL constants */
 struct aty128_constants {


