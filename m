From: Mark Broadbent <markb@wetlettuce.com>
Date: Tue, 31 Aug 2004 19:00:51 +0000
Subject: [Kernel-janitors] [PATCH] Remove Dprintk from apic.h and clean up
Message-Id: <20040831200051.00060d1a.markb@wetlettuce.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3834116145014641=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============3834116145014641==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

All,

This patch cleans up the usage of Dprintk outside of the (IO-)APIC code.

Thanks
Mark

Signed-Off-By: "Mark Broadbent" <markb@wetlettuce.com>

--- linux/include/asm-i386/apic.h    2004-08-31 19:56:06.071666873 +0100
+++ linux-orig/include/asm-i386/apic.h 2004-08-31 19:55:42.403982829 +0100
@@ -7,8 +7,6 @@
 #include <asm/apicdef.h>
 #include <asm/system.h>
  
-#define Dprintk(x...)
-
 /*
  * Debugging macros
  */
--- linux/arch/i386/kernel/mpparse.c	2004-08-27 20:36:03.000000000 +0100
+++ linux-orig/arch/i386/kernel/mpparse.c	2004-08-27 20:35:13.000000000 +0100
@@ -35,6 +35,14 @@
 #include <mach_mpparse.h>
 #include <bios_ebda.h>
 
+/* #define MPPARSE_DEBUG */
+
+#ifdef MPPARSE_DEBUG
+#define Dprintk(x...) printk(x)
+#else
+#define Dprintk(x...)
+#endif
+
 /* Have we found an MP table */
 int smp_found_config;
 unsigned int __initdata maxcpus = NR_CPUS;
--- linux/arch/i386/kernel/nmi.c	2004-08-27 20:37:36.000000000 +0100
+++ linux-orig/arch/i386/kernel/nmi.c	2004-08-27 20:38:57.000000000 +0100
@@ -328,7 +328,7 @@ static void setup_k7_watchdog(void)
 		| K7_NMI_EVENT;
 
 	wrmsr(MSR_K7_EVNTSEL0, evntsel, 0);
-	Dprintk("setting K7_PERFCTR0 to %08lx\n", -(cpu_khz/nmi_hz*1000));
+	printk(KERN_DEBUG "setting K7_PERFCTR0 to %08lx\n", -(cpu_khz/nmi_hz*1000));
 	wrmsr(MSR_K7_PERFCTR0, -(cpu_khz/nmi_hz*1000), -1);
 	apic_write(APIC_LVTPC, APIC_DM_NMI);
 	evntsel |= K7_EVNTSEL_ENABLE;
@@ -350,7 +350,7 @@ static void setup_p6_watchdog(void)
 		| P6_NMI_EVENT;
 
 	wrmsr(MSR_P6_EVNTSEL0, evntsel, 0);
-	Dprintk("setting P6_PERFCTR0 to %08lx\n", -(cpu_khz/nmi_hz*1000));
+	printk(KERN_DEBUG "setting P6_PERFCTR0 to %08lx\n", -(cpu_khz/nmi_hz*1000));
 	wrmsr(MSR_P6_PERFCTR0, -(cpu_khz/nmi_hz*1000), 0);
 	apic_write(APIC_LVTPC, APIC_DM_NMI);
 	evntsel |= P6_EVNTSEL0_ENABLE;
@@ -385,7 +385,7 @@ static int setup_p4_watchdog(void)
 
 	wrmsr(MSR_P4_CRU_ESCR0, P4_NMI_CRU_ESCR0, 0);
 	wrmsr(MSR_P4_IQ_CCCR0, P4_NMI_IQ_CCCR0 & ~P4_CCCR_ENABLE, 0);
-	Dprintk("setting P4_IQ_COUNTER0 to 0x%08lx\n", -(cpu_khz/nmi_hz*1000));
+	printk(KERN_DEBUG "setting P4_IQ_COUNTER0 to 0x%08lx\n", -(cpu_khz/nmi_hz*1000));
 	wrmsr(MSR_P4_IQ_COUNTER0, -(cpu_khz/nmi_hz*1000), -1);
 	apic_write(APIC_LVTPC, APIC_DM_NMI);
 	wrmsr(MSR_P4_IQ_CCCR0, nmi_p4_cccr_val, 0);


--===============3834116145014641==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3834116145014641==--
