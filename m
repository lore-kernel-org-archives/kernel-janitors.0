From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:59 +0000
Subject: [KJ] [PATCH] [RESEND] [25/29] ov511.c - vfree() checking cleanups
Message-Id: <auto-000001227502@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75744847806027349=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============75744847806027349==

ov511.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 ov511.c |   12 ++++--------
 1 files changed, 4 insertions(+), 8 deletions(-)


--- linux-2.6.10-vanilla/drivers/usb/media/ov511.c	2004-12-24 13:34:30.000000000 -0800
+++ linux-2.6.10/drivers/usb/media/ov511.c	2005-01-04 11:29:17.205392360 -0800
@@ -3908,15 +3908,11 @@
 		ov->fbuf = NULL;
 	}
 
-	if (ov->rawfbuf) {
-		vfree(ov->rawfbuf);
-		ov->rawfbuf = NULL;
-	}
+	vfree(ov->rawfbuf);
+	ov->rawfbuf = NULL;
 
-	if (ov->tempfbuf) {
-		vfree(ov->tempfbuf);
-		ov->tempfbuf = NULL;
-	}
+	vfree(ov->tempfbuf);
+	ov->tempfbuf = NULL;
 
 	for (i = 0; i < OV511_NUMSBUF; i++) {
 		if (ov->sbuf[i].data) {


--===============75744847806027349==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75744847806027349==--
