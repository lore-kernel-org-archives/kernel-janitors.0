From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Fri, 16 Aug 2013 18:50:31 +0000
Subject: [PATCH 2/6] drivers/usb/host/xhci.c Fixing xhci_readl call
Message-Id: <1376678958-15316-1-git-send-email-kumargauravgupta3@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixed xhci_readl call issue as per definition modified in patch
0019-drivers-usb-host-xhci.h-Removing-xhci_hcd-from-argum.patch

Signed-off-by: Kumar Gaurav <kumargauravgupta3@gmail.com>
---
 drivers/usb/host/xhci.c |  100 +++++++++++++++++++++++------------------------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 2c49f00..9685fca 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -58,7 +58,7 @@ int xhci_handshake(struct xhci_hcd *xhci, void __iomem *ptr,
 	u32	result;
 
 	do {
-		result = xhci_readl(xhci, ptr);
+		result = xhci_readl(ptr);
 		if (result = ~(u32)0)		/* card removed */
 			return -ENODEV;
 		result &= mask;
@@ -80,11 +80,11 @@ void xhci_quiesce(struct xhci_hcd *xhci)
 	u32 mask;
 
 	mask = ~(XHCI_IRQS);
-	halted = xhci_readl(xhci, &xhci->op_regs->status) & STS_HALT;
+	halted = xhci_readl(&xhci->op_regs->status) & STS_HALT;
 	if (!halted)
 		mask &= ~CMD_RUN;
 
-	cmd = xhci_readl(xhci, &xhci->op_regs->command);
+	cmd = xhci_readl(&xhci->op_regs->command);
 	cmd &= mask;
 	xhci_writel(xhci, cmd, &xhci->op_regs->command);
 }
@@ -122,7 +122,7 @@ static int xhci_start(struct xhci_hcd *xhci)
 	u32 temp;
 	int ret;
 
-	temp = xhci_readl(xhci, &xhci->op_regs->command);
+	temp = xhci_readl(&xhci->op_regs->command);
 	temp |= (CMD_RUN);
 	xhci_dbg(xhci, "// Turn on HC, cmd = 0x%x.\n",
 			temp);
@@ -156,14 +156,14 @@ int xhci_reset(struct xhci_hcd *xhci)
 	u32 state;
 	int ret, i;
 
-	state = xhci_readl(xhci, &xhci->op_regs->status);
+	state = xhci_readl(&xhci->op_regs->status);
 	if ((state & STS_HALT) = 0) {
 		xhci_warn(xhci, "Host controller not halted, aborting reset.\n");
 		return 0;
 	}
 
 	xhci_dbg(xhci, "// Reset the HC\n");
-	command = xhci_readl(xhci, &xhci->op_regs->command);
+	command = xhci_readl(&xhci->op_regs->command);
 	command |= CMD_RESET;
 	xhci_writel(xhci, command, &xhci->op_regs->command);
 
@@ -411,7 +411,7 @@ static void compliance_mode_recovery(unsigned long arg)
 	xhci = (struct xhci_hcd *)arg;
 
 	for (i = 0; i < xhci->num_usb3_ports; i++) {
-		temp = xhci_readl(xhci, xhci->usb3_ports[i]);
+		temp = xhci_readl(xhci->usb3_ports[i]);
 		if ((temp & PORT_PLS_MASK) = USB_SS_PORT_LS_COMP_MOD) {
 			/*
 			 * Compliance Mode Detected. Letting USB Core
@@ -540,7 +540,7 @@ static void xhci_event_ring_work(unsigned long arg)
 	xhci_dbg(xhci, "Poll event ring: %lu\n", jiffies);
 
 	spin_lock_irqsave(&xhci->lock, flags);
-	temp = xhci_readl(xhci, &xhci->op_regs->status);
+	temp = xhci_readl(&xhci->op_regs->status);
 	xhci_dbg(xhci, "op reg status = 0x%x\n", temp);
 	if (temp = 0xffffffff || (xhci->xhc_state & XHCI_STATE_DYING) ||
 			(xhci->xhc_state & XHCI_STATE_HALTED)) {
@@ -549,7 +549,7 @@ static void xhci_event_ring_work(unsigned long arg)
 		return;
 	}
 
-	temp = xhci_readl(xhci, &xhci->ir_set->irq_pending);
+	temp = xhci_readl(&xhci->ir_set->irq_pending);
 	xhci_dbg(xhci, "ir_set 0 pending = 0x%x\n", temp);
 	xhci_dbg(xhci, "HC error bitmask = 0x%x\n", xhci->error_bitmask);
 	xhci->error_bitmask = 0;
@@ -654,19 +654,19 @@ int xhci_run(struct usb_hcd *hcd)
 	xhci_dbg(xhci, "ERST deq = 64'h%0lx\n", (long unsigned int) temp_64);
 
 	xhci_dbg(xhci, "// Set the interrupt modulation register\n");
-	temp = xhci_readl(xhci, &xhci->ir_set->irq_control);
+	temp = xhci_readl(&xhci->ir_set->irq_control);
 	temp &= ~ER_IRQ_INTERVAL_MASK;
 	temp |= (u32) 160;
 	xhci_writel(xhci, temp, &xhci->ir_set->irq_control);
 
 	/* Set the HCD state before we enable the irqs */
-	temp = xhci_readl(xhci, &xhci->op_regs->command);
+	temp = xhci_readl(&xhci->op_regs->command);
 	temp |= (CMD_EIE);
 	xhci_dbg(xhci, "// Enable interrupts, cmd = 0x%x.\n",
 			temp);
 	xhci_writel(xhci, temp, &xhci->op_regs->command);
 
-	temp = xhci_readl(xhci, &xhci->ir_set->irq_pending);
+	temp = xhci_readl(&xhci->ir_set->irq_pending);
 	xhci_dbg(xhci, "// Enabling event ring interrupter %p by writing 0x%x to irq_pending\n",
 			xhci->ir_set, (unsigned int) ER_IRQ_ENABLE(temp));
 	xhci_writel(xhci, ER_IRQ_ENABLE(temp),
@@ -743,9 +743,9 @@ void xhci_stop(struct usb_hcd *hcd)
 		usb_amd_dev_put();
 
 	xhci_dbg(xhci, "// Disabling event ring interrupts\n");
-	temp = xhci_readl(xhci, &xhci->op_regs->status);
+	temp = xhci_readl(&xhci->op_regs->status);
 	xhci_writel(xhci, temp & ~STS_EINT, &xhci->op_regs->status);
-	temp = xhci_readl(xhci, &xhci->ir_set->irq_pending);
+	temp = xhci_readl(&xhci->ir_set->irq_pending);
 	xhci_writel(xhci, ER_IRQ_DISABLE(temp),
 			&xhci->ir_set->irq_pending);
 	xhci_print_ir_set(xhci, 0);
@@ -753,7 +753,7 @@ void xhci_stop(struct usb_hcd *hcd)
 	xhci_dbg(xhci, "cleaning up memory\n");
 	xhci_mem_cleanup(xhci);
 	xhci_dbg(xhci, "xhci_stop completed - status = %x\n",
-		    xhci_readl(xhci, &xhci->op_regs->status));
+		    xhci_readl(&xhci->op_regs->status));
 }
 
 /*
@@ -779,21 +779,21 @@ void xhci_shutdown(struct usb_hcd *hcd)
 	xhci_cleanup_msix(xhci);
 
 	xhci_dbg(xhci, "xhci_shutdown completed - status = %x\n",
-		    xhci_readl(xhci, &xhci->op_regs->status));
+		    xhci_readl(&xhci->op_regs->status));
 }
 
 #ifdef CONFIG_PM
 static void xhci_save_registers(struct xhci_hcd *xhci)
 {
-	xhci->s3.command = xhci_readl(xhci, &xhci->op_regs->command);
-	xhci->s3.dev_nt = xhci_readl(xhci, &xhci->op_regs->dev_notification);
+	xhci->s3.command = xhci_readl(&xhci->op_regs->command);
+	xhci->s3.dev_nt = xhci_readl(&xhci->op_regs->dev_notification);
 	xhci->s3.dcbaa_ptr = xhci_read_64(xhci, &xhci->op_regs->dcbaa_ptr);
-	xhci->s3.config_reg = xhci_readl(xhci, &xhci->op_regs->config_reg);
-	xhci->s3.erst_size = xhci_readl(xhci, &xhci->ir_set->erst_size);
+	xhci->s3.config_reg = xhci_readl(&xhci->op_regs->config_reg);
+	xhci->s3.erst_size = xhci_readl(&xhci->ir_set->erst_size);
 	xhci->s3.erst_base = xhci_read_64(xhci, &xhci->ir_set->erst_base);
 	xhci->s3.erst_dequeue = xhci_read_64(xhci, &xhci->ir_set->erst_dequeue);
-	xhci->s3.irq_pending = xhci_readl(xhci, &xhci->ir_set->irq_pending);
-	xhci->s3.irq_control = xhci_readl(xhci, &xhci->ir_set->irq_control);
+	xhci->s3.irq_pending = xhci_readl(&xhci->ir_set->irq_pending);
+	xhci->s3.irq_control = xhci_readl(&xhci->ir_set->irq_control);
 }
 
 static void xhci_restore_registers(struct xhci_hcd *xhci)
@@ -900,7 +900,7 @@ int xhci_suspend(struct xhci_hcd *xhci)
 	/* skipped assuming that port suspend has done */
 
 	/* step 2: clear Run/Stop bit */
-	command = xhci_readl(xhci, &xhci->op_regs->command);
+	command = xhci_readl(&xhci->op_regs->command);
 	command &= ~CMD_RUN;
 	xhci_writel(xhci, command, &xhci->op_regs->command);
 	if (xhci_handshake(xhci, &xhci->op_regs->status,
@@ -915,7 +915,7 @@ int xhci_suspend(struct xhci_hcd *xhci)
 	xhci_save_registers(xhci);
 
 	/* step 4: set CSS flag */
-	command = xhci_readl(xhci, &xhci->op_regs->command);
+	command = xhci_readl(&xhci->op_regs->command);
 	command |= CMD_CSS;
 	xhci_writel(xhci, command, &xhci->op_regs->command);
 	if (xhci_handshake(xhci, &xhci->op_regs->status,
@@ -980,7 +980,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		xhci_set_cmd_ring_deq(xhci);
 		/* step 3: restore state and start state*/
 		/* step 3: set CRS flag */
-		command = xhci_readl(xhci, &xhci->op_regs->command);
+		command = xhci_readl(&xhci->op_regs->command);
 		command |= CMD_CRS;
 		xhci_writel(xhci, command, &xhci->op_regs->command);
 		if (xhci_handshake(xhci, &xhci->op_regs->status,
@@ -989,7 +989,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 			spin_unlock_irq(&xhci->lock);
 			return -ETIMEDOUT;
 		}
-		temp = xhci_readl(xhci, &xhci->op_regs->status);
+		temp = xhci_readl(&xhci->op_regs->status);
 	}
 
 	/* If restore operation fails, re-initialize the HC during resume */
@@ -1018,9 +1018,9 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 #endif
 
 		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
-		temp = xhci_readl(xhci, &xhci->op_regs->status);
+		temp = xhci_readl(&xhci->op_regs->status);
 		xhci_writel(xhci, temp & ~STS_EINT, &xhci->op_regs->status);
-		temp = xhci_readl(xhci, &xhci->ir_set->irq_pending);
+		temp = xhci_readl(&xhci->ir_set->irq_pending);
 		xhci_writel(xhci, ER_IRQ_DISABLE(temp),
 				&xhci->ir_set->irq_pending);
 		xhci_print_ir_set(xhci, 0);
@@ -1028,7 +1028,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		xhci_dbg(xhci, "cleaning up memory\n");
 		xhci_mem_cleanup(xhci);
 		xhci_dbg(xhci, "xhci_stop completed - status = %x\n",
-			    xhci_readl(xhci, &xhci->op_regs->status));
+			    xhci_readl(&xhci->op_regs->status));
 
 		/* USB core calls the PCI reinit and start functions twice:
 		 * first with the primary HCD, and then with the secondary HCD.
@@ -1057,7 +1057,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 	}
 
 	/* step 4: set Run/Stop bit */
-	command = xhci_readl(xhci, &xhci->op_regs->command);
+	command = xhci_readl(&xhci->op_regs->command);
 	command |= CMD_RUN;
 	xhci_writel(xhci, command, &xhci->op_regs->command);
 	xhci_handshake(xhci, &xhci->op_regs->status, STS_HALT,
@@ -1496,7 +1496,7 @@ int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 	ret = usb_hcd_check_unlink_urb(hcd, urb, status);
 	if (ret || !urb->hcpriv)
 		goto done;
-	temp = xhci_readl(xhci, &xhci->op_regs->status);
+	temp = xhci_readl(&xhci->op_regs->status);
 	if (temp = 0xffffffff || (xhci->xhc_state & XHCI_STATE_HALTED)) {
 		xhci_dbg(xhci, "HW died, freeing TD.\n");
 		urb_priv = urb->hcpriv;
@@ -3606,7 +3606,7 @@ void xhci_free_dev(struct usb_hcd *hcd, struct usb_device *udev)
 
 	spin_lock_irqsave(&xhci->lock, flags);
 	/* Don't disable the slot if the host controller is dead. */
-	state = xhci_readl(xhci, &xhci->op_regs->status);
+	state = xhci_readl(&xhci->op_regs->status);
 	if (state = 0xffffffff || (xhci->xhc_state & XHCI_STATE_DYING) ||
 			(xhci->xhc_state & XHCI_STATE_HALTED)) {
 		xhci_free_virt_device(xhci, udev->slot_id);
@@ -4088,12 +4088,12 @@ static int xhci_usb2_software_lpm_test(struct usb_hcd *hcd,
 			PORT_L1S_MASK, PORT_L1S_SUCCESS, 125);
 	if (ret != -ETIMEDOUT) {
 		/* enter L1 successfully */
-		temp = xhci_readl(xhci, addr);
+		temp = xhci_readl(addr);
 		xhci_dbg(xhci, "port %d entered L1 state, port status 0x%x\n",
 				port_num, temp);
 		ret = 0;
 	} else {
-		temp = xhci_readl(xhci, pm_addr);
+		temp = xhci_readl(pm_addr);
 		xhci_dbg(xhci, "port %d software lpm failed, L1 status %d\n",
 				port_num, temp & PORT_L1S_MASK);
 		ret = -EINVAL;
@@ -4111,7 +4111,7 @@ static int xhci_usb2_software_lpm_test(struct usb_hcd *hcd,
 
 	/* Check PORTSC to make sure the device is in the right state */
 	if (!ret) {
-		temp = xhci_readl(xhci, addr);
+		temp = xhci_readl(addr);
 		xhci_dbg(xhci, "resumed port %d status 0x%x\n",	port_num, temp);
 		if (!(temp & PORT_CONNECT) || !(temp & PORT_PE) ||
 				(temp & PORT_PLS_MASK) != XDEV_U0) {
@@ -4169,7 +4169,7 @@ int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 	port_array = xhci->usb2_ports;
 	port_num = udev->portnum - 1;
 	pm_addr = port_array[port_num] + PORTPMSC;
-	pm_val = xhci_readl(xhci, pm_addr);
+	pm_val = xhci_readl(pm_addr);
 	hlpm_addr = port_array[port_num] + PORTHLPMC;
 	field = le32_to_cpu(udev->bos->ext_cap->bmAttributes);
 
@@ -4211,7 +4211,7 @@ int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 			hlpm_val = xhci_calculate_usb2_hw_lpm_params(udev);
 			xhci_writel(xhci, hlpm_val, hlpm_addr);
 			/* flush write */
-			xhci_readl(xhci, hlpm_addr);
+			xhci_readl(hlpm_addr);
 		} else {
 			hird = xhci_calculate_hird_besl(xhci, udev);
 		}
@@ -4219,16 +4219,16 @@ int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 		pm_val &= ~PORT_HIRD_MASK;
 		pm_val |= PORT_HIRD(hird) | PORT_RWE;
 		xhci_writel(xhci, pm_val, pm_addr);
-		pm_val = xhci_readl(xhci, pm_addr);
+		pm_val = xhci_readl(pm_addr);
 		pm_val |= PORT_HLE;
 		xhci_writel(xhci, pm_val, pm_addr);
 		/* flush write */
-		xhci_readl(xhci, pm_addr);
+		xhci_readl(pm_addr);
 	} else {
 		pm_val &= ~(PORT_HLE | PORT_RWE | PORT_HIRD_MASK);
 		xhci_writel(xhci, pm_val, pm_addr);
 		/* flush write */
-		xhci_readl(xhci, pm_addr);
+		xhci_readl(pm_addr);
 		if (udev->usb2_hw_lpm_besl_capable) {
 			spin_unlock_irqrestore(&xhci->lock, flags);
 			mutex_lock(hcd->bandwidth_mutex);
@@ -4829,7 +4829,7 @@ int xhci_get_frame(struct usb_hcd *hcd)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	/* EHCI mods by the periodic size.  Why? */
-	return xhci_readl(xhci, &xhci->run_regs->microframe_index) >> 3;
+	return xhci_readl(&xhci->run_regs->microframe_index) >> 3;
 }
 
 int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
@@ -4866,7 +4866,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 		 * registered roothub.
 		 */
 		xhci = hcd_to_xhci(hcd);
-		temp = xhci_readl(xhci, &xhci->cap_regs->hcc_params);
+		temp = xhci_readl(&xhci->cap_regs->hcc_params);
 		if (HCC_64BIT_ADDR(temp)) {
 			xhci_dbg(xhci, "Enabling 64-bit DMA addresses.\n");
 			dma_set_mask(hcd->self.controller, DMA_BIT_MASK(64));
@@ -4878,16 +4878,16 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 
 	xhci->cap_regs = hcd->regs;
 	xhci->op_regs = hcd->regs +
-		HC_LENGTH(xhci_readl(xhci, &xhci->cap_regs->hc_capbase));
+		HC_LENGTH(xhci_readl(&xhci->cap_regs->hc_capbase));
 	xhci->run_regs = hcd->regs +
-		(xhci_readl(xhci, &xhci->cap_regs->run_regs_off) & RTSOFF_MASK);
+		(xhci_readl(&xhci->cap_regs->run_regs_off) & RTSOFF_MASK);
 	/* Cache read-only capability registers */
-	xhci->hcs_params1 = xhci_readl(xhci, &xhci->cap_regs->hcs_params1);
-	xhci->hcs_params2 = xhci_readl(xhci, &xhci->cap_regs->hcs_params2);
-	xhci->hcs_params3 = xhci_readl(xhci, &xhci->cap_regs->hcs_params3);
-	xhci->hcc_params = xhci_readl(xhci, &xhci->cap_regs->hc_capbase);
+	xhci->hcs_params1 = xhci_readl(&xhci->cap_regs->hcs_params1);
+	xhci->hcs_params2 = xhci_readl(&xhci->cap_regs->hcs_params2);
+	xhci->hcs_params3 = xhci_readl(&xhci->cap_regs->hcs_params3);
+	xhci->hcc_params = xhci_readl(&xhci->cap_regs->hc_capbase);
 	xhci->hci_version = HC_VERSION(xhci->hcc_params);
-	xhci->hcc_params = xhci_readl(xhci, &xhci->cap_regs->hcc_params);
+	xhci->hcc_params = xhci_readl(&xhci->cap_regs->hcc_params);
 	xhci_print_registers(xhci);
 
 	get_quirks(dev, xhci);
@@ -4904,7 +4904,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 		goto error;
 	xhci_dbg(xhci, "Reset complete\n");
 
-	temp = xhci_readl(xhci, &xhci->cap_regs->hcc_params);
+	temp = xhci_readl(&xhci->cap_regs->hcc_params);
 	if (HCC_64BIT_ADDR(temp)) {
 		xhci_dbg(xhci, "Enabling 64-bit DMA addresses.\n");
 		dma_set_mask(hcd->self.controller, DMA_BIT_MASK(64));
-- 
1.7.9.5

