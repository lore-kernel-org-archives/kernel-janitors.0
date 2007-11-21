From: Andre Haupt <andre@bitwigglers.org>
Date: Wed, 21 Nov 2007 11:33:45 +0000
Subject: [PATCH] sdio_uart: fix sign of paramter status in sdio_uart_receive_chars()
Message-Id: <11956448251191-git-send-email-andre@bitwigglers.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: n
In-Reply-To: n
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, drzeus-mmc@drzeus.cx, nico@cam.org, Andre Haupt <andre@bitwigglers.org>

I think, the status paramter should be unsigned. Is this correct?
This also fixes a sparse warning about different signedness.
Only compile tested, because i do not have the hardware.

From: Andre Haupt <andre@bitwigglers.org>
Signed-off-by: Andre Haupt <andre@bitwigglers.org>
---
 drivers/mmc/card/sdio_uart.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mmc/card/sdio_uart.c b/drivers/mmc/card/sdio_uart.c
index d552de6..eeea84c 100644
--- a/drivers/mmc/card/sdio_uart.c
+++ b/drivers/mmc/card/sdio_uart.c
@@ -386,7 +386,7 @@ static void sdio_uart_stop_rx(struct sdio_uart_port *port)
 	sdio_out(port, UART_IER, port->ier);
 }
 
-static void sdio_uart_receive_chars(struct sdio_uart_port *port, int *status)
+static void sdio_uart_receive_chars(struct sdio_uart_port *port, unsigned int *status)
 {
 	struct tty_struct *tty = port->tty;
 	unsigned int ch, flag;
-- 
1.4.4.4

