From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Fri, 16 Aug 2013 19:06:47 +0000
Subject: [PATCH 6/6] for fixing xhci_readl call in xhci_dbg.c after removing xhci_hcd from function definitio
Message-Id: <1376679287-15609-1-git-send-email-kumargauravgupta3@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130816185957.GD8768@kroah.com>
In-Reply-To: <20130816185957.GD8768@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

---
 drivers/usb/host/xhci-dbg.c |   36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/host/xhci-dbg.c b/drivers/usb/host/xhci-dbg.c
index 5d5e58f..66dc1c0 100644
--- a/drivers/usb/host/xhci-dbg.c
+++ b/drivers/usb/host/xhci-dbg.c
@@ -32,7 +32,7 @@ void xhci_dbg_regs(struct xhci_hcd *xhci)
 
 	xhci_dbg(xhci, "// xHCI capability registers at %p:\n",
 			xhci->cap_regs);
-	temp = xhci_readl(xhci, &xhci->cap_regs->hc_capbase);
+	temp = xhci_readl(&xhci->cap_regs->hc_capbase);
 	xhci_dbg(xhci, "// @%p = 0x%x (CAPLENGTH AND HCIVERSION)\n",
 			&xhci->cap_regs->hc_capbase, temp);
 	xhci_dbg(xhci, "//   CAPLENGTH: 0x%x\n",
@@ -44,13 +44,13 @@ void xhci_dbg_regs(struct xhci_hcd *xhci)
 
 	xhci_dbg(xhci, "// xHCI operational registers at %p:\n", xhci->op_regs);
 
-	temp = xhci_readl(xhci, &xhci->cap_regs->run_regs_off);
+	temp = xhci_readl(&xhci->cap_regs->run_regs_off);
 	xhci_dbg(xhci, "// @%p = 0x%x RTSOFF\n",
 			&xhci->cap_regs->run_regs_off,
 			(unsigned int) temp & RTSOFF_MASK);
 	xhci_dbg(xhci, "// xHCI runtime registers at %p:\n", xhci->run_regs);
 
-	temp = xhci_readl(xhci, &xhci->cap_regs->db_off);
+	temp = xhci_readl(&xhci->cap_regs->db_off);
 	xhci_dbg(xhci, "// @%p = 0x%x DBOFF\n", &xhci->cap_regs->db_off, temp);
 	xhci_dbg(xhci, "// Doorbell array at %p:\n", xhci->dba);
 }
@@ -61,7 +61,7 @@ static void xhci_print_cap_regs(struct xhci_hcd *xhci)
 
 	xhci_dbg(xhci, "xHCI capability registers at %p:\n", xhci->cap_regs);
 
-	temp = xhci_readl(xhci, &xhci->cap_regs->hc_capbase);
+	temp = xhci_readl(&xhci->cap_regs->hc_capbase);
 	xhci_dbg(xhci, "CAPLENGTH AND HCIVERSION 0x%x:\n",
 			(unsigned int) temp);
 	xhci_dbg(xhci, "CAPLENGTH: 0x%x\n",
@@ -69,7 +69,7 @@ static void xhci_print_cap_regs(struct xhci_hcd *xhci)
 	xhci_dbg(xhci, "HCIVERSION: 0x%x\n",
 			(unsigned int) HC_VERSION(temp));
 
-	temp = xhci_readl(xhci, &xhci->cap_regs->hcs_params1);
+	temp = xhci_readl(&xhci->cap_regs->hcs_params1);
 	xhci_dbg(xhci, "HCSPARAMS 1: 0x%x\n",
 			(unsigned int) temp);
 	xhci_dbg(xhci, "  Max device slots: %u\n",
@@ -79,7 +79,7 @@ static void xhci_print_cap_regs(struct xhci_hcd *xhci)
 	xhci_dbg(xhci, "  Max ports: %u\n",
 			(unsigned int) HCS_MAX_PORTS(temp));
 
-	temp = xhci_readl(xhci, &xhci->cap_regs->hcs_params2);
+	temp = xhci_readl(&xhci->cap_regs->hcs_params2);
 	xhci_dbg(xhci, "HCSPARAMS 2: 0x%x\n",
 			(unsigned int) temp);
 	xhci_dbg(xhci, "  Isoc scheduling threshold: %u\n",
@@ -87,7 +87,7 @@ static void xhci_print_cap_regs(struct xhci_hcd *xhci)
 	xhci_dbg(xhci, "  Maximum allowed segments in event ring: %u\n",
 			(unsigned int) HCS_ERST_MAX(temp));
 
-	temp = xhci_readl(xhci, &xhci->cap_regs->hcs_params3);
+	temp = xhci_readl(&xhci->cap_regs->hcs_params3);
 	xhci_dbg(xhci, "HCSPARAMS 3 0x%x:\n",
 			(unsigned int) temp);
 	xhci_dbg(xhci, "  Worst case U1 device exit latency: %u\n",
@@ -95,14 +95,14 @@ static void xhci_print_cap_regs(struct xhci_hcd *xhci)
 	xhci_dbg(xhci, "  Worst case U2 device exit latency: %u\n",
 			(unsigned int) HCS_U2_LATENCY(temp));
 
-	temp = xhci_readl(xhci, &xhci->cap_regs->hcc_params);
+	temp = xhci_readl(&xhci->cap_regs->hcc_params);
 	xhci_dbg(xhci, "HCC PARAMS 0x%x:\n", (unsigned int) temp);
 	xhci_dbg(xhci, "  HC generates %s bit addresses\n",
 			HCC_64BIT_ADDR(temp) ? "64" : "32");
 	/* FIXME */
 	xhci_dbg(xhci, "  FIXME: more HCCPARAMS debugging\n");
 
-	temp = xhci_readl(xhci, &xhci->cap_regs->run_regs_off);
+	temp = xhci_readl(&xhci->cap_regs->run_regs_off);
 	xhci_dbg(xhci, "RTSOFF 0x%x:\n", temp & RTSOFF_MASK);
 }
 
@@ -110,7 +110,7 @@ static void xhci_print_command_reg(struct xhci_hcd *xhci)
 {
 	u32 temp;
 
-	temp = xhci_readl(xhci, &xhci->op_regs->command);
+	temp = xhci_readl(&xhci->op_regs->command);
 	xhci_dbg(xhci, "USBCMD 0x%x:\n", temp);
 	xhci_dbg(xhci, "  HC is %s\n",
 			(temp & CMD_RUN) ? "running" : "being stopped");
@@ -128,7 +128,7 @@ static void xhci_print_status(struct xhci_hcd *xhci)
 {
 	u32 temp;
 
-	temp = xhci_readl(xhci, &xhci->op_regs->status);
+	temp = xhci_readl(&xhci->op_regs->status);
 	xhci_dbg(xhci, "USBSTS 0x%x:\n", temp);
 	xhci_dbg(xhci, "  Event ring is %sempty\n",
 			(temp & STS_EINT) ? "not " : "");
@@ -163,7 +163,7 @@ static void xhci_print_ports(struct xhci_hcd *xhci)
 		for (j = 0; j < NUM_PORT_REGS; ++j) {
 			xhci_dbg(xhci, "%p port %s reg = 0x%x\n",
 					addr, names[j],
-					(unsigned int) xhci_readl(xhci, addr));
+					(unsigned int) xhci_readl(addr));
 			addr++;
 		}
 	}
@@ -177,7 +177,7 @@ void xhci_print_ir_set(struct xhci_hcd *xhci, int set_num)
 	u64 temp_64;
 
 	addr = &ir_set->irq_pending;
-	temp = xhci_readl(xhci, addr);
+	temp = xhci_readl(addr);
 	if (temp = XHCI_INIT_VALUE)
 		return;
 
@@ -187,17 +187,17 @@ void xhci_print_ir_set(struct xhci_hcd *xhci, int set_num)
 			(unsigned int)temp);
 
 	addr = &ir_set->irq_control;
-	temp = xhci_readl(xhci, addr);
+	temp = xhci_readl(addr);
 	xhci_dbg(xhci, "  %p: ir_set.control = 0x%x\n", addr,
 			(unsigned int)temp);
 
 	addr = &ir_set->erst_size;
-	temp = xhci_readl(xhci, addr);
+	temp = xhci_readl(addr);
 	xhci_dbg(xhci, "  %p: ir_set.erst_size = 0x%x\n", addr,
 			(unsigned int)temp);
 
 	addr = &ir_set->rsvd;
-	temp = xhci_readl(xhci, addr);
+	temp = xhci_readl(addr);
 	if (temp != XHCI_INIT_VALUE)
 		xhci_dbg(xhci, "  WARN: %p: ir_set.rsvd = 0x%x\n",
 				addr, (unsigned int)temp);
@@ -219,12 +219,12 @@ void xhci_print_run_regs(struct xhci_hcd *xhci)
 	int i;
 
 	xhci_dbg(xhci, "xHCI runtime registers at %p:\n", xhci->run_regs);
-	temp = xhci_readl(xhci, &xhci->run_regs->microframe_index);
+	temp = xhci_readl(&xhci->run_regs->microframe_index);
 	xhci_dbg(xhci, "  %p: Microframe index = 0x%x\n",
 			&xhci->run_regs->microframe_index,
 			(unsigned int) temp);
 	for (i = 0; i < 7; ++i) {
-		temp = xhci_readl(xhci, &xhci->run_regs->rsvd[i]);
+		temp = xhci_readl(&xhci->run_regs->rsvd[i]);
 		if (temp != XHCI_INIT_VALUE)
 			xhci_dbg(xhci, "  WARN: %p: Rsvd[%i] = 0x%x\n",
 					&xhci->run_regs->rsvd[i],
-- 
1.7.9.5

