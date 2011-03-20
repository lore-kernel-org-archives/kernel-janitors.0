From: Dan Carpenter <error27@gmail.com>
Date: Sun, 20 Mar 2011 11:15:24 +0000
Subject: [patch 2/4] USB: musb: using 0 instead of NULL
Message-Id: <20110320111524.GJ2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Sparse complains (and rightly so):
drivers/usb/musb/cppi_dma.c:1458:33:
	warning: Using plain integer as NULL pointer

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/usb/musb/cppi_dma.c b/drivers/usb/musb/cppi_dma.c
index 6385eeb..0db0f5e 100644
--- a/drivers/usb/musb/cppi_dma.c
+++ b/drivers/usb/musb/cppi_dma.c
@@ -1455,7 +1455,7 @@ static int cppi_channel_abort(struct dma_channel *channel)
 		 *    compare mode by writing 1 to the tx_complete register.
 		 */
 		cppi_reset_tx(tx_ram, 1);
-		cppi_ch->head = 0;
+		cppi_ch->head = NULL;
 		musb_writel(&tx_ram->tx_complete, 0, 1);
 		cppi_dump_tx(5, cppi_ch, " (done teardown)");
 
