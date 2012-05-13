From: Girish Verma <girish@circuitsutra.com>
Date: Sun, 13 May 2012 15:41:02 +0000
Subject: [PATCH] USB: XHCI: xhci-ring: Remove unused dma address calculation in inc_enq and inc_deq function
Message-Id: <1336922942.3945.12.camel@cst-girish-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAOf1Mzv=+zSVCDgPcHhVvN6YCbhM8R2w6DDL80EbYTuA0EGpCw@mail.gmail.com>
In-Reply-To: <CAOf1Mzv=+zSVCDgPcHhVvN6YCbhM8R2w6DDL80EbYTuA0EGpCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, sarah.a.sharp@linux.intel.com, gregkh@linuxfoundation.org

In xhci-ring.c, function inc_enq and inc_deq calculate the dma address
of trb but never used. 

Signed-off-by: Girish Verma <girish@circuitsutra.com>
---
 drivers/usb/host/xhci-ring.c |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 3d9422f..dcd67c1 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -146,7 +146,6 @@ static void next_trb(struct xhci_hcd *xhci,
 static void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring)
 {
 	union xhci_trb *next;
-	unsigned long long addr;
 
 	ring->deq_updates++;
 
@@ -168,7 +167,6 @@ static void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring)
 		ring->dequeue = ring->deq_seg->trbs;
 		next = ring->dequeue;
 	}
-	addr = (unsigned long long) xhci_trb_virt_to_dma(ring->deq_seg, ring->dequeue);
 }
 
 /*
@@ -193,7 +191,6 @@ static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
 {
 	u32 chain;
 	union xhci_trb *next;
-	unsigned long long addr;
 
 	chain = le32_to_cpu(ring->enqueue->generic.field[3]) & TRB_CHAIN;
 	/* If this is not event ring, there is one less usable TRB */
@@ -245,7 +242,6 @@ static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
 		ring->enqueue = ring->enq_seg->trbs;
 		next = ring->enqueue;
 	}
-	addr = (unsigned long long) xhci_trb_virt_to_dma(ring->enq_seg, ring->enqueue);
 }
 
 /*
-- 


