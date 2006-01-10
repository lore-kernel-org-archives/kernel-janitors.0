From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 10 Jan 2006 11:43:25 +0000
Subject: [KJ] [PATCH] printk : arm/kernel/process.c
Message-Id: <20060110114325.GE8401@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============033110383504768581=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============033110383504768581==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.15/arch/arm/kernel/process.c
===================================================================
--- linux-2.6.15.orig/arch/arm/kernel/process.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.15/arch/arm/kernel/process.c	2006-01-09 15:25:58.000000000 +0100
@@ -176,7 +176,7 @@
 	 * Tell the user!
 	 */
 	mdelay(1000);
-	printk("Reboot failed -- System halted\n");
+	printk(KERN_INFO "Reboot failed -- System halted\n");
 	while (1);
 }
 
@@ -184,24 +184,24 @@
 {
 	unsigned long flags = condition_codes(regs);
 
-	printk("CPU: %d\n", smp_processor_id());
-	print_symbol("PC is at %s\n", instruction_pointer(regs));
-	print_symbol("LR is at %s\n", regs->ARM_lr);
-	printk("pc : [<%08lx>]    lr : [<%08lx>]    %s\n"
+	printk(KERN_DEBUG "CPU: %d\n", smp_processor_id());
+	print_symbol(KERN_DEBUG "PC is at %s\n", instruction_pointer(regs));
+	print_symbol(KERN_DEBUG "LR is at %s\n", regs->ARM_lr);
+	printk(KERN_DEBUG "pc : [<%08lx>]    lr : [<%08lx>]    %s\n"
 	       "sp : %08lx  ip : %08lx  fp : %08lx\n",
 		instruction_pointer(regs),
 		regs->ARM_lr, print_tainted(), regs->ARM_sp,
 		regs->ARM_ip, regs->ARM_fp);
-	printk("r10: %08lx  r9 : %08lx  r8 : %08lx\n",
+	printk(KERN_DEBUG "r10: %08lx  r9 : %08lx  r8 : %08lx\n",
 		regs->ARM_r10, regs->ARM_r9,
 		regs->ARM_r8);
-	printk("r7 : %08lx  r6 : %08lx  r5 : %08lx  r4 : %08lx\n",
+	printk(KERN_DEBUG "r7 : %08lx  r6 : %08lx  r5 : %08lx  r4 : %08lx\n",
 		regs->ARM_r7, regs->ARM_r6,
 		regs->ARM_r5, regs->ARM_r4);
-	printk("r3 : %08lx  r2 : %08lx  r1 : %08lx  r0 : %08lx\n",
+	printk(KERN_DEBUG "r3 : %08lx  r2 : %08lx  r1 : %08lx  r0 : %08lx\n",
 		regs->ARM_r3, regs->ARM_r2,
 		regs->ARM_r1, regs->ARM_r0);
-	printk("Flags: %c%c%c%c",
+	printk(KERN_DEBUG "Flags: %c%c%c%c",
 		flags & PSR_N_BIT ? 'N' : 'n',
 		flags & PSR_Z_BIT ? 'Z' : 'z',
 		flags & PSR_C_BIT ? 'C' : 'c',
@@ -219,7 +219,7 @@
 		"	mrc p15, 0, %1, c2, c0\n"
 		"	mrc p15, 0, %2, c3, c0\n"
 		: "=r" (ctrl), "=r" (transbase), "=r" (dac));
-		printk("Control: %04X  Table: %08X  DAC: %08X\n",
+		printk(KERN_DEBUG "Control: %04X  Table: %08X  DAC: %08X\n",
 		  	ctrl, transbase, dac);
 	}
 }
@@ -227,7 +227,7 @@
 void show_regs(struct pt_regs * regs)
 {
 	printk("\n");
-	printk("Pid: %d, comm: %20s\n", current->pid, current->comm);
+	printk(KERN_DEBUG "Pid: %d, comm: %20s\n", current->pid, current->comm);
 	__show_regs(regs);
 	__backtrace();
 }
@@ -251,12 +251,12 @@
 		if (regs->init_flag)
 			type = '?';
 
-		printk("  f%d(%c): %08lx %08lx %08lx%c",
+		printk(KERN_DEBUG "  f%d(%c): %08lx %08lx %08lx%c",
 			i, type, p[0], p[1], p[2], i & 1 ? '\n' : ' ');
 	}
 			
 
-	printk("FPSR: %08lx FPCR: %08lx\n",
+	printk(KERN_DEBUG "FPSR: %08lx FPCR: %08lx\n",
 		(unsigned long)regs->fpsr,
 		(unsigned long)regs->fpcr);
 }

--===============033110383504768581==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============033110383504768581==--
