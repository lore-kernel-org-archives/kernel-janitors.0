From: Domen Puncer <domen@coderock.org>
Date: Sat, 17 Jan 2004 13:43:47 +0000
Subject: [Kernel-janitors] [patch 2.6.1] mcfserial, remove some casts
Message-Id: <200401171443.48177.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi.

To be aplied on top of CONFIG_LEDMAN and verify_area patches.

(unsigned int) mcf_serial->addr is very often casted to (unsigned char *), so
i changed it's type.
It's pointer to memory mapped I/O, but that's not a problem, or is it?

- receive_chars() only uses first parameter, so i removed others.
- s/_INLINE_/inline/.
- Named struct initializers for mcfrs_table[].


	Domen

diff -pruNX dontdiff c/drivers/serial/mcfserial.c a/drivers/serial/mcfserial.c
--- c/drivers/serial/mcfserial.c	2004-01-17 14:04:16.000000000 +0100
+++ a/drivers/serial/mcfserial.c	2004-01-17 14:30:15.000000000 +0100
@@ -81,8 +81,6 @@ static struct tty_driver *mcfrs_serial_d
 #undef SERIAL_DEBUG_OPEN
 #undef SERIAL_DEBUG_FLOW
 
-#define _INLINE_ inline
-
 #ifdef CONFIG_M5282
 #define	IRQBASE	77
 #else
@@ -93,8 +91,18 @@ static struct tty_driver *mcfrs_serial_d
  *	Configuration table, UARTs to look for at startup.
  */
 static struct mcf_serial mcfrs_table[] = {
-  { 0, (MCF_MBAR+MCFUART_BASE1), IRQBASE,   ASYNC_BOOT_AUTOCONF },  /* ttyS0 */
-  { 0, (MCF_MBAR+MCFUART_BASE2), IRQBASE+1, ASYNC_BOOT_AUTOCONF },  /* ttyS1 */
+	{  /* ttyS0 */
+		.magic = 0,
+		.addr = (volatile unsigned char *) (MCF_MBAR+MCFUART_BASE1),
+		.irq = IRQBASE,
+		.flags = ASYNC_BOOT_AUTOCONF,
+	},
+	{  /* ttyS1 */
+		.magic = 0,
+		.addr = (volatile unsigned char *) (MCF_MBAR+MCFUART_BASE2),
+		.irq = IRQBASE+1,
+		.flags = ASYNC_BOOT_AUTOCONF,
+	},
 };
 
 
@@ -141,9 +149,9 @@ static inline int serial_paranoia_check(
 					char *name, const char *routine)
 {
 #ifdef SERIAL_PARANOIA_CHECK
-	static const char *badmagic +	static const char badmagic[]  		"MCFRS(warning): bad magic number for serial struct %s in %s\n";
-	static const char *badinfo +	static const char badinfo[]  		"MCFRS(warning): null mcf_serial for %s in %s\n";
 
 	if (!info) {
@@ -181,7 +189,7 @@ static void mcfrs_setsignals(struct mcf_
 #endif
 	}
 	if (rts >= 0) {
-		uartp = (volatile unsigned char *) info->addr;
+		uartp = info->addr;
 		if (rts) {
 			info->sigs |= TIOCM_RTS;
 			uartp[MCFUART_UOP1] = MCFUART_UOP_RTS;
@@ -211,7 +219,7 @@ static int mcfrs_getsignals(struct mcf_s
 #endif
 
 	local_irq_save(flags);
-	uartp = (volatile unsigned char *) info->addr;
+	uartp = info->addr;
 	sigs = (uartp[MCFUART_UIPR] & MCFUART_UIPR_CTS) ? 0 : TIOCM_CTS;
 	sigs |= (info->sigs & TIOCM_RTS);
 
@@ -251,7 +259,7 @@ static void mcfrs_stop(struct tty_struct
 		return;
 	
 	local_irq_save(flags);
-	uartp = (volatile unsigned char *) info->addr;
+	uartp = info->addr;
 	info->imr &= ~MCFUART_UIR_TXREADY;
 	uartp[MCFUART_UIMR] = info->imr;
 	local_irq_restore(flags);
@@ -268,7 +276,7 @@ static void mcfrs_start(struct tty_struc
 
 	local_irq_save(flags);
 	if (info->xmit_cnt && info->xmit_buf) {
-		uartp = (volatile unsigned char *) info->addr;
+		uartp = info->addr;
 		info->imr |= MCFUART_UIR_TXREADY;
 		uartp[MCFUART_UIMR] = info->imr;
 	}
@@ -296,7 +304,7 @@ static void mcfrs_start(struct tty_struc
  * -----------------------------------------------------------------------
  */
 
-static _INLINE_ void receive_chars(struct mcf_serial *info, struct pt_regs *regs, unsigned short rx)
+static inline void receive_chars(struct mcf_serial *info)
 {
 	volatile unsigned char	*uartp;
 	struct tty_struct	*tty = info->tty;
@@ -305,7 +313,7 @@ static _INLINE_ void receive_chars(struc
 	if (!tty)
 		return;
 
-	uartp = (volatile unsigned char *) info->addr;
+	uartp = info->addr;
 
 	while ((status = uartp[MCFUART_USR]) & MCFUART_USR_RXREADY) {
 
@@ -347,11 +355,11 @@ static _INLINE_ void receive_chars(struc
 	return;
 }
 
-static _INLINE_ void transmit_chars(struct mcf_serial *info)
+static inline void transmit_chars(struct mcf_serial *info)
 {
 	volatile unsigned char	*uartp;
 
-	uartp = (volatile unsigned char *) info->addr;
+	uartp = info->addr;
 
 	if (info->x_char) {
 		/* Send special char - probably flow control */
@@ -388,10 +396,10 @@ irqreturn_t mcfrs_interrupt(int irq, voi
 	unsigned char		isr;
 
 	info = &mcfrs_table[(irq - IRQBASE)];
-	isr = (((volatile unsigned char *)info->addr)[MCFUART_UISR]) & info->imr;
+	isr = info->addr[MCFUART_UISR] & info->imr;
 
 	if (isr & MCFUART_UIR_RXREADY)
-		receive_chars(info, regs, isr);
+		receive_chars(info);
 	if (isr & MCFUART_UIR_TXREADY)
 		transmit_chars(info);
 	return IRQ_HANDLED;
@@ -514,7 +522,7 @@ static int startup(struct mcf_serial * i
 	/*
 	 *	Reset UART, get it into known state...
 	 */
-	uartp = (volatile unsigned char *) info->addr;
+	uartp = info->addr;
 	uartp[MCFUART_UCR] = MCFUART_UCR_CMDRESETRX;  /* reset RX */
 	uartp[MCFUART_UCR] = MCFUART_UCR_CMDRESETTX;  /* reset TX */
 	mcfrs_setsignals(info, 1, 1);
@@ -560,7 +568,7 @@ static void shutdown(struct mcf_serial *
 	
 	local_irq_save(flags);
 
-	uartp = (volatile unsigned char *) info->addr;
+	uartp = info->addr;
 	uartp[MCFUART_UIMR] = 0;  /* mask all interrupts */
 	uartp[MCFUART_UCR] = MCFUART_UCR_CMDRESETRX;  /* reset RX */
 	uartp[MCFUART_UCR] = MCFUART_UCR_CMDRESETTX;  /* reset TX */
@@ -660,7 +668,7 @@ static void mcfrs_change_speed(struct mc
 	else
 		info->flags |= ASYNC_CHECK_CD;
 
-	uartp = (volatile unsigned char *) info->addr;
+	uartp = info->addr;
 
 	local_irq_save(flags);
 #if 0
@@ -701,7 +709,7 @@ static void mcfrs_flush_chars(struct tty
 
 	/* Enable transmitter */
 	local_irq_save(flags);
-	uartp = (volatile unsigned char *) info->addr;
+	uartp = info->addr;
 	info->imr |= MCFUART_UIR_TXREADY;
 	uartp[MCFUART_UIMR] = info->imr;
 	local_irq_restore(flags);
@@ -759,7 +767,7 @@ static int mcfrs_write(struct tty_struct
 	}
 
 	local_irq_disable();
-	uartp = (volatile unsigned char *) info->addr;
+	uartp = info->addr;
 	info->imr |= MCFUART_UIR_TXREADY;
 	uartp[MCFUART_UIMR] = info->imr;
 	local_irq_restore(flags);
@@ -873,7 +881,7 @@ static int get_serial_info(struct mcf_se
 	memset(&tmp, 0, sizeof(tmp));
 	tmp.type = info->type;
 	tmp.line = info->line;
-	tmp.port = info->addr;
+	tmp.port = (unsigned int) info->addr;
 	tmp.irq = info->irq;
 	tmp.flags = info->flags;
 	tmp.baud_base = info->baud_base;
@@ -946,7 +954,7 @@ static int get_lsr_info(struct mcf_seria
 	unsigned char		status;
 
 	local_irq_save(flags);
-	uartp = (volatile unsigned char *) info->addr;
+	uartp = info->addr;
 	status = (uartp[MCFUART_USR] & MCFUART_USR_TXEMPTY) ? TIOCSER_TEMT : 0;
 	local_irq_restore(flags);
 
@@ -964,7 +972,7 @@ static void send_break(	struct mcf_seria
 	if (!info->addr)
 		return;
 	current->state = TASK_INTERRUPTIBLE;
-	uartp = (volatile unsigned char *) info->addr;
+	uartp = info->addr;
 
 	local_irq_save(flags);
 	uartp[MCFUART_UCR] = MCFUART_UCR_CMDBREAKSTART;
@@ -1165,7 +1173,7 @@ static void mcfrs_close(struct tty_struc
 	 * line status register.
 	 */
 	info->imr &= ~MCFUART_UIR_RXREADY;
-	uartp = (volatile unsigned char *) info->addr;
+	uartp = info->addr;
 	uartp[MCFUART_UIMR] = info->imr;
 
 #if 0
@@ -1378,7 +1386,7 @@ static void mcfrs_irqinit(struct mcf_ser
 	volatile unsigned long	*portp;
 	volatile unsigned char	*uartp;
 
-	uartp = (volatile unsigned char *) info->addr;
+	uartp = info->addr;
 	icrp = (volatile unsigned long *) (MCF_MBAR + MCFSIM_ICR2);
 
 	switch (info->line) {
@@ -1403,7 +1411,7 @@ static void mcfrs_irqinit(struct mcf_ser
 	volatile unsigned char *icrp, *uartp;
 	volatile unsigned long *imrp;
 
-	uartp = (volatile unsigned char *) info->addr;
+	uartp = info->addr;
 
 	icrp = (volatile unsigned char *) (MCF_MBAR + MCFICM_INTC0 +
 		MCFINTC_ICR0 + MCFINT_UART0 + info->line);
@@ -1434,7 +1442,7 @@ static void mcfrs_irqinit(struct mcf_ser
 		return;
 	}
 
-	uartp = (volatile unsigned char *) info->addr;
+	uartp = info->addr;
 	uartp[MCFUART_UIVR] = info->irq;
 #endif
 
diff -pruNX dontdiff c/drivers/serial/mcfserial.h a/drivers/serial/mcfserial.h
--- c/drivers/serial/mcfserial.h	2003-12-18 03:58:08.000000000 +0100
+++ a/drivers/serial/mcfserial.h	2004-01-17 14:03:50.000000000 +0100
@@ -40,7 +40,7 @@ struct mcf_stats {
 
 struct mcf_serial {
 	int			magic;
-	unsigned int		addr;		/* UART memory address */
+	volatile unsigned char	*addr;		/* UART memory address */
 	int			irq;
 	int			flags; 		/* defined in tty.h */
 	int			type; 		/* UART type */

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
