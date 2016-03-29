From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Tue, 29 Mar 2016 04:47:59 +0000
Subject: [PATCH 1/3] staging: dgnc: remove parenthesis around the CONST |
Message-Id: <20160329044759.GA22649@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: markh@compro.net, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

remove parenthesis around the CONST | CONST.
It will be also fixed checkpatch.pl warning about
"Alignment should match open parenthesis" becasue
parenthesis were removed by this patch.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_neo.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
index d732e6e..c3bb1b4 100644
--- a/drivers/staging/dgnc/dgnc_neo.c
+++ b/drivers/staging/dgnc/dgnc_neo.c
@@ -117,8 +117,8 @@ static inline void neo_set_cts_flow_control(struct channel_t *ch)
 	writeb(efr, &ch->ch_neo_uart->efr);
 
 	/* Turn on table D, with 8 char hi/low watermarks */
-	writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_4DELAY),
-		&ch->ch_neo_uart->fctr);
+	writeb(UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_4DELAY,
+	       &ch->ch_neo_uart->fctr);
 
 	/* Feed the UART our trigger levels */
 	writeb(8, &ch->ch_neo_uart->tfifo);
@@ -152,8 +152,8 @@ static inline void neo_set_rts_flow_control(struct channel_t *ch)
 	/* Turn on UART enhanced bits */
 	writeb(efr, &ch->ch_neo_uart->efr);
 
-	writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_4DELAY),
-		&ch->ch_neo_uart->fctr);
+	writeb(UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_4DELAY,
+	       &ch->ch_neo_uart->fctr);
 	ch->ch_r_watermark = 4;
 
 	writeb(32, &ch->ch_neo_uart->rfifo);
@@ -190,7 +190,7 @@ static inline void neo_set_ixon_flow_control(struct channel_t *ch)
 	/* Turn on UART enhanced bits */
 	writeb(efr, &ch->ch_neo_uart->efr);
 
-	writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_8DELAY),
+	writeb(UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_8DELAY,
 	       &ch->ch_neo_uart->fctr);
 	ch->ch_r_watermark = 4;
 
@@ -229,8 +229,8 @@ static inline void neo_set_ixoff_flow_control(struct channel_t *ch)
 	writeb(efr, &ch->ch_neo_uart->efr);
 
 	/* Turn on table D, with 8 char hi/low watermarks */
-	writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_8DELAY),
-		&ch->ch_neo_uart->fctr);
+	writeb(UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_8DELAY,
+	       &ch->ch_neo_uart->fctr);
 
 	writeb(8, &ch->ch_neo_uart->tfifo);
 	ch->ch_t_tlevel = 8;
@@ -270,8 +270,8 @@ static inline void neo_set_no_input_flow_control(struct channel_t *ch)
 	writeb(efr, &ch->ch_neo_uart->efr);
 
 	/* Turn on table D, with 8 char hi/low watermarks */
-	writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_8DELAY),
-		&ch->ch_neo_uart->fctr);
+	writeb(UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_8DELAY,
+	       &ch->ch_neo_uart->fctr);
 
 	ch->ch_r_watermark = 0;
 
@@ -308,8 +308,8 @@ static inline void neo_set_no_output_flow_control(struct channel_t *ch)
 	writeb(efr, &ch->ch_neo_uart->efr);
 
 	/* Turn on table D, with 8 char hi/low watermarks */
-	writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_8DELAY),
-		&ch->ch_neo_uart->fctr);
+	writeb(UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_8DELAY,
+	       &ch->ch_neo_uart->fctr);
 
 	ch->ch_r_watermark = 0;
 
@@ -1373,7 +1373,7 @@ static void neo_flush_uart_read(struct channel_t *ch)
 	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
 		return;
 
-	writeb((UART_FCR_ENABLE_FIFO | UART_FCR_CLEAR_RCVR),
+	writeb(UART_FCR_ENABLE_FIFO | UART_FCR_CLEAR_RCVR,
 	       &ch->ch_neo_uart->isr_fcr);
 	neo_pci_posting_flush(ch->ch_bd);
 
@@ -1648,7 +1648,7 @@ static void neo_uart_init(struct channel_t *ch)
 
 	/* Clear out UART and FIFO */
 	readb(&ch->ch_neo_uart->txrx);
-	writeb((UART_FCR_ENABLE_FIFO | UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT),
+	writeb(UART_FCR_ENABLE_FIFO | UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT,
 	       &ch->ch_neo_uart->isr_fcr);
 	readb(&ch->ch_neo_uart->lsr);
 	readb(&ch->ch_neo_uart->msr);
-- 
1.9.1

