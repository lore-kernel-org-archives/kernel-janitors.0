From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 07 Feb 2004 15:34:08 +0000
Subject: [Kernel-janitors] [PATCH] drivers/media/video/saa5249.c MIN/MAX
Message-Id: <40250570.4050602@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040704020407030806060107"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040704020407030806060107
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi!
Patch (against 2.6.3-rc1) removes unnecessary min/max macros and changes 
calls to use kernel.h macros instead.
Feedback always welcome
Michael

--------------040704020407030806060107
Content-Type: text/plain;
 name="minmax_drivers_media.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_drivers_media.patch"

diff -Naur linux-2.6.2.org/drivers/media/video/saa5249.c linux-2.6.2.new/drivers/media/video/saa5249.c
--- linux-2.6.2.org/drivers/media/video/saa5249.c	2004-02-04 04:44:14.000000000 +0100
+++ linux-2.6.2.new/drivers/media/video/saa5249.c	2004-02-06 12:05:41.000000000 +0100
@@ -122,10 +122,6 @@
 #define FALSE 0
 #define TRUE 1
 #endif
-#ifndef MIN
-#define MIN(a, b) ((a) < (b) ? (a) : (b))
-#define MAX(a, b) ((a) > (b) ? (a) : (b))
-#endif
 
 #define RESCHED do { cond_resched(); } while(0)
 
@@ -518,8 +514,8 @@
 			{
 				int len;
 				char buf[16];  
-				start = MAX(req->start, 32);
-				end = MIN(req->end, 39);
+				start = max(req->start, 32);
+				end = min(req->end, 39);
 				len=end-start+1;
 				if (i2c_senddata(t, 8, 0, 0, start, -1) ||
 					i2c_getdata(t, len, buf))
@@ -532,8 +528,8 @@
 			{
 				char buf[32];
 				int len;
-				start = MAX(req->start, 7);
-				end = MIN(req->end, 31);
+				start = max(req->start, 7);
+				end = min(req->end, 31);
 				len=end-start+1;
 				if (i2c_senddata(t, 8, 0, 0, start, -1) ||
 					i2c_getdata(t, len, buf))

--------------040704020407030806060107
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040704020407030806060107--
