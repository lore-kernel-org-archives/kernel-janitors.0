From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:42 +0000
Subject: [KJ] [PATCH] [RESEND] [10/29] ymfpci_main.c - vfree() checking
Message-Id: <auto-000001227487@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20502108444171885=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============20502108444171885==

ymfpci_main.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 ymfpci_main.c |    3 +--
 1 files changed, 1 insertion(+), 2 deletions(-)


--- linux-2.6.10-vanilla/sound/pci/ymfpci/ymfpci_main.c	2004-12-24 13:35:25.000000000 -0800
+++ linux-2.6.10/sound/pci/ymfpci/ymfpci_main.c	2005-01-04 11:22:00.390798272 -0800
@@ -2065,8 +2065,7 @@
 #endif
 
 #ifdef CONFIG_PM
-	if (chip->saved_regs)
-		vfree(chip->saved_regs);
+	vfree(chip->saved_regs);
 #endif
 	if (chip->mpu_res) {
 		release_resource(chip->mpu_res);


--===============20502108444171885==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20502108444171885==--
