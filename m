From: "Shakthi Kannan" <shakthimaan@gmail.com>
Date: Fri, 18 Aug 2006 17:59:07 +0000
Subject: [KJ] [PATCH] alpha/math-emu/math.c: init,
Message-Id: <d16b1c80608181048n2cc593f6ldb04e154fb58aa6e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,

This is my first patch. Let me know if there are any mistakes. This
patch has been created against linux-2.6.18-rc4. I am using quilt to
manage patches.

Description:
Changed init_module, cleanup_module in arch/alpha/math-emu/math.c to
use module_init, module_exit.

Index: linux-2.6.17/arch/alpha/math-emu/math.c
=================================--- linux-2.6.17.orig/arch/alpha/math-emu/math.c	2006-06-18
07:19:35.000000000 +0530
+++ linux-2.6.17/arch/alpha/math-emu/math.c	2006-08-18 22:54:36.000000000 +0530
@@ -62,7 +62,7 @@
 long do_alpha_fp_emul_imprecise(struct pt_regs *, unsigned long);
 long do_alpha_fp_emul(unsigned long);

-int init_module(void)
+static int __init math_emu_init(void)
 {
 	save_emul_imprecise = alpha_fp_emul_imprecise;
 	save_emul = alpha_fp_emul;
@@ -71,12 +71,15 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit math_emu_exit(void)
 {
 	alpha_fp_emul_imprecise = save_emul_imprecise;
 	alpha_fp_emul = save_emul;
 }

+module_init(math_emu_init);
+module_exit(math_emu_exit);
+
 #undef  alpha_fp_emul_imprecise
 #define alpha_fp_emul_imprecise		do_alpha_fp_emul_imprecise
 #undef  alpha_fp_emul


Regards,

Shakthi

-- 
Shakthi Kannan
http://www.shakthimaan.com
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
