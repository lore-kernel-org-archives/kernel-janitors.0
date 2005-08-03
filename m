From: Jerome Steunenberg <jerome@steunenberg.org>
Date: Wed, 03 Aug 2005 09:47:05 +0000
Subject: [KJ] [PATCH] drivers/video/vgastate.c - remove unnecessary calls to
Message-Id: <200508031147.05531.jerome@steunenberg.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24258056979537571=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42EA32EB.5010609@steunenberg.org>
In-Reply-To: <42EA32EB.5010609@steunenberg.org>
To: kernel-janitors@vger.kernel.org

--===============24258056979537571==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Third try for this patch. Now with KMail instead of Thunderbird. Please tell 
me if I got it OK!

In drivers/video/vgastate.c, the unnecessary calls to init_module and 
cleanup_module have been removed

Signed-off-by: Jerome Steunenberg <jerome@steunenberg.org>

--- linux-2.6.13-rc3/drivers/video/vgastate.c.orig	2005-07-25 15:09:51.000000000 +0200
+++ linux-2.6.13-rc3/drivers/video/vgastate.c	2005-07-29 15:03:45.000000000 +0200
@@ -490,11 +490,6 @@ int restore_vga (struct vgastate *state)
 	return 0;
 }
 
-#ifdef MODULE
-int init_module(void) { return 0; };
-void cleanup_module(void) {};
-#endif
-
 EXPORT_SYMBOL(save_vga);
 EXPORT_SYMBOL(restore_vga);
 

--===============24258056979537571==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24258056979537571==--
