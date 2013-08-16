From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Fri, 16 Aug 2013 18:52:10 +0000
Subject: [PATCH 4/6] for fixing xhci_readl call in xhci_ring.c after removing xhci_hcd from function definiti
Message-Id: <1376679068-15404-1-git-send-email-kumargauravgupta3@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

---
 drivers/usb/host/xhci-ring.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 1e57eaf..9d4128c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -286,7 +286,7 @@ void xhci_ring_cmd_db(struct xhci_hcd *xhci)
 	xhci_dbg(xhci, "// Ding dong!\n");
 	xhci_writel(xhci, DB_VALUE_HOST, &xhci->dba->doorbell[0]);
 	/* Flush PCI posted writes */
-	xhci_readl(xhci, &xhci->dba->doorbell[0]);
+	xhci_readl(&xhci->dba->doorbell[0]);
 }
 
 static int xhci_abort_cmd_ring(struct xhci_hcd *xhci)
@@ -1648,7 +1648,7 @@ static void handle_port_status(struct xhci_hcd *xhci,
 	faked_port_index = find_faked_portnum_from_hw_portnum(hcd, xhci,
 			port_id);
 
-	temp = xhci_readl(xhci, port_array[faked_port_index]);
+	temp = xhci_readl(port_array[faked_port_index]);
 	if (hcd->state = HC_STATE_SUSPENDED) {
 		xhci_dbg(xhci, "resume root hub\n");
 		usb_hcd_resume_root_hub(hcd);
@@ -1657,7 +1657,7 @@ static void handle_port_status(struct xhci_hcd *xhci,
 	if ((temp & PORT_PLC) && (temp & PORT_PLS_MASK) = XDEV_RESUME) {
 		xhci_dbg(xhci, "port resume event for port %d\n", port_id);
 
-		temp1 = xhci_readl(xhci, &xhci->op_regs->command);
+		temp1 = xhci_readl(&xhci->op_regs->command);
 		if (!(temp1 & CMD_RUN)) {
 			xhci_warn(xhci, "xHC is not running.\n");
 			goto cleanup;
@@ -2727,7 +2727,7 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 
 	spin_lock(&xhci->lock);
 	/* Check if the xHC generated the interrupt, or the irq is shared */
-	status = xhci_readl(xhci, &xhci->op_regs->status);
+	status = xhci_readl(&xhci->op_regs->status);
 	if (status = 0xffffffff)
 		goto hw_died;
 
@@ -2756,7 +2756,7 @@ hw_died:
 	if (hcd->irq) {
 		u32 irq_pending;
 		/* Acknowledge the PCI interrupt */
-		irq_pending = xhci_readl(xhci, &xhci->ir_set->irq_pending);
+		irq_pending = xhci_readl(&xhci->ir_set->irq_pending);
 		irq_pending |= IMAN_IP;
 		xhci_writel(xhci, irq_pending, &xhci->ir_set->irq_pending);
 	}
@@ -3831,7 +3831,7 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 	if (ret)
 		return ret;
 
-	start_frame = xhci_readl(xhci, &xhci->run_regs->microframe_index);
+	start_frame = xhci_readl(&xhci->run_regs->microframe_index);
 	start_frame &= 0x3fff;
 
 	urb->start_frame = start_frame;
-- 
1.7.9.5

