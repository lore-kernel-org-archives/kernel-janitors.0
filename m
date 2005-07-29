From: Jerome Steunenberg <jerome@steunenberg.org>
Date: Fri, 29 Jul 2005 13:45:15 +0000
Subject: [KJ] [PATCH] drivers/video/vgastate.c - remove unnecessary calls to
Message-Id: <42EA32EB.5010609@steunenberg.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Second try for this patch. Please tell me if I got it OK!
For the line wrapping, it now passes patch-tester@coderock.org, so I hope it's OK.
If not, can those of you who use Thunderbird tell me what settings you use ? Thanks

In drivers/video/vgastate.c, the unnecessary calls to init_module and cleanup_module have been removed

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

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
