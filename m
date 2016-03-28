From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Mon, 28 Mar 2016 04:54:15 +0000
Subject: [PATCH V2] staging: dgnc: replace dgnc_offset_table with bit shift.
Message-Id: <20160328045415.GA586@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, wharms@bfs.de

the dgnc_offset_table has a same value with (1 << port).
So I tried to replace dgnc_offset_table array with 1 << port.
And also there are redundant assignments(tmp and current_port)
inside while loop for checking uart port, and remove them.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
V2: clean up useless variables and increasing port value is just
for traversing all port with uart_poll. So It need to replace
'continue' with 'break' in switch statement and last of this function,
move onto next port.

 drivers/staging/dgnc/dgnc_neo.c | 44 +++++++++++------------------------------
 1 file changed, 12 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
index d732e6e..6b57c44 100644
--- a/drivers/staging/dgnc/dgnc_neo.c
+++ b/drivers/staging/dgnc/dgnc_neo.c
@@ -77,9 +77,6 @@ struct board_ops dgnc_neo_ops = {
 	.send_immediate_char =		neo_send_immediate_char
 };
 
-static uint dgnc_offset_table[8] = { 0x01, 0x02, 0x04, 0x08,
-				     0x10, 0x20, 0x40, 0x80 };
-
 /*
  * This function allows calls to ensure that all outstanding
  * PCI writes have been completed, by doing a PCI read against
@@ -923,9 +920,7 @@ static irqreturn_t neo_intr(int irq, void *voidbrd)
 	struct dgnc_board *brd = voidbrd;
 	struct channel_t *ch;
 	int port = 0;
-	int type = 0;
-	int current_port;
-	u32 tmp;
+	int type;
 	u32 uart_poll;
 	unsigned long flags;
 	unsigned long flags2;
@@ -960,29 +955,12 @@ static irqreturn_t neo_intr(int irq, void *voidbrd)
 
 	/* At this point, we have at least SOMETHING to service, dig further... */
 
-	current_port = 0;
-
 	/* Loop on each port */
 	while ((uart_poll & 0xff) != 0) {
-		tmp = uart_poll;
-
-		/* Check current port to see if it has interrupt pending */
-		if ((tmp & dgnc_offset_table[current_port]) != 0) {
-			port = current_port;
-			type = tmp >> (8 + (port * 3));
-			type &= 0x7;
-		} else {
-			current_port++;
-			continue;
-		}
-
-		/* Remove this port + type from uart_poll */
-		uart_poll &= ~(dgnc_offset_table[port]);
+		type = uart_poll >> (8 + (port * 3));
+		type &= 0x7;
 
-		if (!type) {
-			/* If no type, just ignore it, and move onto next port */
-			continue;
-		}
+		uart_poll &= ~(0x01 << port);
 
 		/* Switch on type of interrupt we have */
 		switch (type) {
@@ -994,7 +972,7 @@ static irqreturn_t neo_intr(int irq, void *voidbrd)
 
 			/* Verify the port is in range. */
 			if (port >= brd->nasync)
-				continue;
+				break;
 
 			ch = brd->channels[port];
 			neo_copy_data_from_uart_to_queue(ch);
@@ -1004,14 +982,14 @@ static irqreturn_t neo_intr(int irq, void *voidbrd)
 			dgnc_check_queue_flow_control(ch);
 			spin_unlock_irqrestore(&ch->ch_lock, flags2);
 
-			continue;
+			break;
 
 		case UART_17158_RX_LINE_STATUS:
 			/*
 			 * RXRDY and RX LINE Status (logic OR of LSR[4:1])
 			 */
 			neo_parse_lsr(brd, port);
-			continue;
+			break;
 
 		case UART_17158_TXRDY:
 			/*
@@ -1027,14 +1005,14 @@ static irqreturn_t neo_intr(int irq, void *voidbrd)
 			 * it should be, I was getting things like RXDY too. Weird.
 			 */
 			neo_parse_isr(brd, port);
-			continue;
+			break;
 
 		case UART_17158_MSR:
 			/*
 			 * MSR or flow control was seen.
 			 */
 			neo_parse_isr(brd, port);
-			continue;
+			break;
 
 		default:
 			/*
@@ -1043,8 +1021,10 @@ static irqreturn_t neo_intr(int irq, void *voidbrd)
 			 * these once and awhile.
 			 * Its harmless, just ignore it and move on.
 			 */
-			continue;
+			break;
 		}
+
+		port++;
 	}
 
 	/*
-- 
1.9.1

