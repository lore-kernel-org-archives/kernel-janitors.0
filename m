From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 21:57:28 +0000
Subject: [KJ] [PATCH] [25/29] ov511.c - vfree() checking cleanups
Message-Id: <41db1148.349d044c.2568.07c7@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29813996829062073=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============29813996829062073==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

ov511.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 ov511.c |   12 ++++--------
 1 files changed, 4 insertions(+), 8 deletions(-)


--- linux-2.6.10-vanilla/drivers/usb/media/ov511.c	2004-12-24 13:34:30.000000000 -0800
+++ linux-2.6.10/drivers/usb/media/ov511.c	2005-01-04 11:29:17.205392360 -0800
@@ -3908,15 +3908,11 @@
 		ov->fbuf  	}
 
-	if (ov->rawfbuf) {
-		vfree(ov->rawfbuf);
-		ov->rawfbuf -	}
+	vfree(ov->rawfbuf);
+	ov->rawfbuf  
-	if (ov->tempfbuf) {
-		vfree(ov->tempfbuf);
-		ov->tempfbuf -	}
+	vfree(ov->tempfbuf);
+	ov->tempfbuf  
 	for (i  		if (ov->sbuf[i].data) {



--===============29813996829062073==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29813996829062073==--
