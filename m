From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Wed, 06 Jul 2016 06:17:18 +0000
Subject: [PATCH 10/15 RESEND] staging: dgnc: remove unused variable 'intr_modem'
Message-Id: <20160706061718.GA18671@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The 'intr_modem' variable was used only for increasing.
So the 'intr_modem' variable is not useful for this driver.

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
 drivers/staging/dgnc/dgnc_neo.c    | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_cls.c b/drivers/staging/dgnc/dgnc_cls.c
index ac0899a..449a6bb 100644
--- a/drivers/staging/dgnc/dgnc_cls.c
+++ b/drivers/staging/dgnc/dgnc_cls.c
@@ -603,7 +603,6 @@ static inline void cls_parse_isr(struct dgnc_board *brd, uint port)
 
 		/* CTS/RTS change of state */
 		if (isr & UART_IIR_CTSRTS) {
-			brd->intr_modem++;
 			ch->ch_intr_modem++;
 			/*
 			 * Don't need to do anything, the cls_parse_modem
diff --git a/drivers/staging/dgnc/dgnc_driver.h b/drivers/staging/dgnc/dgnc_driver.h
index 7ac33ed..2caeff7 100644
--- a/drivers/staging/dgnc/dgnc_driver.h
+++ b/drivers/staging/dgnc/dgnc_driver.h
@@ -183,7 +183,6 @@ struct dgnc_board {
 	uint		nasync;		/* Number of ports on card */
 
 	uint		irq;		/* Interrupt request number */
-	ulong		intr_modem;	/* Count of interrupts */
 	ulong		intr_tx;	/* Count of interrupts */
 	ulong		intr_rx;	/* Count of interrupts */
 
diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
index 3f8bbb3..a3e100b 100644
--- a/drivers/staging/dgnc/dgnc_neo.c
+++ b/drivers/staging/dgnc/dgnc_neo.c
@@ -452,7 +452,6 @@ static inline void neo_parse_isr(struct dgnc_board *brd, uint port)
 			 * If we get here, this means the hardware is doing auto flow control.
 			 * Check to see whether RTS/DTR or CTS/DSR caused this interrupt.
 			 */
-			brd->intr_modem++;
 			ch->ch_intr_modem++;
 			cause = readb(&ch->ch_neo_uart->mcr);
 			/* Which pin is doing auto flow? RTS or DTR? */
-- 
1.9.1

