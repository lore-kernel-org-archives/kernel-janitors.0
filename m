From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 26 Jan 2006 11:45:28 +0000
Subject: [KJ] [PATCH] printk : arch/arm/kernel/smp.c
Message-Id: <20060126114528.GG8401@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13841794883694325=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============13841794883694325==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.15/arch/arm/kernel/smp.c
===================================================================
--- linux-2.6.15.orig/arch/arm/kernel/smp.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.15/arch/arm/kernel/smp.c	2006-01-18 14:17:47.000000000 +0100
@@ -213,7 +213,7 @@
 void __cpuexit __cpu_die(unsigned int cpu)
 {
 	if (!platform_cpu_kill(cpu))
-		printk("CPU%u: unable to kill\n", cpu);
+		printk(KERN_WARNING "CPU%u: unable to kill\n", cpu);
 }
 
 /*
@@ -258,7 +258,7 @@
 	struct mm_struct *mm = &init_mm;
 	unsigned int cpu = smp_processor_id();
 
-	printk("CPU%u: Booted secondary processor\n", cpu);
+	printk(KERN_INFO "CPU%u: Booted secondary processor\n", cpu);
 
 	/*
 	 * All kernel threads share the same mm context; grab a

--===============13841794883694325==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13841794883694325==--
