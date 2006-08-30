From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:47:15 +0000
Subject: [KJ] [PATCH] 16/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214715.15055.30049.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/err_titan.c b/arch/alpha/kernel/err_titan.c
index 7e6720d..3f71d75 100644
--- a/arch/alpha/kernel/err_titan.c
+++ b/arch/alpha/kernel/err_titan.c
@@ -61,7 +61,7 @@ #ifdef CONFIG_VERBOSE_MCHECK
 		break;
 	}
 
-	printk("%s    Non-existent memory access from: %s %d\n", 
+	printk(KERN_ERR "%s    Non-existent memory access from: %s %d\n",
 	       err_print_prefix, src, nxs);
 #endif /* CONFIG_VERBOSE_MCHECK */
 
@@ -106,26 +106,26 @@ #ifdef CONFIG_VERBOSE_MCHECK
 	if (!print)
 		return status;
 
-	printk("%s  PChip %d SERROR: %016lx\n", 
+	printk(KERN_ERR "%s  PChip %d SERROR: %016lx\n", 
 	       err_print_prefix, which, serror);
 	if (serror & TITAN__PCHIP_SERROR__ECCMASK) {
-		printk("%s    %sorrectable ECC Error:\n"
-		       "      Source: %-6s  Command: %-8s  Syndrome: 0x%08x\n"
-		       "      Address: 0x%lx\n", 
-		       err_print_prefix,
-		       (serror & TITAN__PCHIP_SERROR__UECC) ? "Unc" : "C",
-		       serror_src[EXTRACT(serror, TITAN__PCHIP_SERROR__SRC)],
-		       serror_cmd[EXTRACT(serror, TITAN__PCHIP_SERROR__CMD)],
-		       (unsigned)EXTRACT(serror, TITAN__PCHIP_SERROR__SYN),
-		       EXTRACT(serror, TITAN__PCHIP_SERROR__ADDR));
+		printk(KERN_ERR "%s    %sorrectable ECC Error:\n",
+			err_print_prefix,
+			(serror & TITAN__PCHIP_SERROR__UECC) ? "Unc" : "C");
+		printk(KERN_ERR "      Source: %-6s  Command: %-8s  Syndrome: 0x%08x\n",
+			serror_src[EXTRACT(serror, TITAN__PCHIP_SERROR__SRC)],
+			serror_cmd[EXTRACT(serror, TITAN__PCHIP_SERROR__CMD)],
+			(unsigned)EXTRACT(serror, TITAN__PCHIP_SERROR__SYN));
+		printk(KERN_ERR "      Address: 0x%lx\n",
+			EXTRACT(serror, TITAN__PCHIP_SERROR__ADDR));
 	}
 	if (serror & TITAN__PCHIP_SERROR__NXIO)
-		printk("%s    Non Existent I/O Error\n", err_print_prefix);
+		printk(KERN_ERR "%s    Non Existent I/O Error\n", err_print_prefix);
 	if (serror & TITAN__PCHIP_SERROR__LOST_UECC)
-		printk("%s    Lost Uncorrectable ECC Error\n", 
+		printk(KERN_ERR "%s    Lost Uncorrectable ECC Error\n", 
 		       err_print_prefix);
 	if (serror & TITAN__PCHIP_SERROR__LOST_CRE)
-		printk("%s    Lost Correctable ECC Error\n", err_print_prefix);
+		printk(KERN_ERR "%s    Lost Correctable ECC Error\n", err_print_prefix);
 #endif /* CONFIG_VERBOSE_MCHECK */
 
 	return status;
@@ -222,43 +222,42 @@ #ifdef CONFIG_VERBOSE_MCHECK
 	if (!print) 
 		return status;
 
-	printk("%s  PChip %d %cPERROR: %016lx\n", 
+	printk(KERN_ERR "%s  PChip %d %cPERROR: %016lx\n", 
 	       err_print_prefix, which, 
 	       port ? 'A' : 'G', perror);
 	if (perror & TITAN__PCHIP_PERROR__IPTPW)
-		printk("%s    Invalid Peer-to-Peer Write\n", err_print_prefix);
+		printk(KERN_ERR "%s    Invalid Peer-to-Peer Write\n", err_print_prefix);
 	if (perror & TITAN__PCHIP_PERROR__IPTPR)
-		printk("%s    Invalid Peer-to-Peer Read\n", err_print_prefix);
+		printk(KERN_ERR "%s    Invalid Peer-to-Peer Read\n", err_print_prefix);
 	if (perror & TITAN__PCHIP_PERROR__NDS)
-		printk("%s    No DEVSEL as PCI Master [Master Abort]\n",
+		printk(KERN_ERR "%s    No DEVSEL as PCI Master [Master Abort]\n",
 		       err_print_prefix);
 	if (perror & TITAN__PCHIP_PERROR__DPE)
-		printk("%s    Data Parity Error\n", err_print_prefix);
+		printk(KERN_ERR "%s    Data Parity Error\n", err_print_prefix);
 	if (perror & TITAN__PCHIP_PERROR__TA)
-		printk("%s    Target Abort\n", err_print_prefix);
+		printk(KERN_ERR "%s    Target Abort\n", err_print_prefix);
 	if (perror & TITAN__PCHIP_PERROR__APE)
-		printk("%s    Address Parity Error\n", err_print_prefix);
+		printk(KERN_ERR "%s    Address Parity Error\n", err_print_prefix);
 	if (perror & TITAN__PCHIP_PERROR__SGE)
-		printk("%s    Scatter-Gather Error, Invalid PTE\n", 
+		printk(KERN_ERR "%s    Scatter-Gather Error, Invalid PTE\n", 
 		       err_print_prefix);
 	if (perror & TITAN__PCHIP_PERROR__DCRTO)
-		printk("%s    Delayed-Completion Retry Timeout\n", 
+		printk(KERN_ERR "%s    Delayed-Completion Retry Timeout\n", 
 		       err_print_prefix);
 	if (perror & TITAN__PCHIP_PERROR__PERR)
-		printk("%s    PERR Asserted\n", err_print_prefix);
+		printk(KERN_ERR "%s    PERR Asserted\n", err_print_prefix);
 	if (perror & TITAN__PCHIP_PERROR__SERR)
-		printk("%s    SERR Asserted\n", err_print_prefix);
+		printk(KERN_ERR "%s    SERR Asserted\n", err_print_prefix);
 	if (perror & TITAN__PCHIP_PERROR__LOST)
-		printk("%s    Lost Error\n", err_print_prefix);
-	printk("%s      Command: 0x%x - %s\n"
-		 "      Address: 0x%lx\n",
-	       err_print_prefix,
-	       cmd, perror_cmd[cmd],
-	       addr);
+		printk(KERN_ERR "%s    Lost Error\n", err_print_prefix);
+	printk(KERN_ERR "%s      Command: 0x%x - %s\n",
+		err_print_prefix,
+		cmd, perror_cmd[cmd]);
+	printk(KERN_ERR "      Address: 0x%lx\n", addr);
 	if (perror & TITAN__PCHIP_PERROR__DAC)
-		printk("%s      Dual Address Cycle\n", err_print_prefix);
+		printk(KERN_ERR "%s      Dual Address Cycle\n", err_print_prefix);
 	if (perror & TITAN__PCHIP_PERROR__MWIN)
-		printk("%s      Hit in Monster Window\n", err_print_prefix);
+		printk(KERN_ERR "%s      Hit in Monster Window\n", err_print_prefix);
 #endif /* CONFIG_VERBOSE_MCHECK */
 
 	return status;
@@ -315,33 +314,32 @@ #ifdef CONFIG_VERBOSE_MCHECK
 	addr = EXTRACT(agperror, TITAN__PCHIP_AGPERROR__ADDR) << 3;
 	len = EXTRACT(agperror, TITAN__PCHIP_AGPERROR__LEN);
 
-	printk("%s  PChip %d AGPERROR: %016lx\n", err_print_prefix,
+	printk(KERN_ERR "%s  PChip %d AGPERROR: %016lx\n", err_print_prefix,
 	       which, agperror);
 	if (agperror & TITAN__PCHIP_AGPERROR__NOWINDOW)
-		printk("%s    No Window\n", err_print_prefix);
+		printk(KERN_ERR "%s    No Window\n", err_print_prefix);
 	if (agperror & TITAN__PCHIP_AGPERROR__PTP)
-		printk("%s    Peer-to-Peer set\n", err_print_prefix);
+		printk(KERN_ERR "%s    Peer-to-Peer set\n", err_print_prefix);
 	if (agperror & TITAN__PCHIP_AGPERROR__IPTE)
-		printk("%s    Invalid PTE\n", err_print_prefix);
+		printk(KERN_ERR "%s    Invalid PTE\n", err_print_prefix);
 	if (agperror & TITAN__PCHIP_AGPERROR__RESCMD)
-		printk("%s    Reserved Command\n", err_print_prefix);
+		printk(KERN_ERR "%s    Reserved Command\n", err_print_prefix);
 	if (agperror & TITAN__PCHIP_AGPERROR__HPQFULL)
-		printk("%s    HP Transaction Received while Queue Full\n", 
+		printk(KERN_ERR "%s    HP Transaction Received while Queue Full\n",
 		       err_print_prefix);
 	if (agperror & TITAN__PCHIP_AGPERROR__LPQFULL)
-		printk("%s    LP Transaction Received while Queue Full\n", 
+		printk(KERN_ERR "%s    LP Transaction Received while Queue Full\n",
 		       err_print_prefix);
 	if (agperror & TITAN__PCHIP_AGPERROR__LOST)
-		printk("%s    Lost Error\n", err_print_prefix);
-	printk("%s      Command: 0x%x - %s, %d Quadwords%s\n"
-		 "      Address: 0x%lx\n",
+		printk(KERN_ERR "%s    Lost Error\n", err_print_prefix);
+	printk(KERN_ERR "%s      Command: 0x%x - %s, %d Quadwords%s\n",
 	       err_print_prefix, cmd, agperror_cmd[cmd], len,
-	       (agperror & TITAN__PCHIP_AGPERROR__FENCE) ? ", FENCE" : "",
-	       addr);
+	       (agperror & TITAN__PCHIP_AGPERROR__FENCE) ? ", FENCE" : "");
+	printk(KERN_ERR "      Address: 0x%lx\n", addr);
 	if (agperror & TITAN__PCHIP_AGPERROR__DAC)
-		printk("%s      Dual Address Cycle\n", err_print_prefix);
+		printk(KERN_ERR "%s      Dual Address Cycle\n", err_print_prefix);
 	if (agperror & TITAN__PCHIP_AGPERROR__MWIN)
-		printk("%s      Hit in Monster Window\n", err_print_prefix);
+		printk(KERN_ERR "%s      Hit in Monster Window\n", err_print_prefix);
 #endif /* CONFIG_VERBOSE_MCHECK */
 
 	return status;
@@ -433,8 +431,7 @@ #define TITAN_MCHECK_INTERRUPT_MASK	0xF8
 		 * recognized error was detected  in the logout frame 
 		 * -- report the error in either case
 		 */
-		printk("%s"
-		       "*System %s Error (Vector 0x%x) reported on CPU %d:\n", 
+		printk(KERN_ERR "%s*System %s Error (Vector 0x%x) reported on CPU %d:\n",
 		       err_print_prefix,
 		       (vector = SCB_Q_SYSERR)?"Correctable":"Uncorrectable",
 		       (unsigned int)vector, (int)smp_processor_id());
@@ -530,7 +527,7 @@ el_process_regatta_subpacket(struct el_s
 	int status;
 
 	if (header->class != EL_CLASS__REGATTA_FAMILY) {
-		printk("%s  ** Unexpected header CLASS %d TYPE %d, aborting\n",
+		printk(KERN_ERR "%s  ** Unexpected header CLASS %d TYPE %d, aborting\n",
 		       err_print_prefix,
 		       header->class, header->type);
 		return NULL;
@@ -542,14 +539,14 @@ el_process_regatta_subpacket(struct el_s
 	case EL_TYPE__REGATTA__ENVIRONMENTAL_FRAME:
 	case EL_TYPE__REGATTA__PROCESSOR_DBL_ERROR_HALT:
 	case EL_TYPE__REGATTA__SYSTEM_DBL_ERROR_HALT:
-		printk("%s  ** Occurred on CPU %d:\n", 
+		printk(KERN_ERR "%s  ** Occurred on CPU %d:\n", 
 		       err_print_prefix,
 		       (int)header->by_type.regatta_frame.cpuid);
 		status = privateer_process_logout_frame((struct el_common *)
 			header->by_type.regatta_frame.data_start, 1);
 		break;
 	default:
-		printk("%s  ** REGATTA TYPE %d SUBPACKET\n", 
+		printk(KERN_ERR "%s  ** REGATTA TYPE %d SUBPACKET\n", 
 		       err_print_prefix, header->type);
 		el_annotate_subpacket(header);
 		break;
@@ -596,26 +593,25 @@ #ifdef CONFIG_VERBOSE_MCHECK
 		return status;
 
 	/* TODO - decode instead of just dumping... */
-	printk("%s  Summary Flags:         %016lx\n"
- 	         "  CChip DIRx:            %016lx\n"
-		 "  System Management IR:  %016lx\n"
-		 "  CPU IR:                %016lx\n"
-		 "  Power Supply IR:       %016lx\n"
-		 "  LM78 Fault Status:     %016lx\n"
-		 "  System Doors:          %016lx\n"
-		 "  Temperature Warning:   %016lx\n"
-		 "  Fan Control:           %016lx\n"
-		 "  Fatal Power Down Code: %016lx\n",
-	       err_print_prefix,
-	       emchk->summary,
-	       emchk->c_dirx,
-	       emchk->smir,
-	       emchk->cpuir,
-	       emchk->psir,
-	       emchk->fault,
-	       emchk->sys_doors,
-	       emchk->temp_warn,
-	       emchk->fan_ctrl,
+	printk(KERN_ERR "%s  Summary Flags:         %016lx\n",
+	       err_print_prefix, emchk->summary);
+	printk(KERN_ERR "  CChip DIRx:            %016lx\n",
+	       emchk->c_dirx);
+	printk(KERN_ERR "  System Management IR:  %016lx\n",
+	       emchk->smir);
+	printk(KERN_ERR "  CPU IR:                %016lx\n",
+	       emchk->cpuir);
+	printk(KERN_ERR "  Power Supply IR:       %016lx\n",
+	       emchk->psir);
+	printk(KERN_ERR "  LM78 Fault Status:     %016lx\n",
+	       emchk->fault);
+	printk(KERN_ERR "  System Doors:          %016lx\n",
+	       emchk->sys_doors);
+	printk(KERN_ERR "  Temperature Warning:   %016lx\n",
+	       emchk->temp_warn);
+	printk(KERN_ERR "  Fan Control:           %016lx\n",
+	       emchk->fan_ctrl);
+	printk(KERN_ERR "  Fatal Power Down Code: %016lx\n",
 	       emchk->code);
 #endif /* CONFIG_VERBOSE_MCHECK */
 
@@ -690,7 +686,7 @@ #define PRIVATEER_MCHK__SYS_ENVIRON		0x2
 	default:
 		status |= MCHK_DISPOSITION_REPORT;
 		if (print) {
-			printk("%s** Unknown Error, frame follows\n", 
+			printk(KERN_ERR "%s** Unknown Error, frame follows\n", 
 			       err_print_prefix);
 			mchk_dump_logout_frame(mchk_header);
 		}
@@ -731,7 +727,7 @@ #define PRIVATEER_HOTPLUG_INTERRUPT_MASK
 	 * to normal status.
 	 */
 	err_print_prefix = KERN_CRIT;
-	printk("%s*System Event (Vector 0x%x) reported on CPU %d:\n", 
+	printk(KERN_ERR "%s*System Event (Vector 0x%x) reported on CPU %d:\n",
 	       err_print_prefix,
 	       (unsigned int)vector, (int)smp_processor_id());
 	privateer_process_680_frame(mchk_header, 1);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
