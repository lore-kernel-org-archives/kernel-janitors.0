From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 21:57:31 +0000
Subject: [KJ] [PATCH] [27/29] budget-core.c - vfree() checking cleanups
Message-Id: <41db114b.5986a736.2568.07c9@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77819542791326657=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============77819542791326657==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

budget-core.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 budget-core.c |    3 +--
 1 files changed, 1 insertion(+), 2 deletions(-)


--- linux-2.6.10-vanilla/drivers/media/dvb/ttpci/budget-core.c	2004-12-24 13:34:30.000000000 -0800
+++ linux-2.6.10/drivers/media/dvb/ttpci/budget-core.c	2005-01-04 11:33:44.000000000 -0800
@@ -411,8 +411,7 @@
 err:
 	i2c_del_adapter(&budget->i2c_adap);
 
-	if (budget->grabbing)
-		vfree(budget->grabbing);
+	vfree(budget->grabbing);
 
 	dvb_unregister_adapter (budget->dvb_adapter);
 



--===============77819542791326657==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77819542791326657==--
