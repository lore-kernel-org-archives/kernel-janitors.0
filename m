From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 03 Jul 2004 15:05:20 +0000
Subject: [Kernel-janitors] [PATCH] drivers/char/epca.c MIN/MAX removal
Message-Id: <40E819B9.60604@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040808020401080507080107"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040808020401080507080107
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.7) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael








--------------040808020401080507080107
Content-Type: text/plain;
 name="patch-char-epca"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-char-epca"

--- linux-2.6.7-old/drivers/char/epca.c	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.7-new/drivers/char/epca.c	2004-07-04 15:29:04.543278544 +0200
@@ -74,7 +74,6 @@
 #define DIGIINFOMAJOR       35  /* For Digi specific ioctl */ 
 
 
-#define MIN(a,b)	((a) < (b) ? (a) : (b))
 #define MAXCARDS 7
 #define epcaassert(x, msg)  if (!(x)) epca_error(__LINE__, msg)
 
@@ -826,7 +825,7 @@
 			bytesAvailable will then take on this newly calculated value.
 		---------------------------------------------------------------------- */
 
-		bytesAvailable = MIN(dataLen, bytesAvailable);
+		bytesAvailable = min(dataLen, bytesAvailable);
 
 		/* First we read the data in from the file system into a temp buffer */
 
@@ -921,7 +920,7 @@
 			space; reduce the amount of data to fit the space.
 	---------------------------------------------------------------------- */
 
-	bytesAvailable = MIN(remain, bytesAvailable);
+	bytesAvailable = min(remain, bytesAvailable);
 
 	txwinon(ch);
 	while (bytesAvailable > 0) 
@@ -932,7 +931,7 @@
 			data copy fills to the end of card buffer.
 		------------------------------------------------------------------- */
 
-		dataLen = MIN(bytesAvailable, dataLen);
+		dataLen = min(bytesAvailable, dataLen);
 		memcpy(ch->txptr + head, buf, dataLen);
 		buf += dataLen;
 		head += dataLen;

--------------040808020401080507080107
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040808020401080507080107--
