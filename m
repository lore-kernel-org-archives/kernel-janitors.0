From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 03 Jul 2004 15:05:55 +0000
Subject: [Kernel-janitors] [PATCH] drivers/char/pcxx.c MIN/MAX removal
Message-Id: <40E819EC.1030207@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010408040208040803000400"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010408040208040803000400
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.7) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael








--------------010408040208040803000400
Content-Type: text/plain;
 name="patch-char-pcxx"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-char-pcxx"

--- linux-2.6.7-old/drivers/char/pcxx.c	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.7-new/drivers/char/pcxx.c	2004-07-04 15:41:00.861381640 +0200
@@ -130,7 +130,6 @@
 int pcxx_ncook=sizeof(pcxx_cook);
 int pcxx_nbios=sizeof(pcxx_bios);
 
-#define MIN(a,b)	((a) < (b) ? (a) : (b))
 #define pcxxassert(x, msg)  if(!(x)) pcxx_error(__LINE__, msg)
 
 #define FEPTIMEOUT 200000  
@@ -626,7 +625,7 @@
 		
 		tail &= (size - 1);
 		stlen = (head >= tail) ? (size - (head - tail) - 1) : (tail - head - 1);
-		count = MIN(stlen, count);
+		count = min(stlen, count);
 		memoff(ch);
 		restore_flags(flags);
 
@@ -658,11 +657,11 @@
 		remain = tail - head - 1;
 		stlen = remain;
 	}
-	count = MIN(remain, count);
+	count = min(remain, count);
 
 	txwinon(ch);
 	while (count > 0) {
-		stlen = MIN(count, stlen);
+		stlen = min(count, stlen);
 		memcpy(ch->txptr + head, buf, stlen);
 		buf += stlen;
 		count -= stlen;

--------------010408040208040803000400
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------010408040208040803000400--
