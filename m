From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Wed, 06 Jul 2016 06:19:58 +0000
Subject: [PATCH 15/15 RESEND] staging: dgnc: remove useless variable 'ch_intr_rx'
Message-Id: <20160706061958.GA18765@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The 'ch_intr_rx' variable was used only for increasing.
So the 'ch_intr_rx' variable is not useful for this driver.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
RESEND: This patch was not merged for a long time, if there is any reason
why this patch could NOT be merged into staging tree, let me know.
There were no comment for this patch.
I cannot understand why this patch have to wait long time to merge.
And I also sent emails to mailing-lists for reminding this patch...
please let me know, what is the problem to merge this patch into staging tree.

 drivers/staging/dgnc/dgnc_cls.c    | 1 -
 drivers/staging/dgnc/dgnc_driver.h | 2 --
 drivers/staging/dgnc/dgnc_neo.c    | 2 --
 3 files changed, 5 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_cls.c b/drivers/staging/dgnc/dgnc_cls.c
index 35b59ca..4e1e0dc6 100644
--- a/drivers/staging/dgnc/dgnc_cls.c
+++ b/drivers/staging/dgnc/dgnc_cls.c
@@ -584,7 +584,6 @@ static inline void cls_parse_isr(struct dgnc_board *brd, uint port)
 		/* Receive Interrupt pending */
 		if (isr & (UART_IIR_RDI | UART_IIR_RDI_TIMEOUT)) {
 			/* Read data from uart -> queue */
-			ch->ch_intr_rx++;
 			cls_copy_data_from_uart_to_queue(ch);
 			dgnc_check_queue_flow_control(ch);
 		}
diff --git a/drivers/staging/dgnc/dgnc_driver.h b/drivers/staging/dgnc/dgnc_driver.h
index 8bdf556..3092abe 100644
--- a/drivers/staging/dgnc/dgnc_driver.h
+++ b/drivers/staging/dgnc/dgnc_driver.h
@@ -377,8 +377,6 @@ struct channel_t {
 	ulong		ch_xon_sends;	/* Count of xons transmitted */
 	ulong		ch_xoff_sends;	/* Count of xoffs transmitted */
 
-	ulong		ch_intr_rx;	/* Count of interrupts */
-
 	/* /proc/<board>/<channel> entries */
 	struct proc_dir_entry *proc_entry_pointer;
 	struct dgnc_proc_entry *dgnc_channel_table;
diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
index 574a227..5ef5b3e 100644
--- a/drivers/staging/dgnc/dgnc_neo.c
+++ b/drivers/staging/dgnc/dgnc_neo.c
@@ -399,7 +399,6 @@ static inline void neo_parse_isr(struct dgnc_board *brd, uint port)
 
 		if (isr & (UART_17158_IIR_RDI_TIMEOUT | UART_IIR_RDI)) {
 			/* Read data from uart -> queue */
-			ch->ch_intr_rx++;
 			neo_copy_data_from_uart_to_queue(ch);
 
 			/* Call our tty layer to enforce queue flow control if needed. */
@@ -512,7 +511,6 @@ static inline void neo_parse_lsr(struct dgnc_board *brd, uint port)
 	ch->ch_cached_lsr |= linestatus;
 
 	if (ch->ch_cached_lsr & UART_LSR_DR) {
-		ch->ch_intr_rx++;
 		/* Read data from uart -> queue */
 		neo_copy_data_from_uart_to_queue(ch);
 		spin_lock_irqsave(&ch->ch_lock, flags);
-- 
1.9.1

