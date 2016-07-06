From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Wed, 06 Jul 2016 06:14:37 +0000
Subject: [PATCH 06/15 RESEND] staging: dgnc: re-arrange functions for removing
Message-Id: <20160706061437.GA18579@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Re-arrange the functions for removing forward declarations in dgnc_cls.c file.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
RESEND: This patch was not merged for a long time, if there is any reason
why this patch could NOT be merged into staging tree, let me know.
There were no comment for this patch.
I cannot understand why this patch have to wait long time to merge.
And I also sent emails to mailing-lists for reminding this patch...
please let me know, what is the problem to merge this patch into staging tree.

 drivers/staging/dgnc/dgnc_cls.c | 949 +++++++++++++++++++---------------------
 1 file changed, 460 insertions(+), 489 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_cls.c b/drivers/staging/dgnc/dgnc_cls.c
index 46c050c..2347bdc 100644
--- a/drivers/staging/dgnc/dgnc_cls.c
+++ b/drivers/staging/dgnc/dgnc_cls.c
@@ -26,56 +26,6 @@
 #include "dgnc_cls.h"
 #include "dgnc_tty.h"
 
-static inline void cls_parse_isr(struct dgnc_board *brd, uint port);
-static inline void cls_clear_break(struct channel_t *ch, int force);
-static inline void cls_set_cts_flow_control(struct channel_t *ch);
-static inline void cls_set_rts_flow_control(struct channel_t *ch);
-static inline void cls_set_ixon_flow_control(struct channel_t *ch);
-static inline void cls_set_ixoff_flow_control(struct channel_t *ch);
-static inline void cls_set_no_output_flow_control(struct channel_t *ch);
-static inline void cls_set_no_input_flow_control(struct channel_t *ch);
-static void cls_parse_modem(struct channel_t *ch, unsigned char signals);
-static void cls_tasklet(unsigned long data);
-static void cls_vpd(struct dgnc_board *brd);
-static void cls_uart_init(struct channel_t *ch);
-static void cls_uart_off(struct channel_t *ch);
-static int cls_drain(struct tty_struct *tty, uint seconds);
-static void cls_param(struct tty_struct *tty);
-static void cls_assert_modem_signals(struct channel_t *ch);
-static void cls_flush_uart_write(struct channel_t *ch);
-static void cls_flush_uart_read(struct channel_t *ch);
-static void cls_disable_receiver(struct channel_t *ch);
-static void cls_enable_receiver(struct channel_t *ch);
-static void cls_send_break(struct channel_t *ch, int msecs);
-static void cls_send_start_character(struct channel_t *ch);
-static void cls_send_stop_character(struct channel_t *ch);
-static void cls_copy_data_from_uart_to_queue(struct channel_t *ch);
-static void cls_copy_data_from_queue_to_uart(struct channel_t *ch);
-static uint cls_get_uart_bytes_left(struct channel_t *ch);
-static void cls_send_immediate_char(struct channel_t *ch, unsigned char);
-static irqreturn_t cls_intr(int irq, void *voidbrd);
-
-struct board_ops dgnc_cls_ops = {
-	.tasklet =			cls_tasklet,
-	.intr =				cls_intr,
-	.uart_init =			cls_uart_init,
-	.uart_off =			cls_uart_off,
-	.drain =			cls_drain,
-	.param =			cls_param,
-	.vpd =				cls_vpd,
-	.assert_modem_signals =		cls_assert_modem_signals,
-	.flush_uart_write =		cls_flush_uart_write,
-	.flush_uart_read =		cls_flush_uart_read,
-	.disable_receiver =		cls_disable_receiver,
-	.enable_receiver =		cls_enable_receiver,
-	.send_break =			cls_send_break,
-	.send_start_character =		cls_send_start_character,
-	.send_stop_character =		cls_send_stop_character,
-	.copy_data_from_queue_to_uart = cls_copy_data_from_queue_to_uart,
-	.get_uart_bytes_left =		cls_get_uart_bytes_left,
-	.send_immediate_char =		cls_send_immediate_char
-};
-
 static inline void cls_set_cts_flow_control(struct channel_t *ch)
 {
 	unsigned char lcrb = readb(&ch->ch_cls_uart->lcr);
@@ -357,164 +307,444 @@ static inline void cls_clear_break(struct channel_t *ch, int force)
 	spin_unlock_irqrestore(&ch->ch_lock, flags);
 }
 
-/* Parse the ISR register for the specific port */
-static inline void cls_parse_isr(struct dgnc_board *brd, uint port)
+static void cls_copy_data_from_uart_to_queue(struct channel_t *ch)
 {
-	struct channel_t *ch;
-	unsigned char isr = 0;
+	int qleft = 0;
+	unsigned char linestatus = 0;
+	unsigned char error_mask = 0;
+	ushort head;
+	ushort tail;
 	unsigned long flags;
 
-	/*
-	 * No need to verify board pointer, it was already
-	 * verified in the interrupt routine.
-	 */
-
-	if (port >= brd->nasync)
+	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
 		return;
 
-	ch = brd->channels[port];
-	if (ch->magic != DGNC_CHANNEL_MAGIC)
-		return;
+	spin_lock_irqsave(&ch->ch_lock, flags);
+
+	/* cache head and tail of queue */
+	head = ch->ch_r_head;
+	tail = ch->ch_r_tail;
+
+	/* Store how much space we have left in the queue */
+	qleft = tail - head - 1;
+	if (qleft < 0)
+		qleft += RQUEUEMASK + 1;
+
+	/*
+	 * Create a mask to determine whether we should
+	 * insert the character (if any) into our queue.
+	 */
+	if (ch->ch_c_iflag & IGNBRK)
+		error_mask |= UART_LSR_BI;
 
-	/* Here we try to figure out what caused the interrupt to happen */
 	while (1) {
-		isr = readb(&ch->ch_cls_uart->isr_fcr);
+		linestatus = readb(&ch->ch_cls_uart->lsr);
 
-		/* Bail if no pending interrupt on port */
-		if (isr & UART_IIR_NO_INT)
+		if (!(linestatus & (UART_LSR_DR)))
 			break;
 
-		/* Receive Interrupt pending */
-		if (isr & (UART_IIR_RDI | UART_IIR_RDI_TIMEOUT)) {
-			/* Read data from uart -> queue */
-			brd->intr_rx++;
-			ch->ch_intr_rx++;
-			cls_copy_data_from_uart_to_queue(ch);
-			dgnc_check_queue_flow_control(ch);
+		/*
+		 * Discard character if we are ignoring the error mask.
+		*/
+		if (linestatus & error_mask)  {
+			linestatus = 0;
+			readb(&ch->ch_cls_uart->txrx);
+			continue;
 		}
 
-		/* Transmit Hold register empty pending */
-		if (isr & UART_IIR_THRI) {
-			/* Transfer data (if any) from Write Queue -> UART. */
-			spin_lock_irqsave(&ch->ch_lock, flags);
-			ch->ch_flags |= (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM);
-			brd->intr_tx++;
-			ch->ch_intr_tx++;
-			spin_unlock_irqrestore(&ch->ch_lock, flags);
-			cls_copy_data_from_queue_to_uart(ch);
+		/*
+		 * If our queue is full, we have no choice but to drop some
+		 * data. The assumption is that HWFLOW or SWFLOW should have
+		 * stopped things way way before we got to this point.
+		 *
+		 * I decided that I wanted to ditch the oldest data first,
+		 * I hope thats okay with everyone? Yes? Good.
+		 */
+		while (qleft < 1) {
+			tail = (tail + 1) & RQUEUEMASK;
+			ch->ch_r_tail = tail;
+			ch->ch_err_overrun++;
+			qleft++;
 		}
 
-		/* CTS/RTS change of state */
-		if (isr & UART_IIR_CTSRTS) {
-			brd->intr_modem++;
-			ch->ch_intr_modem++;
-			/*
-			 * Don't need to do anything, the cls_parse_modem
-			 * below will grab the updated modem signals.
-			 */
-		}
+		ch->ch_equeue[head] = linestatus & (UART_LSR_BI | UART_LSR_PE
+								 | UART_LSR_FE);
+		ch->ch_rqueue[head] = readb(&ch->ch_cls_uart->txrx);
 
-		/* Parse any modem signal changes */
-		cls_parse_modem(ch, readb(&ch->ch_cls_uart->msr));
+		qleft--;
+
+		if (ch->ch_equeue[head] & UART_LSR_PE)
+			ch->ch_err_parity++;
+		if (ch->ch_equeue[head] & UART_LSR_BI)
+			ch->ch_err_break++;
+		if (ch->ch_equeue[head] & UART_LSR_FE)
+			ch->ch_err_frame++;
+
+		/* Add to, and flip head if needed */
+		head = (head + 1) & RQUEUEMASK;
+		ch->ch_rxcount++;
 	}
+
+	/*
+	 * Write new final heads to channel structure.
+	 */
+	ch->ch_r_head = head & RQUEUEMASK;
+	ch->ch_e_head = head & EQUEUEMASK;
+
+	spin_unlock_irqrestore(&ch->ch_lock, flags);
 }
 
-/*
- * cls_param()
- * Send any/all changes to the line to the UART.
- */
-static void cls_param(struct tty_struct *tty)
+/* Make the UART raise any of the output signals we want up */
+static void cls_assert_modem_signals(struct channel_t *ch)
 {
-	unsigned char lcr = 0;
-	unsigned char uart_lcr = 0;
-	unsigned char ier = 0;
-	unsigned char uart_ier = 0;
-	uint baud = 9600;
-	int quot = 0;
-	struct dgnc_board *bd;
-	struct channel_t *ch;
-	struct un_t   *un;
+	unsigned char out;
 
-	if (!tty || tty->magic != TTY_MAGIC)
+	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
 		return;
 
-	un = (struct un_t *)tty->driver_data;
-	if (!un || un->magic != DGNC_UNIT_MAGIC)
-		return;
+	out = ch->ch_mostat;
+
+	if (ch->ch_flags & CH_LOOPBACK)
+		out |= UART_MCR_LOOP;
+
+	writeb(out, &ch->ch_cls_uart->mcr);
+
+	/* Give time for the UART to actually drop the signals */
+	udelay(10);
+}
+
+static void cls_copy_data_from_queue_to_uart(struct channel_t *ch)
+{
+	ushort head;
+	ushort tail;
+	int n;
+	int qlen;
+	uint len_written = 0;
+	unsigned long flags;
 
-	ch = un->un_ch;
 	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
 		return;
 
-	bd = ch->ch_bd;
-	if (!bd || bd->magic != DGNC_BOARD_MAGIC)
-		return;
+	spin_lock_irqsave(&ch->ch_lock, flags);
 
-	/*
-	 * If baud rate is zero, flush queues, and set mval to drop DTR.
-	 */
-	if ((ch->ch_c_cflag & (CBAUD)) = 0) {
-		ch->ch_r_head = 0;
-		ch->ch_r_tail = 0;
-		ch->ch_e_head = 0;
-		ch->ch_e_tail = 0;
-		ch->ch_w_head = 0;
-		ch->ch_w_tail = 0;
+	/* No data to write to the UART */
+	if (ch->ch_w_tail = ch->ch_w_head)
+		goto exit_unlock;
 
-		cls_flush_uart_write(ch);
-		cls_flush_uart_read(ch);
+	/* If port is "stopped", don't send any data to the UART */
+	if ((ch->ch_flags & CH_FORCED_STOP) ||
+	    (ch->ch_flags & CH_BREAK_SENDING))
+		goto exit_unlock;
 
-		/* The baudrate is B0 so all modem lines are to be dropped. */
-		ch->ch_flags |= (CH_BAUD0);
-		ch->ch_mostat &= ~(UART_MCR_RTS | UART_MCR_DTR);
-		cls_assert_modem_signals(ch);
-		ch->ch_old_baud = 0;
-		return;
-	} else if (ch->ch_custom_speed) {
-		baud = ch->ch_custom_speed;
-		/* Handle transition from B0 */
-		if (ch->ch_flags & CH_BAUD0) {
-			ch->ch_flags &= ~(CH_BAUD0);
+	if (!(ch->ch_flags & (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM)))
+		goto exit_unlock;
 
-			/*
-			 * Bring back up RTS and DTR...
-			 * Also handle RTS or DTR toggle if set.
-			 */
-			if (!(ch->ch_digi.digi_flags & DIGI_RTS_TOGGLE))
-				ch->ch_mostat |= (UART_MCR_RTS);
-			if (!(ch->ch_digi.digi_flags & DIGI_DTR_TOGGLE))
-				ch->ch_mostat |= (UART_MCR_DTR);
-		}
+	n = 32;
 
-	} else {
-		int iindex = 0;
-		int jindex = 0;
+	/* cache head and tail of queue */
+	head = ch->ch_w_head & WQUEUEMASK;
+	tail = ch->ch_w_tail & WQUEUEMASK;
+	qlen = (head - tail) & WQUEUEMASK;
 
-		ulong bauds[4][16] = {
-			{ /* slowbaud */
-				0,      50,     75,     110,
-				134,    150,    200,    300,
-				600,    1200,   1800,   2400,
-				4800,   9600,   19200,  38400 },
-			{ /* slowbaud & CBAUDEX */
-				0,      57600,  115200, 230400,
-				460800, 150,    200,    921600,
-				600,    1200,   1800,   2400,
-				4800,   9600,   19200,  38400 },
-			{ /* fastbaud */
-				0,      57600,   76800, 115200,
-				131657, 153600, 230400, 460800,
-				921600, 1200,   1800,   2400,
-				4800,   9600,   19200,  38400 },
-			{ /* fastbaud & CBAUDEX */
-				0,      57600,  115200, 230400,
-				460800, 150,    200,    921600,
-				600,    1200,   1800,   2400,
-				4800,   9600,   19200,  38400 }
-		};
+	/* Find minimum of the FIFO space, versus queue length */
+	n = min(n, qlen);
 
+	while (n > 0) {
 		/*
-		 * Only use the TXPrint baud rate if the terminal
+		 * If RTS Toggle mode is on, turn on RTS now if not already set,
+		 * and make sure we get an event when the data transfer has
+		 * completed.
+		 */
+		if (ch->ch_digi.digi_flags & DIGI_RTS_TOGGLE) {
+			if (!(ch->ch_mostat & UART_MCR_RTS)) {
+				ch->ch_mostat |= (UART_MCR_RTS);
+				cls_assert_modem_signals(ch);
+			}
+			ch->ch_tun.un_flags |= (UN_EMPTY);
+		}
+
+		/*
+		 * If DTR Toggle mode is on, turn on DTR now if not already set,
+		 * and make sure we get an event when the data transfer has
+		 * completed.
+		 */
+		if (ch->ch_digi.digi_flags & DIGI_DTR_TOGGLE) {
+			if (!(ch->ch_mostat & UART_MCR_DTR)) {
+				ch->ch_mostat |= (UART_MCR_DTR);
+				cls_assert_modem_signals(ch);
+			}
+			ch->ch_tun.un_flags |= (UN_EMPTY);
+		}
+		writeb(ch->ch_wqueue[ch->ch_w_tail], &ch->ch_cls_uart->txrx);
+		ch->ch_w_tail++;
+		ch->ch_w_tail &= WQUEUEMASK;
+		ch->ch_txcount++;
+		len_written++;
+		n--;
+	}
+
+	if (len_written > 0)
+		ch->ch_flags &= ~(CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM);
+
+exit_unlock:
+	spin_unlock_irqrestore(&ch->ch_lock, flags);
+}
+
+static void cls_parse_modem(struct channel_t *ch, unsigned char signals)
+{
+	unsigned char msignals = signals;
+	unsigned long flags;
+
+	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
+		return;
+
+	/*
+	 * Do altpin switching. Altpin switches DCD and DSR.
+	 * This prolly breaks DSRPACE, so we should be more clever here.
+	 */
+	spin_lock_irqsave(&ch->ch_lock, flags);
+	if (ch->ch_digi.digi_flags & DIGI_ALTPIN) {
+		unsigned char mswap = signals;
+
+		if (mswap & UART_MSR_DDCD) {
+			msignals &= ~UART_MSR_DDCD;
+			msignals |= UART_MSR_DDSR;
+		}
+		if (mswap & UART_MSR_DDSR) {
+			msignals &= ~UART_MSR_DDSR;
+			msignals |= UART_MSR_DDCD;
+		}
+		if (mswap & UART_MSR_DCD) {
+			msignals &= ~UART_MSR_DCD;
+			msignals |= UART_MSR_DSR;
+		}
+		if (mswap & UART_MSR_DSR) {
+			msignals &= ~UART_MSR_DSR;
+			msignals |= UART_MSR_DCD;
+		}
+	}
+	spin_unlock_irqrestore(&ch->ch_lock, flags);
+
+	/*
+	 * Scrub off lower bits. They signify delta's, which I don't
+	 * care about
+	 */
+	signals &= 0xf0;
+
+	spin_lock_irqsave(&ch->ch_lock, flags);
+	if (msignals & UART_MSR_DCD)
+		ch->ch_mistat |= UART_MSR_DCD;
+	else
+		ch->ch_mistat &= ~UART_MSR_DCD;
+
+	if (msignals & UART_MSR_DSR)
+		ch->ch_mistat |= UART_MSR_DSR;
+	else
+		ch->ch_mistat &= ~UART_MSR_DSR;
+
+	if (msignals & UART_MSR_RI)
+		ch->ch_mistat |= UART_MSR_RI;
+	else
+		ch->ch_mistat &= ~UART_MSR_RI;
+
+	if (msignals & UART_MSR_CTS)
+		ch->ch_mistat |= UART_MSR_CTS;
+	else
+		ch->ch_mistat &= ~UART_MSR_CTS;
+	spin_unlock_irqrestore(&ch->ch_lock, flags);
+}
+
+/* Parse the ISR register for the specific port */
+static inline void cls_parse_isr(struct dgnc_board *brd, uint port)
+{
+	struct channel_t *ch;
+	unsigned char isr = 0;
+	unsigned long flags;
+
+	/*
+	 * No need to verify board pointer, it was already
+	 * verified in the interrupt routine.
+	 */
+
+	if (port >= brd->nasync)
+		return;
+
+	ch = brd->channels[port];
+	if (ch->magic != DGNC_CHANNEL_MAGIC)
+		return;
+
+	/* Here we try to figure out what caused the interrupt to happen */
+	while (1) {
+		isr = readb(&ch->ch_cls_uart->isr_fcr);
+
+		/* Bail if no pending interrupt on port */
+		if (isr & UART_IIR_NO_INT)
+			break;
+
+		/* Receive Interrupt pending */
+		if (isr & (UART_IIR_RDI | UART_IIR_RDI_TIMEOUT)) {
+			/* Read data from uart -> queue */
+			brd->intr_rx++;
+			ch->ch_intr_rx++;
+			cls_copy_data_from_uart_to_queue(ch);
+			dgnc_check_queue_flow_control(ch);
+		}
+
+		/* Transmit Hold register empty pending */
+		if (isr & UART_IIR_THRI) {
+			/* Transfer data (if any) from Write Queue -> UART. */
+			spin_lock_irqsave(&ch->ch_lock, flags);
+			ch->ch_flags |= (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM);
+			brd->intr_tx++;
+			ch->ch_intr_tx++;
+			spin_unlock_irqrestore(&ch->ch_lock, flags);
+			cls_copy_data_from_queue_to_uart(ch);
+		}
+
+		/* CTS/RTS change of state */
+		if (isr & UART_IIR_CTSRTS) {
+			brd->intr_modem++;
+			ch->ch_intr_modem++;
+			/*
+			 * Don't need to do anything, the cls_parse_modem
+			 * below will grab the updated modem signals.
+			 */
+		}
+
+		/* Parse any modem signal changes */
+		cls_parse_modem(ch, readb(&ch->ch_cls_uart->msr));
+	}
+}
+
+/* Channel lock MUST be held before calling this function! */
+static void cls_flush_uart_write(struct channel_t *ch)
+{
+	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
+		return;
+
+	writeb((UART_FCR_ENABLE_FIFO | UART_FCR_CLEAR_XMIT),
+	       &ch->ch_cls_uart->isr_fcr);
+	usleep_range(10, 20);
+
+	ch->ch_flags |= (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM);
+}
+
+/* Channel lock MUST be held before calling this function! */
+static void cls_flush_uart_read(struct channel_t *ch)
+{
+	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
+		return;
+
+	/*
+	 * For complete POSIX compatibility, we should be purging the
+	 * read FIFO in the UART here.
+	 *
+	 * However, clearing the read FIFO (UART_FCR_CLEAR_RCVR) also
+	 * incorrectly flushes write data as well as just basically trashing the
+	 * FIFO.
+	 *
+	 * Presumably, this is a bug in this UART.
+	 */
+
+	udelay(10);
+}
+
+/*
+ * cls_param()
+ * Send any/all changes to the line to the UART.
+ */
+static void cls_param(struct tty_struct *tty)
+{
+	unsigned char lcr = 0;
+	unsigned char uart_lcr = 0;
+	unsigned char ier = 0;
+	unsigned char uart_ier = 0;
+	uint baud = 9600;
+	int quot = 0;
+	struct dgnc_board *bd;
+	struct channel_t *ch;
+	struct un_t   *un;
+
+	if (!tty || tty->magic != TTY_MAGIC)
+		return;
+
+	un = (struct un_t *)tty->driver_data;
+	if (!un || un->magic != DGNC_UNIT_MAGIC)
+		return;
+
+	ch = un->un_ch;
+	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
+		return;
+
+	bd = ch->ch_bd;
+	if (!bd || bd->magic != DGNC_BOARD_MAGIC)
+		return;
+
+	/*
+	 * If baud rate is zero, flush queues, and set mval to drop DTR.
+	 */
+	if ((ch->ch_c_cflag & (CBAUD)) = 0) {
+		ch->ch_r_head = 0;
+		ch->ch_r_tail = 0;
+		ch->ch_e_head = 0;
+		ch->ch_e_tail = 0;
+		ch->ch_w_head = 0;
+		ch->ch_w_tail = 0;
+
+		cls_flush_uart_write(ch);
+		cls_flush_uart_read(ch);
+
+		/* The baudrate is B0 so all modem lines are to be dropped. */
+		ch->ch_flags |= (CH_BAUD0);
+		ch->ch_mostat &= ~(UART_MCR_RTS | UART_MCR_DTR);
+		cls_assert_modem_signals(ch);
+		ch->ch_old_baud = 0;
+		return;
+	} else if (ch->ch_custom_speed) {
+		baud = ch->ch_custom_speed;
+		/* Handle transition from B0 */
+		if (ch->ch_flags & CH_BAUD0) {
+			ch->ch_flags &= ~(CH_BAUD0);
+
+			/*
+			 * Bring back up RTS and DTR...
+			 * Also handle RTS or DTR toggle if set.
+			 */
+			if (!(ch->ch_digi.digi_flags & DIGI_RTS_TOGGLE))
+				ch->ch_mostat |= (UART_MCR_RTS);
+			if (!(ch->ch_digi.digi_flags & DIGI_DTR_TOGGLE))
+				ch->ch_mostat |= (UART_MCR_DTR);
+		}
+
+	} else {
+		int iindex = 0;
+		int jindex = 0;
+
+		ulong bauds[4][16] = {
+			{ /* slowbaud */
+				0,      50,     75,     110,
+				134,    150,    200,    300,
+				600,    1200,   1800,   2400,
+				4800,   9600,   19200,  38400 },
+			{ /* slowbaud & CBAUDEX */
+				0,      57600,  115200, 230400,
+				460800, 150,    200,    921600,
+				600,    1200,   1800,   2400,
+				4800,   9600,   19200,  38400 },
+			{ /* fastbaud */
+				0,      57600,   76800, 115200,
+				131657, 153600, 230400, 460800,
+				921600, 1200,   1800,   2400,
+				4800,   9600,   19200,  38400 },
+			{ /* fastbaud & CBAUDEX */
+				0,      57600,  115200, 230400,
+				460800, 150,    200,    921600,
+				600,    1200,   1800,   2400,
+				4800,   9600,   19200,  38400 }
+		};
+
+		/*
+		 * Only use the TXPrint baud rate if the terminal
 		 * unit is NOT open
 		 */
 		if (!(ch->ch_tun.un_flags & UN_ISOPEN) &&
@@ -762,133 +992,46 @@ static irqreturn_t cls_intr(int irq, void *voidbrd)
 
 	brd->intr_count++;
 
-	/*
-	 * Check the board's global interrupt offset to see if we
-	 * we actually do have an interrupt pending for us.
-	 */
-	poll_reg = readb(brd->re_map_membase + UART_CLASSIC_POLL_ADDR_OFFSET);
-
-	/* If 0, no interrupts pending */
-	if (!poll_reg) {
-		spin_unlock_irqrestore(&brd->bd_intr_lock, flags);
-		return IRQ_NONE;
-	}
-
-	/* Parse each port to find out what caused the interrupt */
-	for (i = 0; i < brd->nasync; i++)
-		cls_parse_isr(brd, i);
-
-	/*
-	 * Schedule tasklet to more in-depth servicing at a better time.
-	 */
-	tasklet_schedule(&brd->helper_tasklet);
-
-	spin_unlock_irqrestore(&brd->bd_intr_lock, flags);
-
-	return IRQ_HANDLED;
-}
-
-static void cls_disable_receiver(struct channel_t *ch)
-{
-	unsigned char tmp = readb(&ch->ch_cls_uart->ier);
-
-	tmp &= ~(UART_IER_RDI);
-	writeb(tmp, &ch->ch_cls_uart->ier);
-}
-
-static void cls_enable_receiver(struct channel_t *ch)
-{
-	unsigned char tmp = readb(&ch->ch_cls_uart->ier);
-
-	tmp |= (UART_IER_RDI);
-	writeb(tmp, &ch->ch_cls_uart->ier);
-}
-
-static void cls_copy_data_from_uart_to_queue(struct channel_t *ch)
-{
-	int qleft = 0;
-	unsigned char linestatus = 0;
-	unsigned char error_mask = 0;
-	ushort head;
-	ushort tail;
-	unsigned long flags;
-
-	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
-		return;
-
-	spin_lock_irqsave(&ch->ch_lock, flags);
-
-	/* cache head and tail of queue */
-	head = ch->ch_r_head;
-	tail = ch->ch_r_tail;
-
-	/* Store how much space we have left in the queue */
-	qleft = tail - head - 1;
-	if (qleft < 0)
-		qleft += RQUEUEMASK + 1;
-
-	/*
-	 * Create a mask to determine whether we should
-	 * insert the character (if any) into our queue.
-	 */
-	if (ch->ch_c_iflag & IGNBRK)
-		error_mask |= UART_LSR_BI;
-
-	while (1) {
-		linestatus = readb(&ch->ch_cls_uart->lsr);
-
-		if (!(linestatus & (UART_LSR_DR)))
-			break;
-
-		/*
-		 * Discard character if we are ignoring the error mask.
-		*/
-		if (linestatus & error_mask)  {
-			linestatus = 0;
-			readb(&ch->ch_cls_uart->txrx);
-			continue;
-		}
-
-		/*
-		 * If our queue is full, we have no choice but to drop some
-		 * data. The assumption is that HWFLOW or SWFLOW should have
-		 * stopped things way way before we got to this point.
-		 *
-		 * I decided that I wanted to ditch the oldest data first,
-		 * I hope thats okay with everyone? Yes? Good.
-		 */
-		while (qleft < 1) {
-			tail = (tail + 1) & RQUEUEMASK;
-			ch->ch_r_tail = tail;
-			ch->ch_err_overrun++;
-			qleft++;
-		}
-
-		ch->ch_equeue[head] = linestatus & (UART_LSR_BI | UART_LSR_PE
-								 | UART_LSR_FE);
-		ch->ch_rqueue[head] = readb(&ch->ch_cls_uart->txrx);
-
-		qleft--;
-
-		if (ch->ch_equeue[head] & UART_LSR_PE)
-			ch->ch_err_parity++;
-		if (ch->ch_equeue[head] & UART_LSR_BI)
-			ch->ch_err_break++;
-		if (ch->ch_equeue[head] & UART_LSR_FE)
-			ch->ch_err_frame++;
-
-		/* Add to, and flip head if needed */
-		head = (head + 1) & RQUEUEMASK;
-		ch->ch_rxcount++;
+	/*
+	 * Check the board's global interrupt offset to see if we
+	 * we actually do have an interrupt pending for us.
+	 */
+	poll_reg = readb(brd->re_map_membase + UART_CLASSIC_POLL_ADDR_OFFSET);
+
+	/* If 0, no interrupts pending */
+	if (!poll_reg) {
+		spin_unlock_irqrestore(&brd->bd_intr_lock, flags);
+		return IRQ_NONE;
 	}
 
+	/* Parse each port to find out what caused the interrupt */
+	for (i = 0; i < brd->nasync; i++)
+		cls_parse_isr(brd, i);
+
 	/*
-	 * Write new final heads to channel structure.
+	 * Schedule tasklet to more in-depth servicing at a better time.
 	 */
-	ch->ch_r_head = head & RQUEUEMASK;
-	ch->ch_e_head = head & EQUEUEMASK;
+	tasklet_schedule(&brd->helper_tasklet);
 
-	spin_unlock_irqrestore(&ch->ch_lock, flags);
+	spin_unlock_irqrestore(&brd->bd_intr_lock, flags);
+
+	return IRQ_HANDLED;
+}
+
+static void cls_disable_receiver(struct channel_t *ch)
+{
+	unsigned char tmp = readb(&ch->ch_cls_uart->ier);
+
+	tmp &= ~(UART_IER_RDI);
+	writeb(tmp, &ch->ch_cls_uart->ier);
+}
+
+static void cls_enable_receiver(struct channel_t *ch)
+{
+	unsigned char tmp = readb(&ch->ch_cls_uart->ier);
+
+	tmp |= (UART_IER_RDI);
+	writeb(tmp, &ch->ch_cls_uart->ier);
 }
 
 /*
@@ -926,199 +1069,6 @@ static int cls_drain(struct tty_struct *tty, uint seconds)
 					 ((un->un_flags & UN_EMPTY) = 0));
 }
 
-/* Channel lock MUST be held before calling this function! */
-static void cls_flush_uart_write(struct channel_t *ch)
-{
-	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
-		return;
-
-	writeb((UART_FCR_ENABLE_FIFO | UART_FCR_CLEAR_XMIT),
-	       &ch->ch_cls_uart->isr_fcr);
-	usleep_range(10, 20);
-
-	ch->ch_flags |= (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM);
-}
-
-/* Channel lock MUST be held before calling this function! */
-static void cls_flush_uart_read(struct channel_t *ch)
-{
-	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
-		return;
-
-	/*
-	 * For complete POSIX compatibility, we should be purging the
-	 * read FIFO in the UART here.
-	 *
-	 * However, clearing the read FIFO (UART_FCR_CLEAR_RCVR) also
-	 * incorrectly flushes write data as well as just basically trashing the
-	 * FIFO.
-	 *
-	 * Presumably, this is a bug in this UART.
-	 */
-
-	udelay(10);
-}
-
-static void cls_copy_data_from_queue_to_uart(struct channel_t *ch)
-{
-	ushort head;
-	ushort tail;
-	int n;
-	int qlen;
-	uint len_written = 0;
-	unsigned long flags;
-
-	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
-		return;
-
-	spin_lock_irqsave(&ch->ch_lock, flags);
-
-	/* No data to write to the UART */
-	if (ch->ch_w_tail = ch->ch_w_head)
-		goto exit_unlock;
-
-	/* If port is "stopped", don't send any data to the UART */
-	if ((ch->ch_flags & CH_FORCED_STOP) ||
-	    (ch->ch_flags & CH_BREAK_SENDING))
-		goto exit_unlock;
-
-	if (!(ch->ch_flags & (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM)))
-		goto exit_unlock;
-
-	n = 32;
-
-	/* cache head and tail of queue */
-	head = ch->ch_w_head & WQUEUEMASK;
-	tail = ch->ch_w_tail & WQUEUEMASK;
-	qlen = (head - tail) & WQUEUEMASK;
-
-	/* Find minimum of the FIFO space, versus queue length */
-	n = min(n, qlen);
-
-	while (n > 0) {
-		/*
-		 * If RTS Toggle mode is on, turn on RTS now if not already set,
-		 * and make sure we get an event when the data transfer has
-		 * completed.
-		 */
-		if (ch->ch_digi.digi_flags & DIGI_RTS_TOGGLE) {
-			if (!(ch->ch_mostat & UART_MCR_RTS)) {
-				ch->ch_mostat |= (UART_MCR_RTS);
-				cls_assert_modem_signals(ch);
-			}
-			ch->ch_tun.un_flags |= (UN_EMPTY);
-		}
-
-		/*
-		 * If DTR Toggle mode is on, turn on DTR now if not already set,
-		 * and make sure we get an event when the data transfer has
-		 * completed.
-		 */
-		if (ch->ch_digi.digi_flags & DIGI_DTR_TOGGLE) {
-			if (!(ch->ch_mostat & UART_MCR_DTR)) {
-				ch->ch_mostat |= (UART_MCR_DTR);
-				cls_assert_modem_signals(ch);
-			}
-			ch->ch_tun.un_flags |= (UN_EMPTY);
-		}
-		writeb(ch->ch_wqueue[ch->ch_w_tail], &ch->ch_cls_uart->txrx);
-		ch->ch_w_tail++;
-		ch->ch_w_tail &= WQUEUEMASK;
-		ch->ch_txcount++;
-		len_written++;
-		n--;
-	}
-
-	if (len_written > 0)
-		ch->ch_flags &= ~(CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM);
-
-exit_unlock:
-	spin_unlock_irqrestore(&ch->ch_lock, flags);
-}
-
-static void cls_parse_modem(struct channel_t *ch, unsigned char signals)
-{
-	unsigned char msignals = signals;
-	unsigned long flags;
-
-	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
-		return;
-
-	/*
-	 * Do altpin switching. Altpin switches DCD and DSR.
-	 * This prolly breaks DSRPACE, so we should be more clever here.
-	 */
-	spin_lock_irqsave(&ch->ch_lock, flags);
-	if (ch->ch_digi.digi_flags & DIGI_ALTPIN) {
-		unsigned char mswap = signals;
-
-		if (mswap & UART_MSR_DDCD) {
-			msignals &= ~UART_MSR_DDCD;
-			msignals |= UART_MSR_DDSR;
-		}
-		if (mswap & UART_MSR_DDSR) {
-			msignals &= ~UART_MSR_DDSR;
-			msignals |= UART_MSR_DDCD;
-		}
-		if (mswap & UART_MSR_DCD) {
-			msignals &= ~UART_MSR_DCD;
-			msignals |= UART_MSR_DSR;
-		}
-		if (mswap & UART_MSR_DSR) {
-			msignals &= ~UART_MSR_DSR;
-			msignals |= UART_MSR_DCD;
-		}
-	}
-	spin_unlock_irqrestore(&ch->ch_lock, flags);
-
-	/*
-	 * Scrub off lower bits. They signify delta's, which I don't
-	 * care about
-	 */
-	signals &= 0xf0;
-
-	spin_lock_irqsave(&ch->ch_lock, flags);
-	if (msignals & UART_MSR_DCD)
-		ch->ch_mistat |= UART_MSR_DCD;
-	else
-		ch->ch_mistat &= ~UART_MSR_DCD;
-
-	if (msignals & UART_MSR_DSR)
-		ch->ch_mistat |= UART_MSR_DSR;
-	else
-		ch->ch_mistat &= ~UART_MSR_DSR;
-
-	if (msignals & UART_MSR_RI)
-		ch->ch_mistat |= UART_MSR_RI;
-	else
-		ch->ch_mistat &= ~UART_MSR_RI;
-
-	if (msignals & UART_MSR_CTS)
-		ch->ch_mistat |= UART_MSR_CTS;
-	else
-		ch->ch_mistat &= ~UART_MSR_CTS;
-	spin_unlock_irqrestore(&ch->ch_lock, flags);
-}
-
-/* Make the UART raise any of the output signals we want up */
-static void cls_assert_modem_signals(struct channel_t *ch)
-{
-	unsigned char out;
-
-	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
-		return;
-
-	out = ch->ch_mostat;
-
-	if (ch->ch_flags & CH_LOOPBACK)
-		out |= UART_MCR_LOOP;
-
-	writeb(out, &ch->ch_cls_uart->mcr);
-
-	/* Give time for the UART to actually drop the signals */
-	udelay(10);
-}
-
 static void cls_send_start_character(struct channel_t *ch)
 {
 	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
@@ -1298,3 +1248,24 @@ static void cls_vpd(struct dgnc_board *brd)
 
 	iounmap(re_map_vpdbase);
 }
+
+struct board_ops dgnc_cls_ops = {
+	.tasklet =			cls_tasklet,
+	.intr =				cls_intr,
+	.uart_init =			cls_uart_init,
+	.uart_off =			cls_uart_off,
+	.drain =			cls_drain,
+	.param =			cls_param,
+	.vpd =				cls_vpd,
+	.assert_modem_signals =		cls_assert_modem_signals,
+	.flush_uart_write =		cls_flush_uart_write,
+	.flush_uart_read =		cls_flush_uart_read,
+	.disable_receiver =		cls_disable_receiver,
+	.enable_receiver =		cls_enable_receiver,
+	.send_break =			cls_send_break,
+	.send_start_character =		cls_send_start_character,
+	.send_stop_character =		cls_send_stop_character,
+	.copy_data_from_queue_to_uart = cls_copy_data_from_queue_to_uart,
+	.get_uart_bytes_left =		cls_get_uart_bytes_left,
+	.send_immediate_char =		cls_send_immediate_char
+};
-- 
1.9.1

