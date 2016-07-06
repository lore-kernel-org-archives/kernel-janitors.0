From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Wed, 06 Jul 2016 06:18:56 +0000
Subject: [PATCH 13/15 RESEND] staging: dgnc: remove useless variable 'ch_intr_modem'
Message-Id: <20160706061856.GA18728@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The 'ch_intr_modem' variable was used only for increasing.
So the 'ch_intr_modem' variable is not useful for this driver.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
RESEND: This patch was not merged for a long time, if there is any reason
why this patch could NOT be merged into staging tree, let me know.
There were no comment for this patch.
I cannot understand why this patch have to wait long time to merge.
And I also sent emails to mailing-lists for reminding this patch...
please let me know, what is the problem to merge this patch into staging tree.

 drivers/staging/dgnc/dgnc_cls.c    | 9 ---------
 drivers/staging/dgnc/dgnc_driver.h | 1 -
 drivers/staging/dgnc/dgnc_neo.c    | 1 -
 3 files changed, 11 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_cls.c b/drivers/staging/dgnc/dgnc_cls.c
index 31fcf04..b9955be 100644
--- a/drivers/staging/dgnc/dgnc_cls.c
+++ b/drivers/staging/dgnc/dgnc_cls.c
@@ -599,15 +599,6 @@ static inline void cls_parse_isr(struct dgnc_board *brd, uint port)
 			cls_copy_data_from_queue_to_uart(ch);
 		}
 
-		/* CTS/RTS change of state */
-		if (isr & UART_IIR_CTSRTS) {
-			ch->ch_intr_modem++;
-			/*
-			 * Don't need to do anything, the cls_parse_modem
-			 * below will grab the updated modem signals.
-			 */
-		}
-
 		/* Parse any modem signal changes */
 		cls_parse_modem(ch, readb(&ch->ch_cls_uart->msr));
 	}
diff --git a/drivers/staging/dgnc/dgnc_driver.h b/drivers/staging/dgnc/dgnc_driver.h
index 914130d..1063388 100644
--- a/drivers/staging/dgnc/dgnc_driver.h
+++ b/drivers/staging/dgnc/dgnc_driver.h
@@ -377,7 +377,6 @@ struct channel_t {
 	ulong		ch_xon_sends;	/* Count of xons transmitted */
 	ulong		ch_xoff_sends;	/* Count of xoffs transmitted */
 
-	ulong		ch_intr_modem;	/* Count of interrupts */
 	ulong		ch_intr_tx;	/* Count of interrupts */
 	ulong		ch_intr_rx;	/* Count of interrupts */
 
diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
index f99c0db..9b3264c 100644
--- a/drivers/staging/dgnc/dgnc_neo.c
+++ b/drivers/staging/dgnc/dgnc_neo.c
@@ -450,7 +450,6 @@ static inline void neo_parse_isr(struct dgnc_board *brd, uint port)
 			 * If we get here, this means the hardware is doing auto flow control.
 			 * Check to see whether RTS/DTR or CTS/DSR caused this interrupt.
 			 */
-			ch->ch_intr_modem++;
 			cause = readb(&ch->ch_neo_uart->mcr);
 			/* Which pin is doing auto flow? RTS or DTR? */
 			if ((cause & 0x4) = 0) {
-- 
1.9.1

