From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 03 Jul 2004 15:05:37 +0000
Subject: [Kernel-janitors] [PATCH] drivers/char/rocket_int.h MIN/MAX removal
Message-Id: <40E81A3E.1090806@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070701030005060105000405"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------070701030005060105000405
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.7) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael








--------------070701030005060105000405
Content-Type: text/plain;
 name="patch-char-rocketinth"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-char-rocketinth"

--- linux-2.6.7-old/drivers/char/rocket_int.h	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.7-new/drivers/char/rocket_int.h	2004-07-04 15:56:26.584650312 +0200
@@ -1241,10 +1241,6 @@
 #define TTY_ROCKET_MAJOR	46
 #define CUA_ROCKET_MAJOR	47
 
-#ifndef MIN
-#define MIN(a,b)	((a) < (b) ? (a) : (b))
-#endif
-
 #ifdef PCI_VENDOR_ID_RP
 #undef PCI_VENDOR_ID_RP
 #undef PCI_DEVICE_ID_RP8OCTA

--------------070701030005060105000405
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------070701030005060105000405--
