From: Colin King <colin.king@canonical.com>
Date: Fri, 20 Dec 2019 00:10:00 +0000
Subject: [PATCH] serial: ucc_uart: remove redundant assignment to pointer bdp
Message-Id: <20191220001000.39859-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable bdp is being initialized with a value that is never
read and it is being updated later with a new value. The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/tty/serial/ucc_uart.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index afc2a5d69202..99a069ed3636 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -336,8 +336,6 @@ static int qe_uart_tx_pump(struct uart_qe_port *qe_port)
 	struct uart_port *port = &qe_port->port;
 	struct circ_buf *xmit = &port->state->xmit;
 
-	bdp = qe_port->rx_cur;
-
 	/* Handle xon/xoff */
 	if (port->x_char) {
 		/* Pick next descriptor and fill from buffer */
-- 
2.24.0
