From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:48:23 +0000
Subject: [KJ] [PATCH] 26/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214823.15055.58624.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 4dc273e..3aff361 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -45,9 +45,9 @@ #include "irq_impl.h"
 
 #define DEBUG_SMP 0
 #if DEBUG_SMP
-#define DBGS(args)	printk args
+#define DBGS(fmt, args...) printk(KERN_DEBUG "%s: " fmt, __FUNCTION__ , ## args)
 #else
-#define DBGS(args)
+#define DBGS(fmt, args...)
 #endif
 
 /* A collection of per-processor data.  */
@@ -113,7 +113,7 @@ wait_boot_cpu_to_stop(int cpuid)
 		barrier();
 	}
 
-	printk("wait_boot_cpu_to_stop: FAILED on CPU %d, hanging now\n", cpuid);
+	printk(KERN_CRIT "wait_boot_cpu_to_stop: FAILED on CPU %d, hanging now\n", cpuid);
 	for (;;)
 		barrier();
 }
@@ -127,7 +127,7 @@ smp_callin(void)
 	int cpuid = hard_smp_processor_id();
 
 	if (cpu_test_and_set(cpuid, cpu_online_map)) {
-		printk("??, cpu 0x%x already present??\n", cpuid);
+		printk(KERN_CRIT "??, cpu 0x%x already present??\n", cpuid);
 		BUG();
 	}
 
@@ -164,8 +164,8 @@ smp_callin(void)
 	wmb();
 	smp_secondary_alive = 1;
 
-	DBGS(("smp_callin: commencing CPU %d current %p active_mm %p\n",
-	      cpuid, current, current->active_mm));
+	DBGS("commencing CPU %d current %p active_mm %p\n",
+	      cpuid, current, current->active_mm);
 
 	/* Do nothing.  */
 	cpu_idle();
@@ -227,7 +227,7 @@ send_secondary_console_msg(char *str, in
 	return;
 
  timeout:
-	printk("Processor %x not ready\n", cpuid);
+	printk(KERN_ERR "Processor %x not ready\n", cpuid);
 }
 
 /*
@@ -241,7 +241,7 @@ recv_secondary_console_msg(void)
 	char *cp1, *cp2, buf[80];
 	struct percpu_struct *cpu;
 
-	DBGS(("recv_secondary_console_msg: TXRDY 0x%lx.\n", txrdy));
+	DBGS("TXRDY 0x%lx.\n", txrdy);
 
 	mycpu = hard_smp_processor_id();
 
@@ -249,17 +249,15 @@ recv_secondary_console_msg(void)
 		if (!(txrdy & (1UL << i)))
 			continue;
 
-		DBGS(("recv_secondary_console_msg: "
-		      "TXRDY contains CPU %d.\n", i));
+		DBGS("TXRDY contains CPU %d.\n", i);
 
 		cpu = (struct percpu_struct *)
 		  ((char*)hwrpb
 		   + hwrpb->processor_offset
 		   + i * hwrpb->processor_size);
 
- 		DBGS(("recv_secondary_console_msg: on %d from %d"
-		      " HALT_REASON 0x%lx FLAGS 0x%lx\n",
-		      mycpu, i, cpu->halt_reason, cpu->flags));
+ 		DBGS("on %d from %d HALT_REASON 0x%lx FLAGS 0x%lx\n",
+		      mycpu, i, cpu->halt_reason, cpu->flags);
 
 		cnt = cpu->ipc_buffer[0] >> 32;
 		if (cnt <= 0 || cnt >= 80)
@@ -276,8 +274,7 @@ recv_secondary_console_msg(void)
 			}
 		}
 
-		DBGS((KERN_INFO "recv_secondary_console_msg: on %d "
-		      "message is '%s'\n", mycpu, buf));
+		DBGS("on %d message is '%s'\n", mycpu, buf);
 	}
 
 	hwrpb->txrdy = 0;
@@ -314,11 +311,11 @@ secondary_cpu_start(int cpuid, struct ta
 	hwpcb->res1 = hwpcb->res2 = 0;
 
 #if 0
-	DBGS(("KSP 0x%lx PTBR 0x%lx VPTBR 0x%lx UNIQUE 0x%lx\n",
-	      hwpcb->ksp, hwpcb->ptbr, hwrpb->vptb, hwpcb->unique));
+	DBGS("KSP 0x%lx PTBR 0x%lx VPTBR 0x%lx UNIQUE 0x%lx\n",
+	      hwpcb->ksp, hwpcb->ptbr, hwrpb->vptb, hwpcb->unique);
 #endif
-	DBGS(("Starting secondary cpu %d: state 0x%lx pal_flags 0x%lx\n",
-	      cpuid, idle->state, ipcb->flags));
+	DBGS("Starting secondary cpu %d: state 0x%lx pal_flags 0x%lx\n",
+	      cpuid, idle->state, ipcb->flags);
 
 	/* Setup HWRPB fields that SRM uses to activate secondary CPU */
 	hwrpb->CPU_restart = __smp_callin;
@@ -336,7 +333,7 @@ #endif
 	cpu->flags &= ~1;	/* turn off Bootstrap In Progress */
 	wmb();
 
-	send_secondary_console_msg("START\r\n", cpuid);
+	send_secondary_console_msg("START\n", cpuid);
 
 	/* Wait 10 seconds for an ACK from the console.  */
 	timeout = jiffies + 10*HZ;
@@ -350,7 +347,7 @@ #endif
 	return -1;
 
  started:
-	DBGS(("secondary_cpu_start: SUCCESS for CPU %d!!!\n", cpuid));
+	DBGS("SUCCESS for CPU %d\n", cpuid);
 	return 0;
 }
 
@@ -373,8 +370,8 @@ smp_boot_one_cpu(int cpuid)
 	if (IS_ERR(idle))
 		panic("failed fork for CPU %d", cpuid);
 
-	DBGS(("smp_boot_one_cpu: CPU %d state 0x%lx flags 0x%lx\n",
-	      cpuid, idle->state, idle->flags));
+	DBGS("CPU %d state 0x%lx flags 0x%lx\n",
+	      cpuid, idle->state, idle->flags);
 
 	/* Signal the secondary to wait a moment.  */
 	smp_secondary_alive = -1;
@@ -425,8 +422,7 @@ setup_smp(void)
 	if (hwrpb->nr_processors > 1) {
 		int boot_cpu_palrev;
 
-		DBGS(("setup_smp: nr_processors %ld\n",
-		      hwrpb->nr_processors));
+		DBGS("nr_processors %ld\n", hwrpb->nr_processors);
 
 		cpubase = (struct percpu_struct *)
 			((char*)hwrpb + hwrpb->processor_offset);
@@ -442,10 +438,10 @@ setup_smp(void)
 				cpu->pal_revision = boot_cpu_palrev;
 			}
 
-			DBGS(("setup_smp: CPU %d: flags 0x%lx type 0x%lx\n",
-			      i, cpu->flags, cpu->type));
-			DBGS(("setup_smp: CPU %d: PAL rev 0x%lx\n",
-			      i, cpu->pal_revision));
+			DBGS("CPU %d: flags 0x%lx type 0x%lx\n",
+			      i, cpu->flags, cpu->type);
+			DBGS("CPU %d: PAL rev 0x%lx\n",
+			      i, cpu->pal_revision);
 		}
 	} else {
 		smp_num_probed = 1;
@@ -610,8 +606,8 @@ handle_ipi(struct pt_regs *regs)
 	unsigned long ops;
 
 #if 0
-	DBGS(("handle_ipi: on CPU %d ops 0x%lx PC 0x%lx\n",
-	      this_cpu, *pending_ipis, regs->pc));
+	DBGS("on CPU %d ops 0x%lx PC 0x%lx\n",
+	      this_cpu, *pending_ipis, regs->pc);
 #endif
 
 	mb();	/* Order interrupt and bit testing. */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
