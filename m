From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 07 Feb 2004 15:35:23 +0000
Subject: [Kernel-janitors] [PATCH] drivers/telephony/ixj.h MIN/MAX removal
Message-Id: <402505BB.3040201@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080707030702010001090602"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080707030702010001090602
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi!
Patch (against 2.6.3-rc1) removes unnecessary min/max macros and changes 
calls to use kernel.h macros instead.
Feedback always welcome
Michael

--------------080707030702010001090602
Content-Type: text/plain;
 name="minmax_drivers_telephony.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_drivers_telephony.patch"

--- linux-2.6.2.org/drivers/telephony/ixj.h	2004-02-04 04:45:04.000000000 +0100
+++ linux-2.6.2.new/drivers/telephony/ixj.h	2004-02-06 14:39:13.000000000 +0100
@@ -60,13 +60,6 @@
 #define TRUE 1
 #define FALSE 0
 
-#ifndef min
-#define min(a,b) (((a)<(b))?(a):(b))
-#endif
-#ifndef max
-#define max(a,b) (((a)>(b))?(a):(b))
-#endif
-
 /******************************************************************************
 *
 *  This structure when unioned with the structures below makes simple byte

--------------080707030702010001090602
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080707030702010001090602--
