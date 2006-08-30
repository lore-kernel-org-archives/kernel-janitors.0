From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:47:07 +0000
Subject: [KJ] [PATCH] 15/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214707.15055.90504.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index 70b38b1..bed0617 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -49,12 +49,12 @@ #ifdef CONFIG_VERBOSE_MCHECK
 		if (!env)
 			continue;
 
-		printk("%s**%s event (cabinet %d, drawer %d)\n",
+		pr_info("%s**%s event (cabinet %d, drawer %d)\n",
 		       err_print_prefix,
 		       ev_packets[i].name,
 		       env->cabinet,
 		       env->drawer);
-		printk("%s   Module Type: 0x%x - Unit ID 0x%x - "
+		pr_info("%s   Module Type: 0x%x - Unit ID 0x%x - "
 		       "Condition 0x%x\n",
 		       err_print_prefix,
 		       env->module_type,
@@ -108,10 +108,9 @@ #define IO7__ERR_CYC__LOC	(1UL <<  5)
 #define IO7__ERR_CYC__CYCLE__S	(2)
 #define IO7__ERR_CYC__CYCLE__M	(0x7)
 
-	printk("%s        Packet In Error: %s\n"
-	       "%s        Error in %s, cycle %ld%s%s\n",
-	       err_print_prefix, 
-	       packet_desc[EXTRACT(err_cyc, IO7__ERR_CYC__PACKET)],
+	printk(KERN_ERR "%s        Packet In Error: %s\n",
+		err_print_prefix, packet_desc[EXTRACT(err_cyc, IO7__ERR_CYC__PACKET)]);
+	printk(KERN_ERR "%s        Error in %s, cycle %ld%s%s\n",
 	       err_print_prefix,
 	       (err_cyc & IO7__ERR_CYC__LOC) ? "DATA" : "HEADER",
 	       EXTRACT(err_cyc, IO7__ERR_CYC__CYCLE),
@@ -128,10 +127,9 @@ #define IO7__PO7_CRRCT_SYM__ERR_CYC__S	(
 #define IO7__PO7_CRRCT_SYM__ERR_CYC__M	(0x1ff)
 
 
-	printk("%s      Correctable Error Symptoms:\n"
-	       "%s        Syndrome: 0x%lx\n",
-	       err_print_prefix,
-	       err_print_prefix, EXTRACT(crrct_sym, IO7__PO7_CRRCT_SYM__SYN));
+	printk(KERN_ERR "%s      Correctable Error Symptoms:\n", err_print_prefix);
+	printk(KERN_ERR "%s        Syndrome: 0x%lx\n",
+		err_print_prefix, EXTRACT(crrct_sym, IO7__PO7_CRRCT_SYM__SYN));
 	marvel_print_err_cyc(EXTRACT(crrct_sym, IO7__PO7_CRRCT_SYM__ERR_CYC));
 }
 
@@ -182,11 +180,11 @@ #define IO7__STRV_VTR__MSI__INTNUM__S	  
 #define IO7__STRV_VTR__MSI__INTNUM__M	    (0x1ff)
 #define IO7__STRV_VTR__IS_MSI		    (1UL << 9)
 
-	printk("%s      Uncorrectable Error Symptoms:\n", err_print_prefix);
+	printk(KERN_ERR "%s      Uncorrectable Error Symptoms:\n", err_print_prefix);
 	uncrr_sym &= valid_mask;
 
 	if (EXTRACT(valid_mask, IO7__PO7_UNCRR_SYM__SYN))
-		printk("%s        Syndrome: 0x%lx\n",
+		printk(KERN_ERR "%s        Syndrome: 0x%lx\n",
 		       err_print_prefix, 
 		       EXTRACT(uncrr_sym, IO7__PO7_UNCRR_SYM__SYN));
 
@@ -197,35 +195,35 @@ #define IO7__STRV_VTR__IS_MSI		    (1UL 
 	scratch = EXTRACT(uncrr_sym, IO7__PO7_UNCRR_SYM__CLK);
 	for (i = 0; i < 4; i++, scratch >>= 2) {
 		if (scratch & 0x3)
-			printk("%s        Clock %s: %s\n",
+			printk(KERN_ERR "%s        Clock %s: %s\n",
 			       err_print_prefix,
 			       clk_names[i], clk_decode[scratch & 0x3]);
 	}
 
 	if (uncrr_sym & IO7__PO7_UNCRR_SYM__CDT_OVF_TO__REQ) 
-		printk("%s       REQ Credit Timeout or Overflow\n",
+		printk(KERN_ERR "%s       REQ Credit Timeout or Overflow\n",
 		       err_print_prefix);
 	if (uncrr_sym & IO7__PO7_UNCRR_SYM__CDT_OVF_TO__RIO) 
-		printk("%s       RIO Credit Timeout or Overflow\n",
+		printk(KERN_ERR "%s       RIO Credit Timeout or Overflow\n",
 		       err_print_prefix);
 	if (uncrr_sym & IO7__PO7_UNCRR_SYM__CDT_OVF_TO__WIO) 
-		printk("%s       WIO Credit Timeout or Overflow\n",
+		printk(KERN_ERR "%s       WIO Credit Timeout or Overflow\n",
 		       err_print_prefix);
 	if (uncrr_sym & IO7__PO7_UNCRR_SYM__CDT_OVF_TO__BLK) 
-		printk("%s       BLK Credit Timeout or Overflow\n",
+		printk(KERN_ERR "%s       BLK Credit Timeout or Overflow\n",
 		       err_print_prefix);
 	if (uncrr_sym & IO7__PO7_UNCRR_SYM__CDT_OVF_TO__NBK) 
-		printk("%s       NBK Credit Timeout or Overflow\n",
+		printk(KERN_ERR "%s       NBK Credit Timeout or Overflow\n",
 		       err_print_prefix);
 
 	if (uncrr_sym & IO7__PO7_UNCRR_SYM__OVF__READIO) 
-		printk("%s       Read I/O Buffer Overflow\n", 
+		printk(KERN_ERR "%s       Read I/O Buffer Overflow\n", 
 		       err_print_prefix);
 	if (uncrr_sym & IO7__PO7_UNCRR_SYM__OVF__WRITEIO) 
-		printk("%s       Write I/O Buffer Overflow\n", 
+		printk(KERN_ERR "%s       Write I/O Buffer Overflow\n", 
 		       err_print_prefix);
 	if (uncrr_sym & IO7__PO7_UNCRR_SYM__OVF__FWD) 
-		printk("%s       FWD Buffer Overflow\n", 
+		printk(KERN_ERR "%s       FWD Buffer Overflow\n", 
 		       err_print_prefix);
 
 	if ((scratch = EXTRACT(uncrr_sym, IO7__PO7_UNCRR_SYM__VICTIM_SP))) {
@@ -234,11 +232,11 @@ #define IO7__STRV_VTR__IS_MSI		    (1UL 
 		for (i = 0; i < 8; i++, scratch >>= 1) {
 			if (!(scratch & 1))
 				continue;
-			printk("%s        Error Response sent to %s",
+			printk(KERN_ERR "%s        Error Response sent to %s",
 			       err_print_prefix, port_names[i]);
 		}
 		if (lost)
-			printk("%s        Lost Error sent somewhere else\n",
+			printk(KERN_ERR "%s        Lost Error sent somewhere else\n",
 			       err_print_prefix);
 	}
 	
@@ -246,7 +244,7 @@ #define IO7__STRV_VTR__IS_MSI		    (1UL 
 		for (i = 0; i < 8; i++, scratch >>= 1) {
 			if (!(scratch & 1))
 				continue;
-			printk("%s        Error Reported by %s",
+			printk(KERN_ERR "%s        Error Reported by %s",
 			       err_print_prefix, port_names[i]);
 		}
 	}
@@ -267,7 +265,7 @@ #define IO7__STRV_VTR__IS_MSI		    (1UL 
 				EXTRACT(scratch, IO7__STRV_VTR__LSI__BUS),
 				EXTRACT(scratch, IO7__STRV_VTR__LSI__SLOT));
 
-		printk("%s        Starvation Int Trigger By: %s\n",
+		printk(KERN_ERR "%s        Starvation Int Trigger By: %s\n",
 		       err_print_prefix, starvation_message);
 	}
 }
@@ -312,18 +310,17 @@ #define IO7__PO7_UGBGE_SYM__VALID		(1UL 
 		break;
 	}
 
-	printk("%s      Up Hose Garbage Symptom:\n"
-	       "%s        Source Port: %ld - Dest PID: %ld - OpCode: %s\n", 
-	       err_print_prefix,
-	       err_print_prefix, 
-	       EXTRACT(ugbge_sym, IO7__PO7_UGBGE_SYM__UPH_SRC_PORT),
-	       EXTRACT(ugbge_sym, IO7__PO7_UGBGE_SYM__UPH_DEST_PID),
-	       opcode_str);
+	printk(KERN_ERR "%s      Up Hose Garbage Symptom:\n", err_print_prefix);
+	printk(KERN_ERR "%s        Source Port: %ld - Dest PID: %ld - OpCode: %s\n",
+		err_print_prefix, 
+		EXTRACT(ugbge_sym, IO7__PO7_UGBGE_SYM__UPH_SRC_PORT),
+		EXTRACT(ugbge_sym, IO7__PO7_UGBGE_SYM__UPH_DEST_PID),
+		opcode_str);
 
 	if (0xC5 != EXTRACT(ugbge_sym, IO7__PO7_UGBGE_SYM__UPH_OPCODE))
-		printk("%s        Packet Offset 0x%08lx\n",
-		       err_print_prefix,
-		       EXTRACT(ugbge_sym, IO7__PO7_UGBGE_SYM__UPH_PKT_OFF));
+		printk(KERN_ERR "%s        Packet Offset 0x%08lx\n",
+			err_print_prefix,
+			EXTRACT(ugbge_sym, IO7__PO7_UGBGE_SYM__UPH_PKT_OFF));
 }
 
 static void
@@ -368,7 +365,7 @@ #define IO7__PO7_ERRSUM__ERR_MASK	(IO7__
 	 * Single bit errors aren't covered by ERR_VALID.
 	 */
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__CR_SBE) {
-		printk("%s    %sSingle Bit Error(s) detected/corrected\n",
+		printk(KERN_ERR "%s    %sSingle Bit Error(s) detected/corrected\n",
 		       err_print_prefix,
 		       (io->po7_error_sum & IO7__PO7_ERRSUM__CR_SBE2) 
 		       ? "Multiple " : "");
@@ -379,21 +376,21 @@ #define IO7__PO7_ERRSUM__ERR_MASK	(IO7__
 	 * Neither are the interrupt status bits
 	 */
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__HLT_INT)
-		printk("%s    Halt Interrupt posted", err_print_prefix);
+		printk(KERN_ERR "%s    Halt Interrupt posted", err_print_prefix);
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__HP_INT) {
-		printk("%s    Hot Plug Event Interrupt posted", 
+		printk(KERN_ERR "%s    Hot Plug Event Interrupt posted", 
 		       err_print_prefix);
 		uncrr_sym_valid |= GEN_MASK(IO7__PO7_UNCRR_SYM__DETECT_SP);
 	}
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__CRD_INT)
-		printk("%s    Correctable Error Interrupt posted", 
+		printk(KERN_ERR "%s    Correctable Error Interrupt posted", 
 		       err_print_prefix);
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__STV_INT) {
-		printk("%s    Starvation Interrupt posted", err_print_prefix);
+		printk(KERN_ERR "%s    Starvation Interrupt posted", err_print_prefix);
 		uncrr_sym_valid |= GEN_MASK(IO7__PO7_UNCRR_SYM__STRV_VTR);
 	}
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__HRD_INT) {
-		printk("%s    Hard Error Interrupt posted", err_print_prefix);
+		printk(KERN_ERR "%s    Hard Error Interrupt posted", err_print_prefix);
 		uncrr_sym_valid |= GEN_MASK(IO7__PO7_UNCRR_SYM__DETECT_SP);
 	}
 
@@ -420,71 +417,70 @@ #define IO7__PO7_ERRSUM__ERR_MASK	(IO7__
 		uncrr_sym_valid |= 0x3ffffffful;
 
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__CR_PIO_WBYTE)
-		printk("%s    Write byte into IO7 CSR\n", err_print_prefix);
+		printk(KERN_ERR "%s    Write byte into IO7 CSR\n", err_print_prefix);
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__CR_CSR_NXM)
-		printk("%s    PIO to non-existent CSR\n", err_print_prefix);
+		printk(KERN_ERR "%s    PIO to non-existent CSR\n", err_print_prefix);
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__CR_RPID_ACV)
-		printk("%s    Bus Requester PID (Access Violation)\n",
+		printk(KERN_ERR "%s    Bus Requester PID (Access Violation)\n",
 		       err_print_prefix);
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__CR_RSP_NXM)
-		printk("%s    Received NXM response from EV7\n",
+		printk(KERN_ERR "%s    Received NXM response from EV7\n",
 		       err_print_prefix);
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__CR_ERR_RESP)
-		printk("%s    Received ERROR RESPONSE\n", err_print_prefix);
+		printk(KERN_ERR "%s    Received ERROR RESPONSE\n", err_print_prefix);
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__CR_CLK_DERR)
-		printk("%s    Clock error on data flit\n", err_print_prefix);
+		printk(KERN_ERR "%s    Clock error on data flit\n", err_print_prefix);
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__CR_DAT_DBE)
-		printk("%s    Double Bit Error Data Error Detected\n",
+		printk(KERN_ERR "%s    Double Bit Error Data Error Detected\n",
 		       err_print_prefix);
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__CR_DAT_GRBG)
-		printk("%s    Garbage Encoding Detected on the data\n",
+		printk(KERN_ERR "%s    Garbage Encoding Detected on the data\n",
 		       err_print_prefix);
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__UGBGE) {
-		printk("%s    Garbage Encoding sent up hose\n",
+		printk(KERN_ERR "%s    Garbage Encoding sent up hose\n",
 		       err_print_prefix);
 		marvel_print_po7_ugbge_sym(io->po7_ugbge_sym);
 	}
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__UN_MAF_LOST)
-		printk("%s    Orphan response (unexpected response)\n",
+		printk(KERN_ERR "%s    Orphan response (unexpected response)\n",
 		       err_print_prefix);
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__UN_PKT_OVF)
-		printk("%s    Down hose packet overflow\n", err_print_prefix);
+		printk(KERN_ERR "%s    Down hose packet overflow\n", err_print_prefix);
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__UN_CDT_OVF)
-		printk("%s    Down hose credit overflow\n", err_print_prefix);
+		printk(KERN_ERR "%s    Down hose credit overflow\n", err_print_prefix);
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__UN_DEALLOC)
-		printk("%s    Unexpected or bad dealloc field\n",
+		printk(KERN_ERR "%s    Unexpected or bad dealloc field\n",
 		       err_print_prefix);
 
 	/*
 	 * The black hole events.
 	 */
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__MAF_TO)
-		printk("%s    BLACK HOLE: Timeout for all responses\n",
+		printk(KERN_ERR "%s    BLACK HOLE: Timeout for all responses\n",
 		       err_print_prefix);
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__BH_CDT_TO)
-		printk("%s    BLACK HOLE: Credit Timeout\n", err_print_prefix);
+		printk(KERN_ERR "%s    BLACK HOLE: Credit Timeout\n", err_print_prefix);
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__BH_CLK_HDR)
-		printk("%s    BLACK HOLE: Clock check on header\n", 
+		printk(KERN_ERR "%s    BLACK HOLE: Clock check on header\n", 
 		       err_print_prefix);
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__BH_DBE_HDR)
-		printk("%s    BLACK HOLE: Uncorrectable Error on header\n",
+		printk(KERN_ERR "%s    BLACK HOLE: Uncorrectable Error on header\n",
 		       err_print_prefix);
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__BH_GBG_HDR)
-		printk("%s    BLACK HOLE: Garbage on header\n", 
+		printk(KERN_ERR "%s    BLACK HOLE: Garbage on header\n", 
 		       err_print_prefix);
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__BH_BAD_CMD)
-		printk("%s    BLACK HOLE: Bad EV7 command\n", 
+		printk(KERN_ERR "%s    BLACK HOLE: Bad EV7 command\n", 
 		       err_print_prefix);
 
 	if (io->po7_error_sum & IO7__PO7_ERRSUM__ERR_LST) 
-		printk("%s    Lost Error\n", err_print_prefix);
+		printk(KERN_ERR "%s    Lost Error\n", err_print_prefix);
 
-	printk("%s    Failing Packet:\n"
-	       "%s      Cycle 1: %016lx\n"
-	       "%s      Cycle 2: %016lx\n",
-	       err_print_prefix,
-	       err_print_prefix, io->po7_err_pkt0,
-	       err_print_prefix, io->po7_err_pkt1);
+	printk(KERN_ERR "%s    Failing Packet:\n", err_print_prefix);
+	printk(KERN_ERR "%s      Cycle 1: %016lx\n",
+		err_print_prefix, io->po7_err_pkt0);
+	printk(KERN_ERR "%s      Cycle 2: %016lx\n",
+		err_print_prefix, io->po7_err_pkt1);
 	/*
 	 * If there are any valid bits in UNCRR sym for this err, 
 	 * print UNCRR_SYM as well.
@@ -515,15 +511,12 @@ #define IO7__POX_TLBERR__FADDR__M		(0x3f
 	if (!(tlb_err & IO7__POX_TLBERR__ERR_VALID))
 		return;
 
-	printk("%s      TLB Error on index 0x%lx:\n"
-	       "%s        - %s\n"
-	       "%s        - Addr: 0x%016lx\n",
-	       err_print_prefix,
-	       EXTRACT(tlb_err, IO7__POX_TLBERR__ERR_TLB_PTR),
-	       err_print_prefix,
-	       tlb_errors[EXTRACT(tlb_err, IO7__POX_TLBERR__ERRCODE)],
-	       err_print_prefix,
-	       EXTRACT(tlb_err, IO7__POX_TLBERR__FADDR) << 6);
+	printk(KERN_ERR "%s      TLB Error on index 0x%lx:\n"
+		err_print_prefix, EXTRACT(tlb_err, IO7__POX_TLBERR__ERR_TLB_PTR));
+	printk(KERN_ERR "%s        - %s\n"
+		err_print_prefix, tlb_errors[EXTRACT(tlb_err, IO7__POX_TLBERR__ERRCODE)]);
+	printk(KERN_ERR "%s        - Addr: 0x%016lx\n",
+		err_print_prefix, EXTRACT(tlb_err, IO7__POX_TLBERR__FADDR) << 6);
 }
 
 static  void
@@ -551,13 +544,12 @@ #define IO7__POX_SPLCMPLT__REM_LOWER_ADD
 #define IO7__POX_SPLCMPLT__REM_BYTE_COUNT__S	(0)
 #define IO7__POX_SPLCMPLT__REM_BYTE_COUNT__M	(0xfff)
 
-	printk("%s      Split Completion Error:\n"	
-	       "%s         Source (Bus:Dev:Func): %ld:%ld:%ld\n",
-	       err_print_prefix,
-	       err_print_prefix,
-	       EXTRACT(spl_cmplt, IO7__POX_SPLCMPLT__SOURCE_BUS),
-	       EXTRACT(spl_cmplt, IO7__POX_SPLCMPLT__SOURCE_DEV),
-	       EXTRACT(spl_cmplt, IO7__POX_SPLCMPLT__SOURCE_FUNC));
+	printk(KERN_ERR "%s      Split Completion Error:\n", err_print_prefix);
+	printk(KERN_ERR "%s         Source (Bus:Dev:Func): %ld:%ld:%ld\n",
+		err_print_prefix,
+		EXTRACT(spl_cmplt, IO7__POX_SPLCMPLT__SOURCE_BUS),
+		EXTRACT(spl_cmplt, IO7__POX_SPLCMPLT__SOURCE_DEV),
+		EXTRACT(spl_cmplt, IO7__POX_SPLCMPLT__SOURCE_FUNC));
 
 	switch(EXTRACT(spl_cmplt, IO7__POX_SPLCMPLT__MSG_CLASSINDEX)) {
 	case 0x000:
@@ -583,7 +575,7 @@ #define IO7__POX_SPLCMPLT__REM_BYTE_COUN
 			EXTRACT(spl_cmplt, IO7__POX_SPLCMPLT__MESSAGE));
 		break;
 	}
-	printk("%s	   Message: %s\n", err_print_prefix, message);
+	printk(KERN_ERR "%s	   Message: %s\n", err_print_prefix, message);
 }
 
 static void
@@ -619,19 +611,18 @@ #define IO7__POX_TRANSUM__ERR_VALID		(1U
 	if (!(trans_sum & IO7__POX_TRANSUM__ERR_VALID))
 		return;
 
-	printk("%s      Transaction Summary:\n"
-	       "%s        Command: 0x%lx - %s\n"
-	       "%s        Address: 0x%016lx%s\n"
-	       "%s        PCI-X Master Slot: 0x%lx\n",
-	       err_print_prefix, 
-	       err_print_prefix, 
-	       EXTRACT(trans_sum, IO7__POX_TRANSUM__PCIX_CMD),
-	       pcix_cmd[EXTRACT(trans_sum, IO7__POX_TRANSUM__PCIX_CMD)],
-	       err_print_prefix,
-	       EXTRACT(trans_sum, IO7__POX_TRANSUM__PCI_ADDR),
-	       (trans_sum & IO7__POX_TRANSUM__DAC) ? " (DAC)" : "",
-	       err_print_prefix,
-	       EXTRACT(trans_sum, IO7__POX_TRANSUM__PCIX_MASTER_SLOT));
+	printk(KERN_ERR "%s      Transaction Summary:\n", err_print_prefix
+	printk(KERN_ERR "%s        Command: 0x%lx - %s\n"
+		err_print_prefix, 
+		EXTRACT(trans_sum, IO7__POX_TRANSUM__PCIX_CMD),
+		pcix_cmd[EXTRACT(trans_sum, IO7__POX_TRANSUM__PCIX_CMD)],
+	printk(KERN_ERR "%s        Address: 0x%016lx%s\n"
+		err_print_prefix,
+		EXTRACT(trans_sum, IO7__POX_TRANSUM__PCI_ADDR),
+		(trans_sum & IO7__POX_TRANSUM__DAC) ? " (DAC)" : "",
+	printk(KERN_ERR "%s        PCI-X Master Slot: 0x%lx\n",
+		err_print_prefix,
+		EXTRACT(trans_sum, IO7__POX_TRANSUM__PCIX_MASTER_SLOT));
 }
 
 static void
@@ -692,43 +683,43 @@ #define IO7__POX_ERRSUM__TRANS_SUM__MASK
 	 * First the transaction summary errors
 	 */
 	if (err_sum & IO7__POX_ERRSUM__MRETRY_TO)
-		printk("%s    IO7 Master Retry Timeout expired\n",
+		printk(KERN_ERR "%s    IO7 Master Retry Timeout expired\n",
 		       err_print_prefix);
 	if (err_sum & IO7__POX_ERRSUM__PCIX_UX_SPL)
-		printk("%s    Unexpected Split Completion\n",
+		printk(KERN_ERR "%s    Unexpected Split Completion\n",
 		       err_print_prefix);
 	if (err_sum & IO7__POX_ERRSUM__PCIX_SPLIT_TO)
-		printk("%s    IO7 Split Completion Timeout expired\n",
+		printk(KERN_ERR "%s    IO7 Split Completion Timeout expired\n",
 		       err_print_prefix);
 	if (err_sum & IO7__POX_ERRSUM__DMA_TO)
-		printk("%s    Hung bus during DMA transaction\n",
+		printk(KERN_ERR "%s    Hung bus during DMA transaction\n",
 		       err_print_prefix);
 	if (err_sum & IO7__POX_ERRSUM__MABORT_MASK)
-		printk("%s    Master Abort\n", err_print_prefix);
+		printk(KERN_ERR "%s    Master Abort\n", err_print_prefix);
 	if (err_sum & IO7__POX_ERRSUM__PT_TABORT)
-		printk("%s    IO7 Asserted Target Abort\n", err_print_prefix);
+		printk(KERN_ERR "%s    IO7 Asserted Target Abort\n", err_print_prefix);
 	if (err_sum & IO7__POX_ERRSUM__PM_TABORT)
-		printk("%s    IO7 Received Target Abort\n", err_print_prefix);
+		printk(KERN_ERR "%s    IO7 Received Target Abort\n", err_print_prefix);
 	if (err_sum & IO7__POX_ERRSUM__ADDRERR_STB) {
-		printk("%s    Address or PCI-X Attribute Parity Error\n", 
+		printk(KERN_ERR "%s    Address or PCI-X Attribute Parity Error\n", 
 		       err_print_prefix);
 		if (err_sum & IO7__POX_ERRSUM__SERR)
-			printk("%s     IO7 Asserted SERR\n", err_print_prefix);
+			printk(KERN_ERR "%s     IO7 Asserted SERR\n", err_print_prefix);
 	}
 	if (err_sum & IO7__POX_ERRSUM__PERR) {
 		if (err_sum & IO7__POX_ERRSUM__DATAERR_STB_NIOW)
-			printk("%s    IO7 Detected Data Parity Error\n",
+			printk(KERN_ERR "%s    IO7 Detected Data Parity Error\n",
 			       err_print_prefix);
 		else
-			printk("%s    Split Completion Response with "
+			printk(KERN_ERR "%s    Split Completion Response with "
 			       "Parity Error\n", err_print_prefix);
 	}
 	if (err_sum & IO7__POX_ERRSUM__DETECTED_PERR)
-		printk("%s    PERR detected\n", err_print_prefix);
+		printk(KERN_ERR "%s    PERR detected\n", err_print_prefix);
 	if (err_sum & IO7__POX_ERRSUM__PM_PERR)
-		printk("%s    PERR while IO7 is master\n", err_print_prefix);
+		printk(KERN_ERR "%s    PERR while IO7 is master\n", err_print_prefix);
 	if (err_sum & IO7__POX_ERRSUM__PT_SCERROR) {
-		printk("%s    IO7 Received Split Completion Error message\n",
+		printk(KERN_ERR "%s    IO7 Received Split Completion Error message\n",
 		       err_print_prefix);
 		marvel_print_pox_spl_cmplt(port->pox_spl_cmplt);
 	}
@@ -747,10 +738,10 @@ #define IO7__POX_ERRSUM__TRANS_SUM__MASK
 			"PPR - RD error (see north port)"
 		};
 
-		printk("%s    UPE Error:\n", err_print_prefix);
+		printk(KERN_ERR "%s    UPE Error:\n", err_print_prefix);
 		for (i = 0; i < 8; i++) {
 			if (upe_error & (1 << i))
-				printk("%s      %s\n", err_print_prefix,
+				printk(KERN_ERR "%s      %s\n", err_print_prefix,
 				       upe_errors[i]);
 		}
 	}
@@ -765,7 +756,7 @@ #define IO7__POX_ERRSUM__TRANS_SUM__MASK
 	 * Then TLB_ERR.
 	 */
 	if (err_sum & IO7__POX_ERRSUM__TLB_ERR) {
-		printk("%s    TLB ERROR\n", err_print_prefix);
+		printk(KERN_ERR "%s    TLB ERROR\n", err_print_prefix);
 		marvel_print_pox_tlb_err(port->pox_tlb_err);
 	}
 
@@ -773,21 +764,21 @@ #define IO7__POX_ERRSUM__TRANS_SUM__MASK
 	 * And the single bit status errors.
 	 */
 	if (err_sum & IO7__POX_ERRSUM__AGP_REQQ_OVFL)
-		printk("%s    AGP Request Queue Overflow\n", err_print_prefix);
+		printk(KERN_ERR "%s    AGP Request Queue Overflow\n", err_print_prefix);
 	if (err_sum & IO7__POX_ERRSUM__AGP_SYNC_ERR)
-		printk("%s    AGP Sync Error\n", err_print_prefix);
+		printk(KERN_ERR "%s    AGP Sync Error\n", err_print_prefix);
 	if (err_sum & IO7__POX_ERRSUM__PCIX_DISCARD_SPL)
-		printk("%s    Discarded split completion\n", err_print_prefix);
+		printk(KERN_ERR "%s    Discarded split completion\n", err_print_prefix);
 	if (err_sum & IO7__POX_ERRSUM__DMA_RD_TO)
-		printk("%s    DMA Read Timeout\n", err_print_prefix);
+		printk(KERN_ERR "%s    DMA Read Timeout\n", err_print_prefix);
 	if (err_sum & IO7__POX_ERRSUM__CSR_NXM_RD)
-		printk("%s    CSR NXM READ\n", err_print_prefix);
+		printk(KERN_ERR "%s    CSR NXM READ\n", err_print_prefix);
 	if (err_sum & IO7__POX_ERRSUM__CSR_NXM_WR)
-		printk("%s    CSR NXM WRITE\n", err_print_prefix);
+		printk(KERN_ERR "%s    CSR NXM WRITE\n", err_print_prefix);
 	if (err_sum & IO7__POX_ERRSUM__DETECTED_SERR)
-		printk("%s    SERR detected\n", err_print_prefix);
+		printk(KERN_ERR "%s    SERR detected\n", err_print_prefix);
 	if (err_sum & IO7__POX_ERRSUM__HUNG_BUS)
-		printk("%s    HUNG BUS detected\n", err_print_prefix);
+		printk(KERN_ERR "%s    HUNG BUS detected\n", err_print_prefix);
 }
 
 #endif /* CONFIG_VERBOSE_MCHECK */
@@ -987,12 +978,12 @@ #endif
 		if (!MARVEL_IO_ERR_VALID(io->ports[i].pox_err_sum))
 			continue;
 
-		printk("%s  PID %u PORT %d POx_ERR_SUM: %016lx\n", 
+		printk(KERN_ERR "%s  PID %u PORT %d POx_ERR_SUM: %016lx\n", 
 		       err_print_prefix, 
 		       lf_subpackets->io_pid, i, io->ports[i].pox_err_sum);
 		marvel_print_pox_err(io->ports[i].pox_err_sum, &io->ports[i]);
 
-		printk("%s  [ POx_FIRST_ERR: %016lx ]\n", 
+		printk(KERN_ERR "%s  [ POx_FIRST_ERR: %016lx ]\n", 
 		       err_print_prefix, io->ports[i].pox_first_err);
 		marvel_print_pox_err(io->ports[i].pox_first_err, 
 				     &io->ports[i]);
@@ -1128,7 +1119,7 @@ marvel_machine_check(u64 vector, u64 la_
 
 	case MCHK_DISPOSITION_REPORT:
 		/* Recognized error, report it. */
-		printk("%s*%s (Vector 0x%x) reported on CPU %d\n",
+		printk(KERN_ERR "%s*%s (Vector 0x%x) reported on CPU %d\n",
 		       err_print_prefix, error_type,
 		       (unsigned int)vector, (int)smp_processor_id());
 		el_print_timestamp(&lf_subpackets->logout->timestamp);
@@ -1137,7 +1128,7 @@ marvel_machine_check(u64 vector, u64 la_
 
 	default:
 		/* Unknown - dump the annotated subpackets. */
-		printk("%s*%s (Vector 0x%x) reported on CPU %d\n",
+		printk(KERN_ERR "%s*%s (Vector 0x%x) reported on CPU %d\n",
 		       err_print_prefix, error_type,
 		       (unsigned int)vector, (int)smp_processor_id());
 		el_process_subpacket(el_ptr);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
