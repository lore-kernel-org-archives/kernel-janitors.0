From: Florian Westphal <fw-kernel@strlen.de>
Date: Fri, 21 Jul 2006 15:53:00 +0000
Subject: [KJ] [PATCH] drivers/ieee1394/ohci1394.c fix kzalloc error handling
Message-Id: <20060721155300.GA14244@Chamillionaire.breakpoint.cc>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Florian Westphal <florian.westphal@strlen.de>

Always kfree() d->prg_bus and d->buf_bus.
Make sure buf_bus/prg_bus are not NULL before using them.

Signed-off-by: Florian Westphal <florian.westphal@strlen.de>                                                   

---

alloc_dma_rcv_ctx() kzallocs a few bufs and calls
free_dma_rcv_ctx() for cleanup in case an error occurs.
free_dma_rcv_ctx() may handle such error conditions incorrect, e.g.
if d->buf_bus is NULL.
Also, if the kzalloc for buf_cpu failed (but not buf_bus)
buf_bus is not freed (same goes for prg_bus).

diff --git a/drivers/ieee1394/ohci1394.c b/drivers/ieee1394/ohci1394.c
index d4bad67..5138032 100644
--- a/drivers/ieee1394/ohci1394.c
+++ b/drivers/ieee1394/ohci1394.c
@@ -2918,7 +2918,7 @@ static void free_dma_rcv_ctx(struct dma_
 
 	DBGMSG("Freeing dma_rcv_ctx %d", d->ctx);
 
-	if (d->buf_cpu) {
+	if (d->buf_cpu && d->buf_bus) {
 		for (i=0; i<d->num_desc; i++)
 			if (d->buf_cpu[i] && d->buf_bus[i]) {
 				pci_free_consistent(
@@ -2926,10 +2926,12 @@ static void free_dma_rcv_ctx(struct dma_
 					d->buf_cpu[i], d->buf_bus[i]);
 				OHCI_DMA_FREE("consistent dma_rcv buf[%d]", i);
 			}
-		kfree(d->buf_cpu);
-		kfree(d->buf_bus);
 	}
-	if (d->prg_cpu) {
+
+	kfree(d->buf_cpu);
+	kfree(d->buf_bus);
+
+	if (d->prg_cpu && d->prg_bus) {
 		for (i=0; i<d->num_desc; i++)
 			if (d->prg_cpu[i] && d->prg_bus[i]) {
 				pci_pool_free(d->prg_pool, d->prg_cpu[i], d->prg_bus[i]);
@@ -2937,9 +2939,11 @@ static void free_dma_rcv_ctx(struct dma_
 			}
 		pci_pool_destroy(d->prg_pool);
 		OHCI_DMA_FREE("dma_rcv prg pool");
-		kfree(d->prg_cpu);
-		kfree(d->prg_bus);
 	}
+
+	kfree(d->prg_cpu);
+	kfree(d->prg_bus);
+
 	kfree(d->spb);
 
 	/* Mark this context as freed. */

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
