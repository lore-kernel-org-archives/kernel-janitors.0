From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Sun, 04 Jan 2004 07:58:40 +0000
Subject: [Kernel-janitors] [PATCH] Check return value in
Message-Id: <20040104075840.GA23853@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132946.GE21909@eugeneteo.net>
In-Reply-To: <20040103132946.GE21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Patch compiles, and tested. Please apply.

http://www.anomalistic.org/patches/apm-check-ret-kernel_thread-fix-2.6.1-rc1-mm1.patch

diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/arch/i386/kernel/apm.c 2.6.1-rc1-mm1-fix/arch/i386/kernel/apm.c
--- 2.6.1-rc1-mm1/arch/i386/kernel/apm.c	2003-12-18 10:58:06.000000000 +0800
+++ 2.6.1-rc1-mm1-fix/arch/i386/kernel/apm.c	2004-01-04 15:53:11.000000000 +0800
@@ -1891,6 +1891,7 @@
 static int __init apm_init(void)
 {
 	struct proc_dir_entry *apm_proc;
+	int ret;
 	int i;
 
 	if (apm_info.bios.version = 0) {
@@ -2008,7 +2009,11 @@
 	if (apm_proc)
 		apm_proc->owner = THIS_MODULE;
 
-	kernel_thread(apm, NULL, CLONE_KERNEL | SIGCHLD);
+	ret = kernel_thread(apm, NULL, CLONE_KERNEL | SIGCHLD);
+	if (ret < 0) {
+		printk(KERN_ERR "apm: disabled - Unable to start kernel thread.\n");
+		return -ENODEV;
+	}
 
 	if (num_online_cpus() > 1 && !smp ) {
 		printk(KERN_NOTICE

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
