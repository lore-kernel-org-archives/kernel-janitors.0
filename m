From: Domen Puncer <domen@coderock.org>
Date: Sat, 17 Jan 2004 16:29:42 +0000
Subject: [Kernel-janitors] [patch 2.6.1] s/CONFIG_SYSRQ/CONFIG_MAGIC_SYSRQ/
Message-Id: <200401171729.42422.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi.

Noone tested that code to see if it really works?


--- c/arch/arm/kernel/process.c	2003-12-18 03:59:37.000000000 +0100
+++ a/arch/arm/kernel/process.c	2004-01-17 16:31:02.000000000 +0100
@@ -264,7 +264,7 @@
 	if (!thread)
 		thread = ll_alloc_task_struct();
 
-#ifdef CONFIG_SYSRQ
+#ifdef CONFIG_MAGIC_SYSRQ
 	/*
 	 * The stack must be cleared if you want SYSRQ-T to
 	 * give sensible stack usage information
--- c/arch/um/kernel/um_arch.c	2003-12-18 03:59:18.000000000 +0100
+++ a/arch/um/kernel/um_arch.c	2004-01-17 16:31:25.000000000 +0100
@@ -376,7 +376,7 @@
 static int panic_exit(struct notifier_block *self, unsigned long unused1,
 		      void *unused2)
 {
-#ifdef CONFIG_SYSRQ
+#ifdef CONFIG_MAGIC_SYSRQ
 	handle_sysrq('p', &current->thread.regs, NULL, NULL);
 #endif
 	machine_halt();
--- c/arch/arm26/kernel/process.c	2003-12-18 03:59:35.000000000 +0100
+++ a/arch/arm26/kernel/process.c	2004-01-17 16:31:41.000000000 +0100
@@ -257,7 +257,7 @@
 	if (!thread)
 		thread = ll_alloc_task_struct();
 
-#ifdef CONFIG_SYSRQ
+#ifdef CONFIG_MAGIC_SYSRQ
 	/*
 	 * The stack must be cleared if you want SYSRQ-T to
 	 * give sensible stack usage information

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
