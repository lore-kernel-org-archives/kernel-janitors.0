From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Mar 2012 07:30:26 +0000
Subject: [patch v2] xHCI: use gfp flags from caller instead of GFP_ATOMIC
Message-Id: <20120328073026.GD3200@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The caller is allowed to specify the GFP flags for these functions.
We should prefer their flags unless we have good reason.  For
example, if we take a spin_lock ourselves we'd need to use
GFP_ATOMIC.  But in this case it's safe to use the callers GFP
flags.

The callers all pass GFP_ATOMIC here, so this change doesn't affect
how the kernel behaves but we may add other callers later and this
is a cleanup.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Rewrote the changelog message.

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 6bd9d53..8715cc6 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2734,7 +2734,7 @@ int xhci_queue_intr_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 				urb->dev->speed = USB_SPEED_FULL)
 			urb->interval /= 8;
 	}
-	return xhci_queue_bulk_tx(xhci, GFP_ATOMIC, urb, slot_id, ep_index);
+	return xhci_queue_bulk_tx(xhci, mem_flags, urb, slot_id, ep_index);
 }
 
 /*
@@ -3514,7 +3514,7 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 	}
 	ep_ring->num_trbs_free_temp = ep_ring->num_trbs_free;
 
-	return xhci_queue_isoc_tx(xhci, GFP_ATOMIC, urb, slot_id, ep_index);
+	return xhci_queue_isoc_tx(xhci, mem_flags, urb, slot_id, ep_index);
 }
 
 /****		Command Ring Operations		****/
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

