From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 03 Jul 2004 15:06:09 +0000
Subject: [Kernel-janitors] [PATCH] include/linux/isicom.h MIN/MAX removal
Message-Id: <40E81ACE.4000902@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080104050102030500000403"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080104050102030500000403
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.7) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael








--------------080104050102030500000403
Content-Type: text/plain;
 name="patch-include-isicomh"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-include-isicomh"

--- linux-2.6.7-old/include/linux/isicom.h	2004-07-04 11:04:24.000000000 +0200
+++ linux-2.6.7-new/include/linux/isicom.h	2004-07-04 16:14:53.000000000 +0200
@@ -102,7 +102,6 @@
 #define ClearInterrupt(base) (inw((base)+0x0a))	
 
 #define	BOARD(line)  (((line) >> 4) & 0x3)
-#define MIN(a, b) ( (a) < (b) ? (a) : (b) )
 
 	/*	isi kill queue bitmap	*/
 	

--------------080104050102030500000403
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080104050102030500000403--
