From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:40 +0000
Subject: [KJ] [PATCH] [RESEND] [8/29] av7110_ipack.c - vfree() checking
Message-Id: <auto-000001227484@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59487580984021893=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============59487580984021893==

av7110_ipack.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 av7110_ipack.c |    3 +--
 1 files changed, 1 insertion(+), 2 deletions(-)


--- linux-2.6.10-vanilla/drivers/media/dvb/ttpci/av7110_ipack.c	2004-12-24 13:34:32.000000000 -0800
+++ linux-2.6.10/drivers/media/dvb/ttpci/av7110_ipack.c	2005-01-04 11:34:16.000000000 -0800
@@ -37,8 +37,7 @@
 
 void av7110_ipack_free(struct ipack * p)
 {
-	if (p->buf)
-		vfree(p->buf);
+	vfree(p->buf);
 }
 
 


--===============59487580984021893==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59487580984021893==--
