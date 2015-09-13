From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 12:14:58 +0000
Subject: [PATCH 05/39] xhci: drop null test before destroy functions
Message-Id: <1442146532-9100-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Remove unneeded NULL test.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression x; @@
-if (x != NULL)
  \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/host/xhci-mem.c |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 9a8c936..40618d1 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1829,24 +1829,20 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	for (i = 1; i < MAX_HC_SLOTS; ++i)
 		xhci_free_virt_device(xhci, i);
 
-	if (xhci->segment_pool)
-		dma_pool_destroy(xhci->segment_pool);
+	dma_pool_destroy(xhci->segment_pool);
 	xhci->segment_pool = NULL;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed segment pool");
 
-	if (xhci->device_pool)
-		dma_pool_destroy(xhci->device_pool);
+	dma_pool_destroy(xhci->device_pool);
 	xhci->device_pool = NULL;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed device context pool");
 
-	if (xhci->small_streams_pool)
-		dma_pool_destroy(xhci->small_streams_pool);
+	dma_pool_destroy(xhci->small_streams_pool);
 	xhci->small_streams_pool = NULL;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Freed small stream array pool");
 
-	if (xhci->medium_streams_pool)
-		dma_pool_destroy(xhci->medium_streams_pool);
+	dma_pool_destroy(xhci->medium_streams_pool);
 	xhci->medium_streams_pool = NULL;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Freed medium stream array pool");

