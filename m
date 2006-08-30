From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:46:54 +0000
Subject: [KJ] [PATCH] 13/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214654.15055.84825.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/err_ev6.c b/arch/alpha/kernel/err_ev6.c
index 64f59f2..941a63e 100644
--- a/arch/alpha/kernel/err_ev6.c
+++ b/arch/alpha/kernel/err_ev6.c
@@ -34,7 +34,7 @@ #define EV6__I_STAT__ERRMASK	(EV6__I_STA
 		return status;
 
 	if (i_stat & EV6__I_STAT__PAR)
-		printk("%s    Icache parity error\n", err_print_prefix);
+		printk(KERN_ERR "%s    Icache parity error\n", err_print_prefix);
 
 	return status;
 }
@@ -65,23 +65,23 @@ #define EV6__D_STAT__ERRMASK		(EV6__D_ST
 		return status;
 
 	if (mm_stat & EV6__MM_STAT__DC_TAG_PERR)
-		printk("%s    Dcache tag parity error on probe\n",
+		printk(KERN_ERR "%s    Dcache tag parity error on probe\n",
 		       err_print_prefix);
 	if (d_stat & EV6__D_STAT__TPERR_P0)
-		printk("%s    Dcache tag parity error - pipe 0\n",
+		printk(KERN_ERR "%s    Dcache tag parity error - pipe 0\n",
 		       err_print_prefix);
 	if (d_stat & EV6__D_STAT__TPERR_P1)
-		printk("%s    Dcache tag parity error - pipe 1\n",
+		printk(KERN_ERR "%s    Dcache tag parity error - pipe 1\n",
 		       err_print_prefix);
 	if (d_stat & EV6__D_STAT__ECC_ERR_ST)
-		printk("%s    ECC error occurred on a store\n", 
+		printk(KERN_ERR "%s    ECC error occurred on a store\n", 
 		       err_print_prefix);
 	if (d_stat & EV6__D_STAT__ECC_ERR_LD)
-		printk("%s    ECC error occurred on a %s load\n",
+		printk(KERN_ERR "%s    ECC error occurred on a %s load\n",
 		       err_print_prefix,
 		       c_stat ? "" : "speculative ");
 	if (d_stat & EV6__D_STAT__SEO)
-		printk("%s    Dcache second error\n", err_print_prefix);
+		printk(KERN_ERR "%s    Dcache second error\n", err_print_prefix);
 
 	return status;
 }
@@ -136,36 +136,33 @@ #define EV6__C_STS__PARITY		(1 << 3)
 	bits = EXTRACT(c_stat, EV6__C_STAT__DOUBLE);
 
 	if (c_stat & EV6__C_STAT__BC_PERR) {
-		printk("%s    Bcache tag parity error\n", err_print_prefix);
+		printk(KERN_ERR "%s    Bcache tag parity error\n", err_print_prefix);
 		source = -1;
 	}
 
 	if (c_stat & EV6__C_STAT__DC_PERR) {
-		printk("%s    Dcache tag parity error\n", err_print_prefix);
+		printk(KERN_ERR "%s    Dcache tag parity error\n", err_print_prefix);
 		source = -1;
 	}
 
 	if (c_stat = EV6__C_STAT__PROBE_BC_ERR0 ||
 	    c_stat = EV6__C_STAT__PROBE_BC_ERR1) {
-		printk("%s    Bcache single-bit error on a probe hit\n",
+		printk(KERN_ERR "%s    Bcache single-bit error on a probe hit\n",
 		       err_print_prefix);
 		source = -1;
 	}
 
 	if (source != -1) 
-		printk("%s    %s-STREAM %s-BIT ECC error from %s\n",
+		printk(KERN_ERR "%s    %s-STREAM %s-BIT ECC error from %s\n",
 		       err_print_prefix,
 		       streamname[stream], bitsname[bits], sourcename[source]);
 
-	printk("%s    Address: 0x%016lx\n"
-	         "    Syndrome[upper.lower]: %02lx.%02lx\n", 
-	       err_print_prefix,
-	       c_addr,
-	       c2_syn, c1_syn);
+	printk(KERN_ERR "%s    Address: 0x%016lx\n", err_print_prefix, c_addr);
+	printk(KERN_ERR "    Syndrome[upper.lower]: %02lx.%02lx\n", c2_syn, c1_syn);
 
 	if (source = EV6__C_STAT__SOURCE_MEMORY ||
 	    source = EV6__C_STAT__SOURCE_BCACHE) 
-		printk("%s    Block status: %s%s%s%s\n",
+		printk(KERN_ERR "%s    Block status: %s%s%s%s\n",
 		       err_print_prefix,
 		       (c_sts & EV6__C_STS__SHARED) ? "SHARED " : "",
 		       (c_sts & EV6__C_STS__DIRTY)  ? "DIRTY "  : "",
@@ -204,16 +201,13 @@ ev6_process_logout_frame(struct el_commo
 		/*
 		 * Dump some additional information from the frame
 		 */
-		printk("%s    EXC_ADDR: 0x%016lx   IER_CM: 0x%016lx"
-		            "   ISUM: 0x%016lx\n"
-		         "    PAL_BASE: 0x%016lx   I_CTL:  0x%016lx"
-		            "   PCTX: 0x%016lx\n",
-		       err_print_prefix,
-		       ev6mchk->EXC_ADDR, ev6mchk->IER_CM, ev6mchk->ISUM,
-		       ev6mchk->PAL_BASE, ev6mchk->I_CTL, ev6mchk->PCTX);
+		printk(KERN_ERR "%s    EXC_ADDR: 0x%016lx   IER_CM: 0x%016lx   ISUM: 0x%016lx\n"
+			err_print_prefix, ev6mchk->EXC_ADDR, ev6mchk->IER_CM, ev6mchk->ISUM);
+		printk(KERN_ERR "    PAL_BASE: 0x%016lx   I_CTL:  0x%016lx   PCTX: 0x%016lx\n",
+			ev6mchk->PAL_BASE, ev6mchk->I_CTL, ev6mchk->PCTX);
 
 		if (status = MCHK_DISPOSITION_UNKNOWN_ERROR) {
-			printk("%s    UNKNOWN error, frame follows:\n",
+			printk(KERN_ERR "%s    UNKNOWN error, frame follows:\n",
 			       err_print_prefix);
 		} else {
 			/* had decode -- downgrade print level for frame */
@@ -254,7 +248,7 @@ ev6_machine_check(u64 vector, u64 la_ptr
 		 * recognized error was detected  in the logout frame 
 		 * -- report the error in either case
 		 */
-		printk("%s*CPU %s Error (Vector 0x%x) reported on CPU %d:\n", 
+		printk(KERN_ERR "%s*CPU %s Error (Vector 0x%x) reported on CPU %d:\n", 
 		       err_print_prefix,
 		       (vector = SCB_Q_PROCERR)?"Correctable":"Uncorrectable",
 		       (unsigned int)vector, (int)smp_processor_id());
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
