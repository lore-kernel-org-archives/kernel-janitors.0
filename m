From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Fri, 27 May 2016 06:54:41 +0000
Subject: [PATCH 6/7] staging: dgnc: remove useless variable 'ch_intr_tx'
Message-Id: <20160527065441.GA3037@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The 'ch_intr_tx' variable was used only for increasing.
So the 'ch_intr_tx' variable is not useful for this driver.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_cls.c    | 1 -
 drivers/staging/dgnc/dgnc_driver.h | 1 -
 drivers/staging/dgnc/dgnc_neo.c    | 3 ---
 3 files changed, 5 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_cls.c b/drivers/staging/dgnc/dgnc_cls.c
index d7ff5fa..695f8ce 100644
--- a/drivers/staging/dgnc/dgnc_cls.c
+++ b/drivers/staging/dgnc/dgnc_cls.c
@@ -397,7 +397,6 @@ static inline void cls_parse_isr(struct dgnc_board *brd, uint port)
 			/* Transfer data (if any) from Write Queue -> UART. */
 			spin_lock_irqsave(&ch->ch_lock, flags);
 			ch->ch_flags |= (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM);
-			ch->ch_intr_tx++;
 			spin_unlock_irqrestore(&ch->ch_lock, flags);
 			cls_copy_data_from_queue_to_uart(ch);
 		}
diff --git a/drivers/staging/dgnc/dgnc_driver.h b/drivers/staging/dgnc/dgnc_driver.h
index 1063388..8bdf556 100644
--- a/drivers/staging/dgnc/dgnc_driver.h
+++ b/drivers/staging/dgnc/dgnc_driver.h
@@ -377,7 +377,6 @@ struct channel_t {
 	ulong		ch_xon_sends;	/* Count of xons transmitted */
 	ulong		ch_xoff_sends;	/* Count of xoffs transmitted */
 
-	ulong		ch_intr_tx;	/* Count of interrupts */
 	ulong		ch_intr_rx;	/* Count of interrupts */
 
 	/* /proc/<board>/<channel> entries */
diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
index 9b3264c..574a227 100644
--- a/drivers/staging/dgnc/dgnc_neo.c
+++ b/drivers/staging/dgnc/dgnc_neo.c
@@ -409,7 +409,6 @@ static inline void neo_parse_isr(struct dgnc_board *brd, uint port)
 		}
 
 		if (isr & UART_IIR_THRI) {
-			ch->ch_intr_tx++;
 			/* Transfer data (if any) from Write Queue -> UART. */
 			spin_lock_irqsave(&ch->ch_lock, flags);
 			ch->ch_flags |= (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM);
@@ -546,7 +545,6 @@ static inline void neo_parse_lsr(struct dgnc_board *brd, uint port)
 	}
 
 	if (linestatus & UART_LSR_THRE) {
-		ch->ch_intr_tx++;
 		spin_lock_irqsave(&ch->ch_lock, flags);
 		ch->ch_flags |= (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM);
 		spin_unlock_irqrestore(&ch->ch_lock, flags);
@@ -554,7 +552,6 @@ static inline void neo_parse_lsr(struct dgnc_board *brd, uint port)
 		/* Transfer data (if any) from Write Queue -> UART. */
 		neo_copy_data_from_queue_to_uart(ch);
 	} else if (linestatus & UART_17158_TX_AND_FIFO_CLR) {
-		ch->ch_intr_tx++;
 		spin_lock_irqsave(&ch->ch_lock, flags);
 		ch->ch_flags |= (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM);
 		spin_unlock_irqrestore(&ch->ch_lock, flags);
-- 
1.9.1

