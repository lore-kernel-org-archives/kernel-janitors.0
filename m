From: "slackfan@users.sourceforge.net" <slackfan@users.sourceforge.net>
Date: Sun, 16 Oct 2005 21:03:28 +0000
Subject: [KJ] [PATCH] arch/i386/kernel/kprobes.c
Message-Id: <4352D95D.8090308@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Anton Brondz <anton.slack@tele2.no>

*--- linux-2.6.14-rc4.orig/arch/i386/kernel/kprobes.c	2005-10-11 01:19:19.000000000 +0000*
*+++ linux-2.6.14-rc4/arch/i386/kernel/kprobes.c	2005-10-16 22:42:30.000000000 +0000*
@@ -521,11 +521,11 @@ int __kprobes longjmp_break_handler(stru
 		if (&regs->esp != jprobe_saved_esp) {
 			struct pt_regs *saved_regs  			    container_of(jprobe_saved_esp, struct pt_regs, esp);
-			printk("current esp %p does not match saved esp %p\n",
+			printk(KERN_WARN "current esp %p does not match saved esp %p\n",
 			       &regs->esp, jprobe_saved_esp);
-			printk("Saved registers for jprobe %p\n", jp);
+			printk(KERN_INFO "Saved registers for jprobe %p\n", jp);
 			show_registers(saved_regs);
-			printk("Current registers\n");
+			printk(KERN_INFO "Current registers\n");
 			show_registers(regs);
 			BUG();
 		}


Just a small patch this time. Hope it'll work.

Dinolinux

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
