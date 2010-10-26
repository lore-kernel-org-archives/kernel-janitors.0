From: Julia Lawall <julia@diku.dk>
Date: Tue, 26 Oct 2010 10:25:40 +0000
Subject: [PATCH 11/14] drivers/serial/vr41xx_siu.c: delete double assignment
Message-Id: <1288088743-3725-12-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk>
In-Reply-To: <1288088743-3725-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Delete successive assignments to the same location.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression i;
@@

*i = ...;
 i = ...;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/serial/vr41xx_siu.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/serial/vr41xx_siu.c b/drivers/serial/vr41xx_siu.c
index 3beb6ab..121a33e 100644
--- a/drivers/serial/vr41xx_siu.c
+++ b/drivers/serial/vr41xx_siu.c
@@ -849,7 +849,6 @@ void __init vr41xx_siu_early_setup(struct uart_port *port)
 	siu_uart_ports[port->line].type = port->type;
 	siu_uart_ports[port->line].uartclk = SIU_BAUD_BASE * 16;
 	siu_uart_ports[port->line].mapbase = port->mapbase;
-	siu_uart_ports[port->line].mapbase = port->mapbase;
 	siu_uart_ports[port->line].ops = &siu_uart_ops;
 }
 

