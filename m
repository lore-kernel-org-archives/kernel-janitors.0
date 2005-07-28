From: Jerome Steunenberg <jerome@steunenberg.org>
Date: Thu, 28 Jul 2005 14:22:44 +0000
Subject: [KJ] [PATCH] drivers/video/vgastate.c
Message-Id: <42E8EA34.3020300@steunenberg.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is my first patch to kernel-janitors. Please tell me if I got it all ok
In drivers/video/vgastate.c, the calls to init_module and cleanup_module have been replaced by calls to module_init and module_exit.

Signed-off-by: Jerome Steunenberg <jerome@steunenberg.org>



--- linux-2.6.13-rc3/drivers/video/vgastate.c.orig	2005-07-25 15:09:51.000000000 +0200
+++ linux-2.6.13-rc3/drivers/video/vgastate.c	2005-07-26 10:15:32.000000000 +0200
@@ -491,8 +491,17 @@ int restore_vga (struct vgastate *state)
  }

  #ifdef MODULE
-int init_module(void) { return 0; };
-void cleanup_module(void) {};
+static int __init vgastate_init(void)
+{
+	return 0;
+}
+
+static void __exit vgastate_exit(void)
+{
+}
+
+module_init(vgastate_init);
+module_exit(vgastate_exit);
  #endif

  EXPORT_SYMBOL(save_vga);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
