From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 07 Feb 2004 15:37:13 +0000
Subject: [Kernel-janitors] [PATCH] drivers/net/acenic.c MIN/MAX removal
Message-Id: <40250629.3030004@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050805040702010700020001"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------050805040702010700020001
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi!
Patch (against 2.6.3-rc1) removes unnecessary min/max macros and changes 
calls to use kernel.h macros instead.
Feedback always welcome
Michael

--------------050805040702010700020001
Content-Type: text/plain;
 name="minmax_drivers_net_acenic.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_drivers_net_acenic.patch"

--- linux-2.6.2.org/drivers/net/acenic.c	2004-02-07 15:25:57.000000000 +0100
+++ linux-2.6.2.new/drivers/net/acenic.c	2004-02-07 15:33:24.286033896 +0100
@@ -335,10 +335,6 @@
 #define ACE_PROBE_ARG				struct net_device *dev
 #endif
 
-#ifndef min_t
-#define min_t(type,a,b)	(((a)<(b))?(a):(b))
-#endif
-
 #ifndef ARCH_HAS_PREFETCHW
 #ifndef prefetchw
 #define prefetchw(x)				do{} while(0)

--------------050805040702010700020001
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------050805040702010700020001--
