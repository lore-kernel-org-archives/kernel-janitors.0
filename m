From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Fri, 16 Aug 2013 18:50:48 +0000
Subject: [PATCH 3/6] for fixing xhci_readl call in xhci_mem.c after removing xhci_hcd from function definitio
Message-Id: <1376679005-15368-1-git-send-email-kumargauravgupta3@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

---
 drivers/usb/host/xhci-mem.c |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index df6978a..0a8aa3e 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2057,7 +2057,7 @@ static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
 	}
 
 	/* Port offset and count in the third dword, see section 7.2 */
-	temp = xhci_readl(xhci, addr + 2);
+	temp = xhci_readl(addr + 2);
 	port_offset = XHCI_EXT_PORT_OFF(temp);
 	port_count = XHCI_EXT_PORT_COUNT(temp);
 	xhci_dbg(xhci, "Ext Cap %p, port offset = %u, "
@@ -2136,7 +2136,7 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 	int cap_count = 0;
 
 	addr = &xhci->cap_regs->hcc_params;
-	offset = XHCI_HCC_EXT_CAPS(xhci_readl(xhci, addr));
+	offset = XHCI_HCC_EXT_CAPS(xhci_readl(addr));
 	if (offset = 0) {
 		xhci_err(xhci, "No Extended Capability registers, "
 				"unable to set up roothub.\n");
@@ -2173,7 +2173,7 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 	/* count extended protocol capability entries for later caching */
 	do {
 		u32 cap_id;
-		cap_id = xhci_readl(xhci, tmp_addr);
+		cap_id = xhci_readl(tmp_addr);
 		if (XHCI_EXT_CAPS_ID(cap_id) = XHCI_EXT_CAPS_PROTOCOL)
 			cap_count++;
 		tmp_offset = XHCI_EXT_CAPS_NEXT(cap_id);
@@ -2187,7 +2187,7 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 	while (1) {
 		u32 cap_id;
 
-		cap_id = xhci_readl(xhci, addr);
+		cap_id = xhci_readl(addr);
 		if (XHCI_EXT_CAPS_ID(cap_id) = XHCI_EXT_CAPS_PROTOCOL)
 			xhci_add_in_port(xhci, num_ports, addr,
 					(u8) XHCI_EXT_PORT_MAJOR(cap_id),
@@ -2287,7 +2287,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	INIT_LIST_HEAD(&xhci->lpm_failed_devs);
 	INIT_LIST_HEAD(&xhci->cancel_cmd_list);
 
-	page_size = xhci_readl(xhci, &xhci->op_regs->page_size);
+	page_size = xhci_readl(&xhci->op_regs->page_size);
 	xhci_dbg(xhci, "Supported page size register = 0x%x\n", page_size);
 	for (i = 0; i < 16; i++) {
 		if ((0x1 & page_size) != 0)
@@ -2307,10 +2307,10 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	 * Program the Number of Device Slots Enabled field in the CONFIG
 	 * register with the max value of slots the HC can handle.
 	 */
-	val = HCS_MAX_SLOTS(xhci_readl(xhci, &xhci->cap_regs->hcs_params1));
+	val = HCS_MAX_SLOTS(xhci_readl(&xhci->cap_regs->hcs_params1));
 	xhci_dbg(xhci, "// xHC can handle at most %d device slots.\n",
 			(unsigned int) val);
-	val2 = xhci_readl(xhci, &xhci->op_regs->config_reg);
+	val2 = xhci_readl(&xhci->op_regs->config_reg);
 	val |= (val2 & ~HCS_SLOTS_MASK);
 	xhci_dbg(xhci, "// Setting Max device slots reg = 0x%x.\n",
 			(unsigned int) val);
@@ -2388,7 +2388,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	 */
 	xhci->cmd_ring_reserved_trbs++;
 
-	val = xhci_readl(xhci, &xhci->cap_regs->db_off);
+	val = xhci_readl(&xhci->cap_regs->db_off);
 	val &= DBOFF_MASK;
 	xhci_dbg(xhci, "// Doorbell array is located at offset 0x%x"
 			" from cap regs base addr\n", val);
@@ -2436,7 +2436,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	}
 
 	/* set ERST count with the number of entries in the segment table */
-	val = xhci_readl(xhci, &xhci->ir_set->erst_size);
+	val = xhci_readl(&xhci->ir_set->erst_size);
 	val &= ERST_SIZE_MASK;
 	val |= ERST_NUM_SEGS;
 	xhci_dbg(xhci, "// Write ERST size = %i to ir_set 0 (some bits preserved)\n",
@@ -2479,7 +2479,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	 * is necessary for allowing USB 3.0 devices to do remote wakeup from
 	 * U3 (device suspend).
 	 */
-	temp = xhci_readl(xhci, &xhci->op_regs->dev_notification);
+	temp = xhci_readl(&xhci->op_regs->dev_notification);
 	temp &= ~DEV_NOTE_MASK;
 	temp |= DEV_NOTE_FWAKE;
 	xhci_writel(xhci, temp, &xhci->op_regs->dev_notification);
-- 
1.7.9.5

