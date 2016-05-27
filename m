From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Fri, 27 May 2016 06:54:01 +0000
Subject: [PATCH 4/7] staging: dgnc: remove useless variable 'intr_rx'
Message-Id: <20160527065401.GA3009@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The 'intr_rx' variable was used only for increasing.
So the 'intr_rx' variable is not useful for this driver.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_cls.c    | 1 -
 drivers/staging/dgnc/dgnc_driver.h | 1 -
 drivers/staging/dgnc/dgnc_neo.c    | 2 --
 3 files changed, 4 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_cls.c b/drivers/staging/dgnc/dgnc_cls.c
index 415a739..35526f8 100644
--- a/drivers/staging/dgnc/dgnc_cls.c
+++ b/drivers/staging/dgnc/dgnc_cls.c
@@ -387,7 +387,6 @@ static inline void cls_parse_isr(struct dgnc_board *brd, uint port)
 		/* Receive Interrupt pending */
 		if (isr & (UART_IIR_RDI | UART_IIR_RDI_TIMEOUT)) {
 			/* Read data from uart -> queue */
-			brd->intr_rx++;
 			ch->ch_intr_rx++;
 			cls_copy_data_from_uart_to_queue(ch);
 			dgnc_check_queue_flow_control(ch);
diff --git a/drivers/staging/dgnc/dgnc_driver.h b/drivers/staging/dgnc/dgnc_driver.h
index a8d823b..914130d 100644
--- a/drivers/staging/dgnc/dgnc_driver.h
+++ b/drivers/staging/dgnc/dgnc_driver.h
@@ -183,7 +183,6 @@ struct dgnc_board {
 	uint		nasync;		/* Number of ports on card */
 
 	uint		irq;		/* Interrupt request number */
-	ulong		intr_rx;	/* Count of interrupts */
 
 	ulong		membase;	/* Start of base memory of the card */
 	ulong		membase_end;	/* End of base memory of the card */
diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
index 5f3eacdf..f99c0db 100644
--- a/drivers/staging/dgnc/dgnc_neo.c
+++ b/drivers/staging/dgnc/dgnc_neo.c
@@ -399,7 +399,6 @@ static inline void neo_parse_isr(struct dgnc_board *brd, uint port)
 
 		if (isr & (UART_17158_IIR_RDI_TIMEOUT | UART_IIR_RDI)) {
 			/* Read data from uart -> queue */
-			brd->intr_rx++;
 			ch->ch_intr_rx++;
 			neo_copy_data_from_uart_to_queue(ch);
 
@@ -515,7 +514,6 @@ static inline void neo_parse_lsr(struct dgnc_board *brd, uint port)
 	ch->ch_cached_lsr |= linestatus;
 
 	if (ch->ch_cached_lsr & UART_LSR_DR) {
-		brd->intr_rx++;
 		ch->ch_intr_rx++;
 		/* Read data from uart -> queue */
 		neo_copy_data_from_uart_to_queue(ch);
-- 
1.9.1

