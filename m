From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:34 +0000
Subject: [KJ] [PATCH] [RESEND] [2/29] platform.h - vfree() checking cleanups
Message-Id: <auto-000001227479@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91037278553913814=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============91037278553913814==

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


--===============91037278553913814==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91037278553913814==--
