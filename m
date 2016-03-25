From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Fri, 25 Mar 2016 11:33:47 +0000
Subject: [PATCH] staging: dgnc: replace dgnc_offset_table with bit shift.
Message-Id: <20160325113347.GA21951@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

the dgnc_offset_table has a same value with (1 << port).
So I tried to replace dgnc_offset_table array with 1 << port.
And also there are redundant assignments(tmp and current_port)
inside while loop for checking uart port, and remove them.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
Greg, This patch depends on previous patches.
here are links(previous):
1. https://lkml.org/lkml/2016/3/24/661
2. https://lkml.org/lkml/2016/3/24/663

if those patches are failed to merge, I will send them again after
fixing them.

thanks.

 drivers/staging/dgnc/dgnc_neo.c | 44 +++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
index d732e6e..8b6bc73 100644
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
@@ -960,28 +955,29 @@ static irqreturn_t neo_intr(int irq, void *voidbrd)
 
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
+		int i;
 
-		/* Remove this port + type from uart_poll */
-		uart_poll &= ~(dgnc_offset_table[port]);
+		type = 0;
 
-		if (!type) {
-			/* If no type, just ignore it, and move onto next port */
-			continue;
+		for (i = port; i < MAXPORTS; i++) {
+			unsigned int offset_table = 0x1 << i;
+
+			/* Check current port to see
+			 * if it has interrupt pending
+			 */
+			if ((uart_poll & offset_table) != 0) {
+				port = i;
+				type = uart_poll >> (8 + (port * 3));
+				type &= 0x7;
+
+				/* Remove this port + type from uart_poll */
+				uart_poll &= ~(offset_table);
+			}
+
+			if (type)
+				break;
 		}
 
 		/* Switch on type of interrupt we have */
-- 
1.9.1

