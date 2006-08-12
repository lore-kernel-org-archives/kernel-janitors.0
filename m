From: Patrik Kullman <patrik@yes.nu>
Date: Sat, 12 Aug 2006 07:52:14 +0000
Subject: [KJ] [PATCH][resend] drivers/char/[ac]*.c: coding style changes
Message-Id: <1155369134.2391.24.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Patch against 2.6.18-rc4 to make drivers/char/{a,c[dops]}*.c apply to CodingStyle

Changed the patch according to the comments by Alexey Dobriyan, dropped the cyclades.c-patch.

Signed-off-by: Patrik Kullman <patrik@yes.nu>
diff -urp linux-2.6.18-rc4/drivers/char/amiserial.c linux-2.6.18-rc4-codingstyle/drivers/char/amiserial.c
--- linux-2.6.18-rc4/drivers/char/amiserial.c	2006-08-06 20:20:11.000000000 +0200
+++ linux-2.6.18-rc4-codingstyle/drivers/char/amiserial.c	2006-08-11 23:48:56.000000000 +0200
@@ -270,10 +270,10 @@ static void receive_chars(struct async_s
 	custom.intreq = IF_RBF;
 	mb();
 
-	if((serdatr & 0x1ff) = 0)
-	    status |= UART_LSR_BI;
-	if(serdatr & SDR_OVRUN)
-	    status |= UART_LSR_OE;
+	if ((serdatr & 0x1ff) = 0)
+		status |= UART_LSR_BI;
+	if (serdatr & SDR_OVRUN)
+		status |= UART_LSR_OE;
 
 	ch = serdatr & 0xff;
 	icount->rx++;
@@ -466,8 +466,8 @@ static irqreturn_t ser_vbl_int( int irq,
 	 * TBD - is it better to unregister from this interrupt or to
 	 * ignore it if MSI is clear ?
 	 */
-	if(info->IER & UART_IER_MSI)
-	  check_modem_status(info);
+	if (info->IER & UART_IER_MSI)
+		check_modem_status(info);
 	return IRQ_HANDLED;
 }
 
@@ -834,8 +834,8 @@ static void change_speed(struct async_st
 
 	/* Enable or disable parity bit */
 
-	if(cval & UART_LCR_PARITY)
-	  serper |= (SERPER_PARENB);
+	if (cval & UART_LCR_PARITY)
+		serper |= (SERPER_PARENB);
 
 	custom.serper = serper;
 	mb();
@@ -1001,12 +1001,12 @@ static void rs_send_xchar(struct tty_str
 
 	        /* Check this ! */
 	        local_irq_save(flags);
-		if(!(custom.intenar & IF_TBE)) {
-		    custom.intena = IF_SETCLR | IF_TBE;
-		    mb();
-		    /* set a pending Tx Interrupt, transmitter should restart now */
-		    custom.intreq = IF_SETCLR | IF_TBE;
-		    mb();
+		if (!(custom.intenar & IF_TBE)) {
+			custom.intena = IF_SETCLR | IF_TBE;
+			mb();
+			/* set a pending Tx Interrupt, transmitter should restart now */
+			custom.intreq = IF_SETCLR | IF_TBE;
+			mb();
 		}
 		local_irq_restore(flags);
 
@@ -1119,8 +1119,8 @@ static int set_serial_info(struct async_
   
 	change_irq = new_serial.irq != state->irq;
 	change_port = (new_serial.port != state->port);
-	if(change_irq || change_port || (new_serial.xmit_fifo_size != state->xmit_fifo_size))
-	  return -EINVAL;
+	if (change_irq || change_port || (new_serial.xmit_fifo_size != state->xmit_fifo_size))
+		return -EINVAL;
   
 	if (!serial_isroot()) {
 		if ((new_serial.baud_base != state->baud_base) ||
@@ -1878,15 +1878,15 @@ static inline int line_info(char *buf, s
 
 	stat_buf[0] = 0;
 	stat_buf[1] = 0;
-	if(!(control & SER_RTS))
+	if (!(control & SER_RTS))
 		strcat(stat_buf, "|RTS");
-	if(!(status & SER_CTS))
+	if (!(status & SER_CTS))
 		strcat(stat_buf, "|CTS");
-	if(!(control & SER_DTR))
+	if (!(control & SER_DTR))
 		strcat(stat_buf, "|DTR");
-	if(!(status & SER_DSR))
+	if (!(status & SER_DSR))
 		strcat(stat_buf, "|DSR");
-	if(!(status & SER_DCD))
+	if (!(status & SER_DCD))
 		strcat(stat_buf, "|CD");
 
 	if (info->quot) {
diff -urp linux-2.6.18-rc4/drivers/char/applicom.c linux-2.6.18-rc4-codingstyle/drivers/char/applicom.c
--- linux-2.6.18-rc4/drivers/char/applicom.c	2006-08-06 20:20:11.000000000 +0200
+++ linux-2.6.18-rc4-codingstyle/drivers/char/applicom.c	2006-08-11 23:50:56.000000000 +0200
@@ -133,10 +133,10 @@ static int ac_register_board(unsigned lo
 {
 	volatile unsigned char byte_reset_it;
 
-	if((readb(loc + CONF_END_TEST)     != 0x00) ||
-	   (readb(loc + CONF_END_TEST + 1) != 0x55) ||
-	   (readb(loc + CONF_END_TEST + 2) != 0xAA) ||
-	   (readb(loc + CONF_END_TEST + 3) != 0xFF))
+	if ((readb(loc + CONF_END_TEST)    != 0x00) ||
+	    (readb(loc + CONF_END_TEST + 1) != 0x55) ||
+	    (readb(loc + CONF_END_TEST + 2) != 0xAA) ||
+	    (readb(loc + CONF_END_TEST + 3) != 0xFF))
 		return 0;
 
 	if (!boardno)
@@ -379,10 +379,10 @@ static ssize_t ac_write(struct file *fil
 		return -EINVAL;
 	}
 
-	if(copy_from_user(&st_loc, buf, sizeof(struct st_ram_io))) 
+	if (copy_from_user(&st_loc, buf, sizeof(struct st_ram_io)))
 		return -EFAULT;
 	
-	if(copy_from_user(&tmpmailbox, &buf[sizeof(struct st_ram_io)],
+	if (copy_from_user(&tmpmailbox, &buf[sizeof(struct st_ram_io)],
 			  sizeof(struct mailbox))) 
 		return -EFAULT;
 
@@ -390,7 +390,7 @@ static ssize_t ac_write(struct file *fil
 	TicCard = st_loc.tic_des_from_pc;	/* tic number to send            */
 	IndexCard = NumCard - 1;
 
-	if((NumCard < 1) || (NumCard > MAX_BOARD) || !apbs[IndexCard].RamIO)
+	if ((NumCard < 1) || (NumCard > MAX_BOARD) || !apbs[IndexCard].RamIO)
 		return -EINVAL;
 
 #ifdef DEBUG
@@ -422,7 +422,7 @@ static ssize_t ac_write(struct file *fil
 	spin_lock_irqsave(&apbs[IndexCard].mutex, flags);
 
 	/* Test octet ready correct */
-	if(readb(apbs[IndexCard].RamIO + DATA_FROM_PC_READY) > 2) { 
+	if (readb(apbs[IndexCard].RamIO + DATA_FROM_PC_READY) > 2) {
 		Dummy = readb(apbs[IndexCard].RamIO + VERS);
 		spin_unlock_irqrestore(&apbs[IndexCard].mutex, flags);
 		printk(KERN_WARNING "APPLICOM driver write error board %d, DataFromPcReady = %d\n",
@@ -639,7 +639,7 @@ static irqreturn_t ac_interrupt(int vec,
 			spin_lock(&apbs[i].mutex);
 
 			/* Skip if this board doesn't want attention */
-			if(readb(apbs[i].RamIO + RAM_IT_TO_PC) = 0) {
+			if (readb(apbs[i].RamIO + RAM_IT_TO_PC) = 0) {
 				spin_unlock(&apbs[i].mutex);
 				continue;
 			}
@@ -654,7 +654,7 @@ static irqreturn_t ac_interrupt(int vec,
 				DeviceErrorCount++;
 			}
 
-			if((readb(apbs[i].RamIO + DATA_FROM_PC_READY) > 2) && 
+			if ((readb(apbs[i].RamIO + DATA_FROM_PC_READY) > 2) &&
 			   (readb(apbs[i].RamIO + DATA_FROM_PC_READY) != 6)) {
 				
 				printk(KERN_WARNING "APPLICOM driver interrupt err board %d, DataFromPcReady = %d\n",
@@ -675,7 +675,7 @@ static irqreturn_t ac_interrupt(int vec,
 			}
 			Dummy = readb(apbs[i].RamIO + VERS);
 
-			if(readb(apbs[i].RamIO + RAM_IT_TO_PC)) {
+			if (readb(apbs[i].RamIO + RAM_IT_TO_PC)) {
 				/* There's another int waiting on this card */
 				spin_unlock(&apbs[i].mutex);
 				i--;
@@ -718,7 +718,7 @@ static int ac_ioctl(struct inode *inode,
 	
 	IndexCard = adgl->num_card-1;
 	 
-	if(cmd != 0 && cmd != 6 &&
+	if (cmd != 0 && cmd != 6 &&
 	   ((IndexCard >= MAX_BOARD) || !apbs[IndexCard].RamIO)) {
 		static int warncount = 10;
 		if (warncount) {
diff -urp linux-2.6.18-rc4/drivers/char/consolemap.c linux-2.6.18-rc4-codingstyle/drivers/char/consolemap.c
--- linux-2.6.18-rc4/drivers/char/consolemap.c	2006-08-06 20:20:11.000000000 +0200
+++ linux-2.6.18-rc4-codingstyle/drivers/char/consolemap.c	2006-08-12 00:27:03.000000000 +0200
@@ -282,11 +282,10 @@ int con_get_trans_old(unsigned char __us
 	if (!access_ok(VERIFY_WRITE, arg, E_TABSZ))
 		return -EFAULT;
 
-	for (i=0; i<E_TABSZ ; i++)
-	  {
-	    ch = conv_uni_to_pc(vc_cons[fg_console].d, p[i]);
-	    __put_user((ch & ~0xff) ? 0 : ch, arg+i);
-	  }
+	for (i = 0; i < E_TABSZ; i++) {
+		ch = conv_uni_to_pc(vc_cons[fg_console].d, p[i]);
+		__put_user((ch & ~0xff) ? 0 : ch, arg+i);
+	}
 	return 0;
 }
 
diff -urp linux-2.6.18-rc4/drivers/char/cs5535_gpio.c linux-2.6.18-rc4-codingstyle/drivers/char/cs5535_gpio.c
--- linux-2.6.18-rc4/drivers/char/cs5535_gpio.c	2006-08-06 20:20:11.000000000 +0200
+++ linux-2.6.18-rc4-codingstyle/drivers/char/cs5535_gpio.c	2006-08-10 14:01:34.000000000 +0200
@@ -59,8 +59,7 @@ struct gpio_regmap {
 	char	on;
 	char	off;
 };
-static struct gpio_regmap rm[] -{
+static struct gpio_regmap rm[] = {
 	{ 0x30, 0x00, '1', '0' },	/* GPIOx_READ_BACK / GPIOx_OUT_VAL */
 	{ 0x20, 0x20, 'I', 'i' },	/* GPIOx_IN_EN */
 	{ 0x04, 0x04, 'O', 'o' },	/* GPIOx_OUT_EN */


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
