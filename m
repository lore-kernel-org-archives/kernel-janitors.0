From: mikal@stillhq.com
Date: Thu, 18 Mar 2004 01:04:02 +0000
Subject: [Kernel-janitors] [Trivial Patch] kernel-doc comment tweak
Message-Id: <200403180104.i2I142h31149@diskbox.stillhq.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200403180103.i2I13vI31101@diskbox.stillhq.com>
In-Reply-To: <200403180103.i2I13vI31101@diskbox.stillhq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Correct kernel-doc comment with incorrect parameters documented

Meta data:
Author: Michael Still
Email: mikal@stillhq.com
Kernel version: applies to 2.6.5-rc1





diff -Nur linux-2.6.2-rc1-cset-20040125_0129/arch/sh/boards/dreamcast/rtc.c linux-2.6.2-rc1-cset-20040125_0129-params/arch/sh/boards/dreamcast/rtc.c
--- linux-2.6.2-rc1-cset-20040125_0129/arch/sh/boards/dreamcast/rtc.c	2004-01-26 09:24:53.000000000 +1100
+++ linux-2.6.2-rc1-cset-20040125_0129-params/arch/sh/boards/dreamcast/rtc.c	2004-01-27 08:51:33.000000000 +1100
@@ -28,7 +28,7 @@
 
 /**
  * aica_rtc_gettimeofday - Get the time from the AICA RTC
- * @tv: pointer to resulting timeval
+ * @ts: pointer to resulting timespec
  *
  * Grabs the current RTC seconds counter and adjusts it to the Unix Epoch.
  */
@@ -51,7 +51,7 @@
 
 /**
  * aica_rtc_settimeofday - Set the AICA RTC to the current time
- * @tv: contains the timeval to set
+ * @secs: contains the time_t to set
  *
  * Adjusts the given @tv to the AICA Epoch and sets the RTC seconds counter.
  */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
