From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Wed, 06 Jul 2016 06:17:53 +0000
Subject: [PATCH 11/15 RESEND] staging: dgnc: remove useless variable 'intr_tx'
Message-Id: <20160706061753.GA18690@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The 'intr_tx' variable was used only for increasing.
So the 'intr_tx' variable is not useful for this driver.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
RESEND: This patch was not merged for a long time, if there is any reason
why this patch could NOT be merged into staging tree, let me know.
There were no comment for this patch.
I cannot understand why this patch have to wait long time to merge.
And I also sent emails to mailing-lists for reminding this patch...
please let me know, what is the problem to merge this patch into staging tree.

 drivers/staging/dgnc/dgnc_cls.c    | 1 -
 drivers/staging/dgnc/dgnc_driver.h | 1 -
 drivers/staging/dgnc/dgnc_neo.c    | 3 ---
 3 files changed, 5 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_cls.c b/drivers/staging/dgnc/dgnc_cls.c
index 449a6bb..088b546 100644
--- a/drivers/staging/dgnc/dgnc_cls.c
+++ b/drivers/staging/dgnc/dgnc_cls.c
@@ -595,7 +595,6 @@ static inline void cls_parse_isr(struct dgnc_board *brd, uint port)
 			/* Transfer data (if any) from Write Queue -> UART. */
 			spin_lock_irqsave(&ch->ch_lock, flags);
 			ch->ch_flags |= (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM);
-			brd->intr_tx++;
 			ch->ch_intr_tx++;
 			spin_unlock_irqrestore(&ch->ch_lock, flags);
 			cls_copy_data_from_queue_to_uart(ch);
diff --git a/drivers/staging/dgnc/dgnc_driver.h b/drivers/staging/dgnc/dgnc_driver.h
index 2caeff7..a8d823b 100644
--- a/drivers/staging/dgnc/dgnc_driver.h
+++ b/drivers/staging/dgnc/dgnc_driver.h
@@ -183,7 +183,6 @@ struct dgnc_board {
 	uint		nasync;		/* Number of ports on card */
 
 	uint		irq;		/* Interrupt request number */
-	ulong		intr_tx;	/* Count of interrupts */
 	ulong		intr_rx;	/* Count of interrupts */
 
 	ulong		membase;	/* Start of base memory of the card */
diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
index a3e100b..5f3eacdf 100644
--- a/drivers/staging/dgnc/dgnc_neo.c
+++ b/drivers/staging/dgnc/dgnc_neo.c
@@ -410,7 +410,6 @@ static inline void neo_parse_isr(struct dgnc_board *brd, uint port)
 		}
 
 		if (isr & UART_IIR_THRI) {
-			brd->intr_tx++;
 			ch->ch_intr_tx++;
 			/* Transfer data (if any) from Write Queue -> UART. */
 			spin_lock_irqsave(&ch->ch_lock, flags);
@@ -550,7 +549,6 @@ static inline void neo_parse_lsr(struct dgnc_board *brd, uint port)
 	}
 
 	if (linestatus & UART_LSR_THRE) {
-		brd->intr_tx++;
 		ch->ch_intr_tx++;
 		spin_lock_irqsave(&ch->ch_lock, flags);
 		ch->ch_flags |= (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM);
@@ -559,7 +557,6 @@ static inline void neo_parse_lsr(struct dgnc_board *brd, uint port)
 		/* Transfer data (if any) from Write Queue -> UART. */
 		neo_copy_data_from_queue_to_uart(ch);
 	} else if (linestatus & UART_17158_TX_AND_FIFO_CLR) {
-		brd->intr_tx++;
 		ch->ch_intr_tx++;
 		spin_lock_irqsave(&ch->ch_lock, flags);
 		ch->ch_flags |= (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM);
-- 
1.9.1

