From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 10 Oct 2010 17:28:35 +0000
Subject: [PATCH] serial: omap-serial: fix signess error
Message-Id: <1286731715-17908-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: "Govindraj.R" <govindraj.raja@ti.com>, Greg Kroah-Hartman <gregkh@suse.de>, Kevin Hilman <khilman@deeprootsystems.com>, Alan Cox <alan@linux.intel.com>, linux-kernel@vger.kernel.org

"ret" is unsigned, so check for (ret < 0) made no sense.
Made it signed.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 I cannot compile this driver, so it is not tested.

 drivers/serial/omap-serial.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/serial/omap-serial.c b/drivers/serial/omap-serial.c
index 2ee1d32..14365f7 100644
--- a/drivers/serial/omap-serial.c
+++ b/drivers/serial/omap-serial.c
@@ -1055,7 +1055,7 @@ static void serial_omap_rx_timeout(unsigned long uart_no)
 {
 	struct uart_omap_port *up = ui[uart_no];
 	unsigned int curr_dma_pos, curr_transmitted_size;
-	unsigned int ret = 0;
+	int ret = 0;
 
 	curr_dma_pos = omap_get_dma_dst_pos(up->uart_dma.rx_dma_channel);
 	if ((curr_dma_pos = up->uart_dma.prev_rx_dma_pos) ||
-- 
1.7.0.4

