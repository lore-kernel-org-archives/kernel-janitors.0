From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Nov 2016 19:33:17 +0000
Subject: [patch] usb: xhci-mem: use passed in GFP flags instead of GFP_KERNEL
Message-Id: <20161110193317.GC32533@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathias Nyman <mathias.nyman@intel.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We normally use the passed in gfp flags for allocations, it's just these
two which were missed.

Fixes: 22d45f01a836 ("usb/xhci: replace pci_*_consistent() with dma_*_coherent()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Not tested.

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 6afe323..3c4cc29 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2384,7 +2384,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	 * "physically contiguous and 64-byte (cache line) aligned".
 	 */
 	xhci->dcbaa = dma_alloc_coherent(dev, sizeof(*xhci->dcbaa), &dma,
-			GFP_KERNEL);
+			flags);
 	if (!xhci->dcbaa)
 		goto fail;
 	memset(xhci->dcbaa, 0, sizeof *(xhci->dcbaa));
@@ -2480,7 +2480,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	xhci->erst.entries = dma_alloc_coherent(dev,
 			sizeof(struct xhci_erst_entry) * ERST_NUM_SEGS, &dma,
-			GFP_KERNEL);
+			flags);
 	if (!xhci->erst.entries)
 		goto fail;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
