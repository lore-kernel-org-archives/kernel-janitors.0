From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 21:56:41 +0000
Subject: [KJ] [PATCH] [2/29] platform.h - vfree() checking cleanups
Message-Id: <41db1119.08554fdf.2568.07ae@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28599810568627881=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============28599810568627881==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

platform.h vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 platform.h |    4 +---
 1 files changed, 1 insertion(+), 3 deletions(-)


--- linux-2.6.10-vanilla/drivers/isdn/hardware/eicon/platform.h	2004-12-24 13:35:23.000000000 -0800
+++ linux-2.6.10/drivers/isdn/hardware/eicon/platform.h	2005-01-04 11:31:54.000000000 -0800
@@ -195,9 +195,7 @@
 }
 static __inline__ void  diva_os_free   (unsigned long flags, void* ptr)
 {
-	if (ptr) {
-		vfree(ptr);
-	}
+	vfree(ptr);
 }
 
 /*



--===============28599810568627881==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28599810568627881==--
