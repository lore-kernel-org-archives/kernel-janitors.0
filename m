From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 07 Feb 2004 15:37:05 +0000
Subject: [Kernel-janitors] [PATCH] drivers/video/pm2fb.c MIN/MAX removal
Message-Id: <40250621.2090405@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030004060704020604030306"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
In-Reply-To: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------030004060704020604030306
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi!
Patch (against 2.6.3-rc1) removes unnecessary min/max macros and changes 
calls to use kernel.h macros instead.
Feedback always welcome
Michael

ps: file didnt compile before, maybe thats my next task ;-)
But there are still more min/max macros lyings around, so feedback on 
those first patches is really welcome!

--------------030004060704020604030306
Content-Type: text/plain;
 name="minmax_drivers_video.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_drivers_video.patch"

--- linux-2.6.2.org/drivers/video/pm2fb.c	2004-02-04 04:45:07.000000000 +0100
+++ linux-2.6.2.new/drivers/video/pm2fb.c	2004-02-06 14:16:50.000000000 +0100
@@ -100,14 +100,6 @@
 #define DEFRW()		mb()
 #endif
 
-#ifndef MIN
-#define MIN(a,b) ((a)<(b)?(a):(b))
-#endif
-
-#ifndef MAX
-#define MAX(a,b) ((a)>(b)?(a):(b))
-#endif
-
 #define VIDEO_MASK	0x00011e7f	/* r/w values for VIDEO_CONTROL */
 
 #define PM2FF_ACCEL		(1L<<0)
@@ -1847,8 +1839,8 @@
 	if (pm2fb_options.flags & OPTF_YPAN) {
 		i->current_par.height=i->regions.fb_size/
 			(i->current_par.width*i->current_par.depth/8);
-		i->current_par.height=MIN(i->current_par.height,2047);
-		i->current_par.height=MAX(i->current_par.height,
+		i->current_par.height=min(i->current_par.height,(u32)2047);
+		i->current_par.height=max(i->current_par.height,
 					  pm2fb_options.user_mode.height);
 	}
 }

--------------030004060704020604030306
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------030004060704020604030306--
