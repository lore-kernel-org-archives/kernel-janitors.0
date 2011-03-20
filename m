From: Dan Carpenter <error27@gmail.com>
Date: Sun, 20 Mar 2011 11:16:17 +0000
Subject: [patch 3/4] USB: musb: silence printk format warning
Message-Id: <20110320111617.GK2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Gcc gives the following warnings:

drivers/usb/musb/cppi_dma.c: In function ‘cppi_next_tx_segment’:
drivers/usb/musb/cppi_dma.c:600: warning: format ‘%x’ expects type ‘unsigned int’, but argument 8 has type ‘dma_addr_t’
drivers/usb/musb/cppi_dma.c: In function ‘cppi_next_rx_segment’:
drivers/usb/musb/cppi_dma.c:822: warning: format ‘%x’ expects type ‘unsigned int’, but argument 9 has type ‘dma_addr_t’
drivers/usb/musb/cppi_dma.c: In function ‘cppi_rx_scan’:
drivers/usb/musb/cppi_dma.c:1042: warning: format ‘%08x’ expects type ‘unsigned int’, but argument 4 has type ‘dma_addr_t’
drivers/usb/musb/cppi_dma.c:1114: warning: format ‘%08x’ expects type ‘unsigned int’, but argument 7 has type ‘dma_addr_t’

dma_addr_t is sometimes 32 bit and sometimes 64.  We normally cast them
to unsigned long long for printk().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/usb/musb/cppi_dma.c b/drivers/usb/musb/cppi_dma.c
index 0db0f5e..eb9161a 100644
--- a/drivers/usb/musb/cppi_dma.c
+++ b/drivers/usb/musb/cppi_dma.c
@@ -597,12 +597,12 @@ cppi_next_tx_segment(struct musb *musb, struct cppi_channel *tx)
 		length = min(n_bds * maxpacket, length);
 	}
 
-	DBG(4, "TX DMA%d, pktSz %d %s bds %d dma 0x%x len %u\n",
+	DBG(4, "TX DMA%d, pktSz %d %s bds %d dma 0x%llx len %u\n",
 			tx->index,
 			maxpacket,
 			rndis ? "rndis" : "transparent",
 			n_bds,
-			addr, length);
+			(unsigned long long)addr, length);
 
 	cppi_rndis_update(tx, 0, musb->ctrl_base, rndis);
 
@@ -820,7 +820,7 @@ cppi_next_rx_segment(struct musb *musb, struct cppi_channel *rx, int onepacket)
 	length = min(n_bds * maxpacket, length);
 
 	DBG(4, "RX DMA%d seg, maxp %d %s bds %d (cnt %d) "
-			"dma 0x%x len %u %u/%u\n",
+			"dma 0x%llx len %u %u/%u\n",
 			rx->index, maxpacket,
 			onepacket
 				? (is_rndis ? "rndis" : "onepacket")
@@ -829,7 +829,8 @@ cppi_next_rx_segment(struct musb *musb, struct cppi_channel *rx, int onepacket)
 			musb_readl(tibase,
 				DAVINCI_RXCPPI_BUFCNT0_REG + (rx->index * 4))
 					& 0xffff,
-			addr, length, rx->channel.actual_len, rx->buf_len);
+			(unsigned long long)addr, length,
+			rx->channel.actual_len, rx->buf_len);
 
 	/* only queue one segment at a time, since the hardware prevents
 	 * correct queue shutdown after unexpected short packets
@@ -1039,9 +1040,9 @@ static bool cppi_rx_scan(struct cppi *cppi, unsigned ch)
 		if (!completed && (bd->hw_options & CPPI_OWN_SET))
 			break;
 
-		DBG(5, "C/RXBD %08x: nxt %08x buf %08x "
+		DBG(5, "C/RXBD %llx: nxt %08x buf %08x "
 			"off.len %08x opt.len %08x (%d)\n",
-			bd->dma, bd->hw_next, bd->hw_bufp,
+			(unsigned long long)bd->dma, bd->hw_next, bd->hw_bufp,
 			bd->hw_off_len, bd->hw_options,
 			rx->channel.actual_len);
 
@@ -1111,11 +1112,12 @@ static bool cppi_rx_scan(struct cppi *cppi, unsigned ch)
 		musb_ep_select(cppi->mregs, rx->index + 1);
 		csr = musb_readw(regs, MUSB_RXCSR);
 		if (csr & MUSB_RXCSR_DMAENAB) {
-			DBG(4, "list%d %p/%p, last %08x%s, csr %04x\n",
+			DBG(4, "list%d %p/%p, last %llx%s, csr %04x\n",
 				rx->index,
 				rx->head, rx->tail,
 				rx->last_processed
-					? rx->last_processed->dma
+					? (unsigned long long)
+						rx->last_processed->dma
 					: 0,
 				completed ? ", completed" : "",
 				csr);
