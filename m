From: Patrik Kullman <patrik@yes.nu>
Date: Thu, 10 Aug 2006 18:12:55 +0000
Subject: [KJ] [PATCH] drivers/char/[ac]*.c: coding style changes
Message-Id: <1155233576.2784.9.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Patch against 2.6.18-rc4 to make drivers/char/[ac]*.c apply to CodingStyle

Also to get an ack that I understand the coding style ;)

If this is ACKed I'll probably go recursively through the entire drivers/char/ to make it conform.

Because if this isn't janitoring....

I'll do something else.. ;)

Signed-off-by: Patrik Kullman <patrik@yes.nu>
diff -rup linux-2.6.18-rc4/drivers/char/amiserial.c linux-2.6.18-rc4-codingstyle/drivers/char/amiserial.c
--- linux-2.6.18-rc4/drivers/char/amiserial.c	2006-08-06 20:20:11.000000000 +0200
+++ linux-2.6.18-rc4-codingstyle/drivers/char/amiserial.c	2006-08-10 14:01:34.000000000 +0200
@@ -270,9 +270,9 @@ static void receive_chars(struct async_s
 	custom.intreq = IF_RBF;
 	mb();
 
-	if((serdatr & 0x1ff) = 0)
+	if ((serdatr & 0x1ff) = 0)
 	    status |= UART_LSR_BI;
-	if(serdatr & SDR_OVRUN)
+	if (serdatr & SDR_OVRUN)
 	    status |= UART_LSR_OE;
 
 	ch = serdatr & 0xff;
@@ -466,7 +466,7 @@ static irqreturn_t ser_vbl_int( int irq,
 	 * TBD - is it better to unregister from this interrupt or to
 	 * ignore it if MSI is clear ?
 	 */
-	if(info->IER & UART_IER_MSI)
+	if (info->IER & UART_IER_MSI)
 	  check_modem_status(info);
 	return IRQ_HANDLED;
 }
@@ -834,7 +834,7 @@ static void change_speed(struct async_st
 
 	/* Enable or disable parity bit */
 
-	if(cval & UART_LCR_PARITY)
+	if (cval & UART_LCR_PARITY)
 	  serper |= (SERPER_PARENB);
 
 	custom.serper = serper;
@@ -1001,7 +1001,7 @@ static void rs_send_xchar(struct tty_str
 
 	        /* Check this ! */
 	        local_irq_save(flags);
-		if(!(custom.intenar & IF_TBE)) {
+		if (!(custom.intenar & IF_TBE)) {
 		    custom.intena = IF_SETCLR | IF_TBE;
 		    mb();
 		    /* set a pending Tx Interrupt, transmitter should restart now */
@@ -1119,7 +1119,7 @@ static int set_serial_info(struct async_
   
 	change_irq = new_serial.irq != state->irq;
 	change_port = (new_serial.port != state->port);
-	if(change_irq || change_port || (new_serial.xmit_fifo_size != state->xmit_fifo_size))
+	if (change_irq || change_port || (new_serial.xmit_fifo_size != state->xmit_fifo_size))
 	  return -EINVAL;
   
 	if (!serial_isroot()) {
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
diff -rup linux-2.6.18-rc4/drivers/char/applicom.c linux-2.6.18-rc4-codingstyle/drivers/char/applicom.c
--- linux-2.6.18-rc4/drivers/char/applicom.c	2006-08-06 20:20:11.000000000 +0200
+++ linux-2.6.18-rc4-codingstyle/drivers/char/applicom.c	2006-08-10 20:00:36.000000000 +0200
@@ -133,7 +133,7 @@ static int ac_register_board(unsigned lo
 {
 	volatile unsigned char byte_reset_it;
 
-	if((readb(loc + CONF_END_TEST)     != 0x00) ||
+	if ((readb(loc + CONF_END_TEST)    != 0x00) ||
 	   (readb(loc + CONF_END_TEST + 1) != 0x55) ||
 	   (readb(loc + CONF_END_TEST + 2) != 0xAA) ||
 	   (readb(loc + CONF_END_TEST + 3) != 0xFF))
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
diff -rup linux-2.6.18-rc4/drivers/char/consolemap.c linux-2.6.18-rc4-codingstyle/drivers/char/consolemap.c
--- linux-2.6.18-rc4/drivers/char/consolemap.c	2006-08-06 20:20:11.000000000 +0200
+++ linux-2.6.18-rc4-codingstyle/drivers/char/consolemap.c	2006-08-10 14:01:34.000000000 +0200
@@ -282,11 +282,10 @@ int con_get_trans_old(unsigned char __us
 	if (!access_ok(VERIFY_WRITE, arg, E_TABSZ))
 		return -EFAULT;
 
-	for (i=0; i<E_TABSZ ; i++)
-	  {
+	for (i=0; i<E_TABSZ ; i++) {
 	    ch = conv_uni_to_pc(vc_cons[fg_console].d, p[i]);
 	    __put_user((ch & ~0xff) ? 0 : ch, arg+i);
-	  }
+	}
 	return 0;
 }
 
diff -rup linux-2.6.18-rc4/drivers/char/cs5535_gpio.c linux-2.6.18-rc4-codingstyle/drivers/char/cs5535_gpio.c
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
diff -rup linux-2.6.18-rc4/drivers/char/cyclades.c linux-2.6.18-rc4-codingstyle/drivers/char/cyclades.c
--- linux-2.6.18-rc4/drivers/char/cyclades.c	2006-08-06 20:20:11.000000000 +0200
+++ linux-2.6.18-rc4-codingstyle/drivers/char/cyclades.c	2006-08-10 20:02:24.000000000 +0200
@@ -889,8 +889,8 @@ serial_paranoia_check(struct cyclades_po
         return 1;
     }
 
-    if( (long)info < (long)(&cy_port[0])
-    || (long)(&cy_port[NR_PORTS]) < (long)info ){
+    if ( (long)info < (long)(&cy_port[0])
+    || (long)(&cy_port[NR_PORTS]) < (long)info ) {
         printk(badrange, name, routine);
         return 1;
     }
@@ -1087,7 +1087,7 @@ cyy_interrupt(int irq, void *dev_id, str
   int mdm_change;
   int mdm_status;
   int len;
-    if((cinfo = (struct cyclades_card *)dev_id) = 0){
+    if ((cinfo = (struct cyclades_card *)dev_id) = 0) {
 #ifdef CY_DEBUG_INTERRUPTS
 	printk("cyy_interrupt: spurious interrupt %d\n\r", irq);
 #endif
@@ -1115,7 +1115,7 @@ cyy_interrupt(int irq, void *dev_id, str
                    chips to be checked in a round-robin fashion (after
                    draining each of a bunch (1000) of characters).
                  */
-                if(1000<too_many++){
+                if (1000<too_many++) {
                     break;
                 }
                 if (status & CySRReceive) { /* reception interrupt */
@@ -1133,7 +1133,7 @@ cyy_interrupt(int irq, void *dev_id, str
                     cy_writeb(base_addr+(CyCAR<<index), save_xir);
 
                     /* if there is nowhere to put the data, discard it */
-                    if(info->tty = 0){
+                    if (info->tty = 0) {
                         j = (cy_readb(base_addr+(CyRIVR<<index)) & CyIVRMask);
                         if ( j = CyIVRRxEx ) { /* exception */
                             data = cy_readb(base_addr+(CyRDSR<<index));
@@ -1152,35 +1152,35 @@ cyy_interrupt(int irq, void *dev_id, str
 			    /* For statistics only */
 			    if (data & CyBREAK)
 				info->icount.brk++;
-			    else if(data & CyFRAME)
+			    else if (data & CyFRAME)
 				info->icount.frame++;
-			    else if(data & CyPARITY)
+			    else if (data & CyPARITY)
 				info->icount.parity++;
-			    else if(data & CyOVERRUN)
+			    else if (data & CyOVERRUN)
 				info->icount.overrun++;
 
-                            if(data & info->ignore_status_mask){
+                            if (data & info->ignore_status_mask) {
 				info->icount.rx++;
                                 continue;
                             }
                             if (tty_buffer_request_room(tty, 1)) {
-                                if (data & info->read_status_mask){
-                                    if(data & CyBREAK){
+                                if (data & info->read_status_mask) {
+                                    if (data & CyBREAK) {
                                         tty_insert_flip_char(tty, cy_readb(base_addr+(CyRDSR<<index)), TTY_BREAK);
 					info->icount.rx++;
-                                        if (info->flags & ASYNC_SAK){
+                                        if (info->flags & ASYNC_SAK) {
                                             do_SAK(tty);
                                         }
-                                    }else if(data & CyFRAME){
+                                    } else if (data & CyFRAME) {
                                         tty_insert_flip_char(tty, cy_readb(base_addr+(CyRDSR<<index)), TTY_FRAME);
 					info->icount.rx++;
 					info->idle_stats.frame_errs++;
-                                    }else if(data & CyPARITY){
+                                    } else if (data & CyPARITY) {
 					/* Pieces of seven... */
                                         tty_insert_flip_char(tty, cy_readb(base_addr+(CyRDSR<<index)), TTY_PARITY);
 					info->icount.rx++;
 					info->idle_stats.parity_errs++;
-                                    }else if(data & CyOVERRUN){
+                                    } else if (data & CyOVERRUN) {
                                         tty_insert_flip_char(tty, 0, TTY_OVERRUN);
 					info->icount.rx++;
                                         /* If the flip buffer itself is
@@ -1194,15 +1194,15 @@ cyy_interrupt(int irq, void *dev_id, str
                                     /* a normal read should be done. */
                                     /* }else if(data & CyTIMEOUT){ */
                                     /* }else if(data & CySPECHAR){ */
-                                    }else {
+                                    } else {
 					tty_insert_flip_char(tty, 0, TTY_NORMAL);
 				        info->icount.rx++;
                                     }
-                                }else{
+                                } else {
 				    tty_insert_flip_char(tty, 0, TTY_NORMAL);
 				    info->icount.rx++;
                                 }
-                            }else{
+                            } else {
                                 /* there was a software buffer
 				   overrun and nothing could be
 				   done about it!!! */
@@ -1221,7 +1221,7 @@ cyy_interrupt(int irq, void *dev_id, str
                             info->mon.char_last = char_count;
 #endif
 			    len = tty_buffer_request_room(tty, char_count);
-                            while(len--){
+                            while (len--) {
                                 data = cy_readb(base_addr+(CyRDSR<<index));
 				tty_insert_flip_char(tty, data, TTY_NORMAL);
 				info->idle_stats.recv_bytes++;
@@ -1258,14 +1258,14 @@ cyy_interrupt(int irq, void *dev_id, str
                     cy_writeb(base_addr+(CyCAR<<index), save_xir);
 
                     /* validate the port# (as configured and open) */
-                    if( (i < 0) || (NR_PORTS <= i) ){
+                    if ((i < 0) || (NR_PORTS <= i)) {
                         cy_writeb(base_addr+(CySRER<<index),
                              cy_readb(base_addr+(CySRER<<index)) & ~CyTxRdy);
                         goto txend;
                     }
                     info = &cy_port[i];
                     info->last_active = jiffies;
-                    if(info->tty = 0){
+                    if (info->tty = 0) {
                         cy_writeb(base_addr+(CySRER<<index),
                              cy_readb(base_addr+(CySRER<<index)) & ~CyTxRdy);
                         goto txdone;
@@ -1274,7 +1274,7 @@ cyy_interrupt(int irq, void *dev_id, str
                     /* load the on-chip space for outbound data */
                     char_count = info->xmit_fifo_size;
 
-                    if(info->x_char) { /* send special char */
+                    if (info->x_char) { /* send special char */
                         outch = info->x_char;
                         cy_writeb(base_addr+(CyTDR<<index), outch);
                         char_count--;
@@ -1297,8 +1297,8 @@ cyy_interrupt(int irq, void *dev_id, str
 			}
                     }
 
-                    while (char_count-- > 0){
-			if (!info->xmit_cnt){
+                    while (char_count-- > 0) {
+			if (!info->xmit_cnt) {
 			    if (cy_readb(base_addr+(CySRER<<index))&CyTxMpty) {
 				cy_writeb(base_addr+(CySRER<<index),
 					  cy_readb(base_addr+(CySRER<<index)) &
@@ -1311,13 +1311,13 @@ cyy_interrupt(int irq, void *dev_id, str
 			    }
 			    goto txdone;
 			}
-			if (info->xmit_buf = 0){
+			if (info->xmit_buf = 0) {
                             cy_writeb(base_addr+(CySRER<<index),
 				cy_readb(base_addr+(CySRER<<index)) & 
 					~CyTxRdy);
                             goto txdone;
 			}
-			if (info->tty->stopped || info->tty->hw_stopped){
+			if (info->tty->stopped || info->tty->hw_stopped) {
                             cy_writeb(base_addr+(CySRER<<index),
 				cy_readb(base_addr+(CySRER<<index)) & 
 					~CyTxRdy);
@@ -1335,14 +1335,14 @@ cyy_interrupt(int irq, void *dev_id, str
 			   room for the two chars needed to send a NULL.)
                          */
                         outch = info->xmit_buf[info->xmit_tail];
-                        if( outch ){
+                        if (outch) {
                             info->xmit_cnt--;
                             info->xmit_tail = (info->xmit_tail + 1)
                                                       & (SERIAL_XMIT_SIZE - 1);
                             cy_writeb(base_addr+(CyTDR<<index), outch);
 			    info->icount.tx++;
-                        }else{
-                            if(char_count > 1){
+                        } else {
+                            if (char_count > 1) {
                                 info->xmit_cnt--;
                                 info->xmit_tail = (info->xmit_tail + 1)
 						      & (SERIAL_XMIT_SIZE - 1);
@@ -1351,7 +1351,6 @@ cyy_interrupt(int irq, void *dev_id, str
                                 cy_writeb(base_addr+(CyTDR<<index), 0);
 				info->icount.tx++;
                                 char_count--;
-                            }else{
                             }
                         }
                     }
@@ -1383,9 +1382,9 @@ cyy_interrupt(int irq, void *dev_id, str
                     mdm_change = cy_readb(base_addr+(CyMISR<<index));
                     mdm_status = cy_readb(base_addr+(CyMSVR1<<index));
 
-                    if(info->tty = 0){/* no place for data, ignore it*/
+                    if (info->tty = 0) {/* no place for data, ignore it*/
                         ;
-                    }else{
+                    } else {
 			if (mdm_change & CyANY_DELTA) {
 			    /* For statistics only */
 			    if (mdm_change & CyDCD)	info->icount.dcd++;
@@ -1396,20 +1395,20 @@ cyy_interrupt(int irq, void *dev_id, str
 			    cy_sched_event(info, Cy_EVENT_DELTA_WAKEUP);
 			}
 
-                        if((mdm_change & CyDCD)
-                        && (info->flags & ASYNC_CHECK_CD)){
-                            if(mdm_status & CyDCD){
+                        if ((mdm_change & CyDCD)
+                        && (info->flags & ASYNC_CHECK_CD)) {
+                            if (mdm_status & CyDCD){
                                 cy_sched_event(info,
 				    Cy_EVENT_OPEN_WAKEUP);
-                            }else{
+                            } else {
                                 cy_sched_event(info,
 				    Cy_EVENT_HANGUP);
                             }
                         }
-                        if((mdm_change & CyCTS)
-                        && (info->flags & ASYNC_CTS_FLOW)){
-                            if(info->tty->hw_stopped){
-                                if(mdm_status & CyCTS){
+                        if ((mdm_change & CyCTS)
+                        && (info->flags & ASYNC_CTS_FLOW)) {
+                            if (info->tty->hw_stopped) {
+                                if (mdm_status & CyCTS) {
                                     /* cy_start isn't used
 				         because... !!! */
                                     info->tty->hw_stopped = 0;
@@ -1419,8 +1418,8 @@ cyy_interrupt(int irq, void *dev_id, str
                                     cy_sched_event(info,
 				        Cy_EVENT_WRITE_WAKEUP);
                                 }
-                            }else{
-                                if(!(mdm_status & CyCTS)){
+                            } else {
+                                if (!(mdm_status & CyCTS)) {
                                     /* cy_stop isn't used
 				         because ... !!! */
                                     info->tty->hw_stopped = 1;
@@ -1430,10 +1429,6 @@ cyy_interrupt(int irq, void *dev_id, str
                                 }
                             }
                         }
-                        if(mdm_change & CyDSR){
-                        }
-                        if(mdm_change & CyRI){
-                        }
                     }
                     /* end of service */
                     cy_writeb(base_addr+(CyMIR<<index), 
@@ -1443,7 +1438,7 @@ cyy_interrupt(int irq, void *dev_id, str
                 }
             }          /* end while status != 0 */
         }            /* end loop for chips... */
-    } while(had_work);
+    } while (had_work);
 
    /* clear interrupts */
    spin_lock(&cinfo->card_lock);
@@ -1468,7 +1463,7 @@ cyz_fetch_msg( struct cyclades_card *cin
   unsigned long loc_doorbell;
 
     firm_id = cinfo->base_addr + ID_ADDRESS;
-    if (!ISZLOADED(*cinfo)){
+    if (!ISZLOADED(*cinfo)) {
 	return (-1);
     }
     zfw_ctrl = cinfo->base_addr + (cy_readl(&firm_id->zfwctrl_addr) & 0xfffff);
@@ -1476,7 +1471,7 @@ cyz_fetch_msg( struct cyclades_card *cin
 
     loc_doorbell = cy_readl(&((struct RUNTIME_9060 __iomem *)
                      (cinfo->ctl_addr))->loc_doorbell);
-    if (loc_doorbell){
+    if (loc_doorbell) {
 	*cmd = (char)(0xff & loc_doorbell);
 	*channel = cy_readl(&board_ctrl->fwcmd_channel);
 	*param = (uclong)cy_readl(&board_ctrl->fwcmd_param);
@@ -1498,7 +1493,7 @@ cyz_issue_cmd( struct cyclades_card *cin
   int index;
 
     firm_id = cinfo->base_addr + ID_ADDRESS;
-    if (!ISZLOADED(*cinfo)){
+    if (!ISZLOADED(*cinfo)) {
 	return (-1);
     }
     zfw_ctrl = cinfo->base_addr + (cy_readl(&firm_id->zfwctrl_addr) & 0xfffff);
@@ -1506,8 +1501,8 @@ cyz_issue_cmd( struct cyclades_card *cin
 
     index = 0;
     pci_doorbell = &((struct RUNTIME_9060 __iomem *) (cinfo->ctl_addr))->pci_doorbell;
-    while( (cy_readl(pci_doorbell) & 0xff) != 0){
-        if (index++ = 1000){
+    while ((cy_readl(pci_doorbell) & 0xff) != 0) {
+        if (index++ = 1000) {
 	    return((int)(cy_readl(pci_doorbell) & 0xff));
         }
 	udelay(50L);
@@ -1544,7 +1539,7 @@ cyz_handle_rx(struct cyclades_port *info
     else
 	char_count = rx_put - rx_get + rx_bufsize;
 
-    if ( char_count ) {
+    if (char_count) {
 	info->last_active = jiffies;
 	info->jiffies[1] = jiffies;
 
@@ -1555,16 +1550,16 @@ cyz_handle_rx(struct cyclades_port *info
 	    info->mon.char_max = char_count;
 	info->mon.char_last = char_count;
 #endif
-	if(tty = 0){
+	if (tty = 0) {
 	    /* flush received characters */
 	    new_rx_get = (new_rx_get + char_count) & (rx_bufsize - 1);
 	    info->rflush_count++;
-	}else{
+	} else {
 #ifdef BLOCKMOVE
 	    /* we'd like to use memcpy(t, f, n) and memset(s, c, count)
 	       for performance, but because of buffer boundaries, there
 	       may be several steps to the operation */
-	    while(0 < (small_count = 
+	    while (0 < (small_count  		       min_t(unsigned int, (rx_bufsize - new_rx_get),
 		       min_t(unsigned int, (TTY_FLIPBUF_SIZE - tty->flip.count), char_count))
 		 )) {
@@ -1584,7 +1579,7 @@ cyz_handle_rx(struct cyclades_port *info
 	    }
 #else
 	    len = tty_buffer_request_room(tty, char_count);
-	    while(len--){
+	    while (len--) {
 		data = cy_readb(cinfo->base_addr + rx_bufaddr + new_rx_get);
 		new_rx_get = (new_rx_get + 1) & (rx_bufsize - 1);
 		tty_insert_flip_char(tty, data, TTY_NORMAL);
@@ -1600,7 +1595,7 @@ cyz_handle_rx(struct cyclades_port *info
 		char_count = rx_put - rx_get;
 	    else
 		char_count = rx_put - rx_get + rx_bufsize;
-	    if(char_count >= cy_readl(&buf_ctrl->rx_threshold)) {
+	    if (char_count >= cy_readl(&buf_ctrl->rx_threshold)) {
 		cy_sched_event(info, Cy_EVENT_Z_RX_FULL);
 	    }
 #endif
@@ -1638,13 +1633,13 @@ cyz_handle_tx(struct cyclades_port *info
     else
 	char_count = tx_get - tx_put - 1;
 
-    if ( char_count ) {
+    if (char_count) {
 
-	if( tty = 0 ){
+	if (tty = 0) {
 	    goto ztxdone;
 	}
 
-	if(info->x_char) { /* send special char */
+	if (info->x_char) { /* send special char */
 	    data = info->x_char;
 
 	    cy_writeb((cinfo->base_addr + tx_bufaddr + tx_put), data);
@@ -1656,7 +1651,7 @@ cyz_handle_tx(struct cyclades_port *info
 	    info->jiffies[2] = jiffies;
 	}
 #ifdef BLOCKMOVE
-	while(0 < (small_count = 
+	while (0 < (small_count  		   min_t(unsigned int, (tx_bufsize - tx_put),
 		       min_t(unsigned int, (SERIAL_XMIT_SIZE - info->xmit_tail),
 			   min_t(unsigned int, info->xmit_cnt, char_count))))) {
@@ -1675,7 +1670,7 @@ cyz_handle_tx(struct cyclades_port *info
 	    info->jiffies[2] = jiffies;
 	}
 #else
-	while (info->xmit_cnt && char_count){
+	while (info->xmit_cnt && char_count) {
 	    data = info->xmit_buf[info->xmit_tail];
 	    info->xmit_cnt--;
 	    info->xmit_tail = (info->xmit_tail + 1) & (SERIAL_XMIT_SIZE - 1);
@@ -1721,11 +1716,11 @@ cyz_handle_cmd(struct cyclades_card *cin
     hw_ver = cy_readl(&((struct RUNTIME_9060 __iomem *)(cinfo->ctl_addr))->mail_box_0);
 

-    while(cyz_fetch_msg(cinfo, &channel, &cmd, &param) = 1) {
+    while (cyz_fetch_msg(cinfo, &channel, &cmd, &param) = 1) {
 	special_count = 0;
 	delta_count = 0;
 	info = &cy_port[channel + cinfo->first_line];
-	if((tty = info->tty) = 0) {
+	if ((tty = info->tty) = 0) {
 	    continue;
 	}
 	ch_ctrl = &(zfw_ctrl->ch_ctrl[channel]);
@@ -1750,12 +1745,12 @@ cyz_handle_cmd(struct cyclades_card *cin
 	    case C_CM_MDCD:
 		info->icount.dcd++;
 		delta_count++;
-		if (info->flags & ASYNC_CHECK_CD){
+		if (info->flags & ASYNC_CHECK_CD) {
 		    if ((fw_ver > 241 ? 
 			  ((u_long)param) : 
 			  cy_readl(&ch_ctrl->rs_status)) & C_RS_DCD) {
 			cy_sched_event(info, Cy_EVENT_OPEN_WAKEUP);
-		    }else{
+		    } else {
 			cy_sched_event(info, Cy_EVENT_HANGUP);
 		    }
 		}
@@ -1805,9 +1800,9 @@ cyz_handle_cmd(struct cyclades_card *cin
 	    default:
 		break;
 	}
-	if(delta_count)
+	if (delta_count)
 	    cy_sched_event(info, Cy_EVENT_DELTA_WAKEUP);
-	if(special_count)
+	if (special_count)
 	    tty_schedule_flip(tty);
     }
 }
@@ -1818,7 +1813,7 @@ cyz_interrupt(int irq, void *dev_id, str
 {
   struct cyclades_card *cinfo;
 
-    if((cinfo = (struct cyclades_card *)dev_id) = 0){
+    if ((cinfo = (struct cyclades_card *)dev_id) = 0) {
 #ifdef CY_DEBUG_INTERRUPTS
 	printk("cyz_interrupt: spurious interrupt %d\n\r", irq);
 #endif
@@ -1937,13 +1932,13 @@ startup(struct cyclades_port * info)
 
     CY_LOCK(info, flags);
 
-    if (info->flags & ASYNC_INITIALIZED){
+    if (info->flags & ASYNC_INITIALIZED) {
 	free_page(page);
 	goto errout;
     }
 
-    if (!info->type){
-        if (info->tty){
+    if (!info->type) {
+        if (info->tty) {
             set_bit(TTY_IO_ERROR, &info->tty->flags);
         }
 	free_page(page);
@@ -1994,7 +1989,7 @@ startup(struct cyclades_port * info)
 		cy_readb(base_addr+(CySRER<<index)) | CyRxData);
 	info->flags |= ASYNC_INITIALIZED;
 
-	if (info->tty){
+	if (info->tty) {
 	    clear_bit(TTY_IO_ERROR, &info->tty->flags);
 	}
 	info->xmit_cnt = info->xmit_head = info->xmit_tail = 0;
@@ -2016,7 +2011,7 @@ startup(struct cyclades_port * info)
 	base_addr = cy_card[card].base_addr;
 
         firm_id = base_addr + ID_ADDRESS;
-        if (!ISZLOADED(cy_card[card])){
+        if (!ISZLOADED(cy_card[card])) {
 	    return -ENODEV;
 	}
 
@@ -2055,14 +2050,14 @@ startup(struct cyclades_port * info)
 #endif /* Z_WAKE */
 
 	retval = cyz_issue_cmd(&cy_card[card], channel, C_CM_IOCTL, 0L);
-	if (retval != 0){
+	if (retval != 0) {
 	    printk("cyc:startup(1) retval on ttyC%d was %x\n",
 		   info->line, retval);
 	}
 
 	/* Flush RX buffers before raising DTR and RTS */
 	retval = cyz_issue_cmd(&cy_card[card], channel, C_CM_FLUSH_RX, 0L);
-	if (retval != 0){
+	if (retval != 0) {
 	    printk("cyc:startup(2) retval on ttyC%d was %x\n",
 		   info->line, retval);
 	}
@@ -2073,7 +2068,7 @@ startup(struct cyclades_port * info)
              cy_readl(&ch_ctrl[channel].rs_control) | C_RS_RTS | C_RS_DTR) ;
 	retval = cyz_issue_cmd(&cy_card[info->card],
 	    channel, C_CM_IOCTLM, 0L);
-	if (retval != 0){
+	if (retval != 0) {
 	    printk("cyc:startup(3) retval on ttyC%d was %x\n",
 		   info->line, retval);
 	}
@@ -2084,7 +2079,7 @@ startup(struct cyclades_port * info)
 	/* enable send, recv, modem !!! */
 
 	info->flags |= ASYNC_INITIALIZED;
-	if (info->tty){
+	if (info->tty) {
 	    clear_bit(TTY_IO_ERROR, &info->tty->flags);
 	}
 	info->xmit_cnt = info->xmit_head = info->xmit_tail = 0;
@@ -2134,7 +2129,7 @@ start_xmit( struct cyclades_port *info )
 
 	CY_LOCK(info, flags);
 	    retval = cyz_issue_cmd(&cy_card[card], channel, C_CM_INTBACK, 0L);
-	    if (retval != 0){
+	    if (retval != 0) {
 		printk("cyc:start_xmit retval on ttyC%d was %x\n",
 		       info->line, retval);
 	    }
@@ -2156,7 +2151,7 @@ shutdown(struct cyclades_port * info)
   void __iomem *base_addr;
   int card,chip,channel,index;
 
-    if (!(info->flags & ASYNC_INITIALIZED)){
+    if (!(info->flags & ASYNC_INITIALIZED)) {
         return;
     }
 
@@ -2178,7 +2173,7 @@ shutdown(struct cyclades_port * info)
 	    /* Clear delta_msr_wait queue to avoid mem leaks. */
 	    wake_up_interruptible(&info->delta_msr_wait);
 
-	    if (info->xmit_buf){
+	    if (info->xmit_buf) {
 		unsigned char * temp;
 		temp = info->xmit_buf;
 		info->xmit_buf = NULL;
@@ -2199,7 +2194,7 @@ shutdown(struct cyclades_port * info)
 	     /* it may be appropriate to clear _XMIT at
 	       some later date (after testing)!!! */
 
-	    if (info->tty){
+	    if (info->tty) {
 		set_bit(TTY_IO_ERROR, &info->tty->flags);
 	    }
 	    info->flags &= ~ASYNC_INITIALIZED;
@@ -2228,7 +2223,7 @@ shutdown(struct cyclades_port * info)
 
 	CY_LOCK(info, flags);
 
-	    if (info->xmit_buf){
+	    if (info->xmit_buf) {
 		unsigned char * temp;
 		temp = info->xmit_buf;
 		info->xmit_buf = NULL;
@@ -2241,7 +2236,7 @@ shutdown(struct cyclades_port * info)
                    ~(C_RS_RTS | C_RS_DTR)));
 		retval = cyz_issue_cmd(&cy_card[info->card],
 			channel, C_CM_IOCTLM, 0L);
-		if (retval != 0){
+		if (retval != 0) {
 		    printk("cyc:shutdown retval on ttyC%d was %x\n",
 			   info->line, retval);
 		}
@@ -2250,7 +2245,7 @@ shutdown(struct cyclades_port * info)
 #endif
 	    }
 	    
-	    if (info->tty){
+	    if (info->tty) {
 		set_bit(TTY_IO_ERROR, &info->tty->flags);
 	    }
 	    info->flags &= ~ASYNC_INITIALIZED;
@@ -2337,7 +2332,7 @@ block_til_ready(struct tty_struct *tty, 
 
 	while (1) {
 	    CY_LOCK(info, flags);
-		if ((tty->termios->c_cflag & CBAUD)){
+		if ((tty->termios->c_cflag & CBAUD)) {
 		    cy_writeb(base_addr+(CyCAR<<index), (u_char)channel);
 		    cy_writeb(base_addr+(CyMSVR1<<index), CyRTS);
 		    cy_writeb(base_addr+(CyMSVR2<<index), CyDTR);
@@ -2352,7 +2347,7 @@ block_til_ready(struct tty_struct *tty, 
 
 	    set_current_state(TASK_INTERRUPTIBLE);
 	    if (tty_hung_up_p(filp)
-	    || !(info->flags & ASYNC_INITIALIZED) ){
+	    || !(info->flags & ASYNC_INITIALIZED)) {
 		retval = ((info->flags & ASYNC_HUP_NOTIFY) ? 
 		    -EAGAIN : -ERESTARTSYS);
 		break;
@@ -2387,7 +2382,7 @@ block_til_ready(struct tty_struct *tty, 
 
 	base_addr = cinfo->base_addr;
 	firm_id = base_addr + ID_ADDRESS;
-        if (!ISZLOADED(*cinfo)){
+        if (!ISZLOADED(*cinfo)) {
             current->state = TASK_RUNNING;
 	    remove_wait_queue(&info->open_wait, &wait);
 	    return -EINVAL;
@@ -2398,13 +2393,13 @@ block_til_ready(struct tty_struct *tty, 
 	ch_ctrl = zfw_ctrl->ch_ctrl;
 
 	while (1) {
-	    if ((tty->termios->c_cflag & CBAUD)){
+	    if ((tty->termios->c_cflag & CBAUD)) {
 		cy_writel(&ch_ctrl[channel].rs_control,
 			cy_readl(&ch_ctrl[channel].rs_control) |
 			(C_RS_RTS | C_RS_DTR));
 		retval = cyz_issue_cmd(&cy_card[info->card],
 				       channel, C_CM_IOCTLM, 0L);
-		if (retval != 0){
+		if (retval != 0) {
 		    printk("cyc:block_til_ready retval on ttyC%d was %x\n",
 			   info->line, retval);
 		}
@@ -2415,7 +2410,7 @@ block_til_ready(struct tty_struct *tty, 
 
 	    set_current_state(TASK_INTERRUPTIBLE);
 	    if (tty_hung_up_p(filp)
-	    || !(info->flags & ASYNC_INITIALIZED) ){
+	    || !(info->flags & ASYNC_INITIALIZED)) {
 		retval = ((info->flags & ASYNC_HUP_NOTIFY) ?
 		    -EAGAIN : -ERESTARTSYS);
 		break;
@@ -2438,7 +2433,7 @@ block_til_ready(struct tty_struct *tty, 
     }
     current->state = TASK_RUNNING;
     remove_wait_queue(&info->open_wait, &wait);
-    if (!tty_hung_up_p(filp)){
+    if (!tty_hung_up_p(filp)) {
 	info->count++;
 #ifdef CY_DEBUG_COUNT
 	printk("cyc:block_til_ready (%d): incrementing count to %d\n",
@@ -2464,16 +2459,16 @@ block_til_ready(struct tty_struct *tty, 
 static int
 cy_open(struct tty_struct *tty, struct file * filp)
 {
-  struct cyclades_port  *info;
+  struct cyclades_port *info;
   int retval, line;
   unsigned long page;
 
     line = tty->index;
-    if ((line < 0) || (NR_PORTS <= line)){
+    if ((line < 0) || (NR_PORTS <= line)) {
         return -ENODEV;
     }
     info = &cy_port[line];
-    if (info->line < 0){
+    if (info->line < 0) {
         return -ENODEV;
     }
     
@@ -2489,8 +2484,7 @@ cy_open(struct tty_struct *tty, struct f
 	    if (((ZE_V1 =cy_readl(&((struct RUNTIME_9060 __iomem *)
 		(cinfo->ctl_addr))->mail_box_0)) &&
 		Z_FPGA_CHECK (*cinfo)) &&
-		(ZFIRM_HLT = cy_readl (&firm_id->signature)))
-	    {
+		(ZFIRM_HLT = cy_readl (&firm_id->signature))) {
 		printk ("cyc:Cyclades-Z Error: you need an external power supply for this number of ports.\n\rFirmware halted.\r\n");
 	    } else {
 		printk("cyc:Cyclades-Z firmware not yet loaded\n");
@@ -2516,7 +2510,7 @@ cy_open(struct tty_struct *tty, struct f
 		/* Enable interrupts on the FW */
 		retval = cyz_issue_cmd(cinfo,
 					0, C_CM_IRQ_ENBL, 0L);
-		if (retval != 0){
+		if (retval != 0) {
 		    printk("cyc:IRQ enable retval was %x\n", retval);
 		}
 		cinfo->nports = (int) cy_readl (&board_ctrl->n_channel);
@@ -2533,7 +2527,7 @@ cy_open(struct tty_struct *tty, struct f
 #endif
     tty->driver_data = info;
     info->tty = tty;
-    if (serial_paranoia_check(info, tty->name, "cy_open")){
+    if (serial_paranoia_check(info, tty->name, "cy_open")) {
         return -ENODEV;
     }
 #ifdef CY_DEBUG_OPEN
@@ -2568,7 +2562,7 @@ cy_open(struct tty_struct *tty, struct f
      * Start up serial port
      */
     retval = startup(info);
-    if (retval){
+    if (retval) {
         return retval;
     }
 
@@ -2681,7 +2675,7 @@ cy_close(struct tty_struct *tty, struct 
     printk("cyc:cy_close ttyC%d\n", info->line);
 #endif
 
-    if (!info || serial_paranoia_check(info, tty->name, "cy_close")){
+    if (!info || serial_paranoia_check(info, tty->name, "cy_close")) {
         return;
     }
 
@@ -2763,7 +2757,7 @@ cy_close(struct tty_struct *tty, struct 
 	if (cy_readl(&ch_ctrl[channel].flow_status) != C_FS_TXIDLE) {
 	    retval = cyz_issue_cmd(&cy_card[info->card], channel, 
 				   C_CM_IOCTLW, 0L);
-	    if (retval != 0){
+	    if (retval != 0) {
 		printk("cyc:cy_close retval on ttyC%d was %x\n",
 		       info->line, retval);
 	    }
@@ -2828,7 +2822,7 @@ cy_write(struct tty_struct * tty, const 
     printk("cyc:cy_write ttyC%d\n", info->line); /* */
 #endif
 
-    if (serial_paranoia_check(info, tty->name, "cy_write")){
+    if (serial_paranoia_check(info, tty->name, "cy_write")) {
         return 0;
     }
         
@@ -2934,7 +2928,7 @@ static int
 cy_write_room(struct tty_struct *tty)
 {
   struct cyclades_port *info = (struct cyclades_port *)tty->driver_data;
-  int   ret;
+  int ret;
                                 
 #ifdef CY_DEBUG_IO
     printk("cyc:cy_write_room ttyC%d\n", info->line); /* */
@@ -3047,10 +3041,10 @@ set_line_char(struct cyclades_port * inf
   int   i;
 

-    if (!info->tty || !info->tty->termios){
+    if (!info->tty || !info->tty->termios) {
         return;
     }
-    if (info->line = -1){
+    if (info->line = -1) {
         return;
     }
     cflag = info->tty->termios->c_cflag;
@@ -3139,7 +3133,7 @@ set_line_char(struct cyclades_port * inf
 		      ? info->default_threshold
 		      : baud_cor3[i]); /* receive threshold */
 	info->cor2 = CyETC;
-	switch(cflag & CSIZE){
+	switch (cflag & CSIZE) {
 	case CS5:
 	    info->cor1 = Cy_5_BITS;
 	    break;
@@ -3153,24 +3147,24 @@ set_line_char(struct cyclades_port * inf
 	    info->cor1 = Cy_8_BITS;
 	    break;
 	}
-	if(cflag & CSTOPB){
+	if (cflag & CSTOPB) {
 	    info->cor1 |= Cy_2_STOP;
 	}
-	if (cflag & PARENB){
-	    if (cflag & PARODD){
+	if (cflag & PARENB) {
+	    if (cflag & PARODD) {
 		info->cor1 |= CyPARITY_O;
-	    }else{
+	    } else {
 		info->cor1 |= CyPARITY_E;
 	    }
-	}else{
+	} else {
 	    info->cor1 |= CyPARITY_NONE;
 	}
 	    
 	/* CTS flow control flag */
-	if (cflag & CRTSCTS){
+	if (cflag & CRTSCTS) {
 	    info->flags |= ASYNC_CTS_FLOW;
 	    info->cor2 |= CyCtsAE;
-	}else{
+	} else {
 	    info->flags &= ~ASYNC_CTS_FLOW;
 	    info->cor2 &= ~CyCtsAE;
 	}
@@ -3254,7 +3248,7 @@ set_line_char(struct cyclades_port * inf
 			  CyDSR|CyCTS|CyRI|CyDCD);
 	    }
 
-	    if(i = 0){ /* baud rate is zero, turn off line */
+	    if (i = 0) { /* baud rate is zero, turn off line */
 	        if (info->rtsdtr_inv) {
 			cy_writeb(base_addr+(CyMSVR1<<index), ~CyRTS);
 		} else {
@@ -3266,7 +3260,7 @@ set_line_char(struct cyclades_port * inf
 		    cy_readb(base_addr+(CyMSVR1<<index)),
 		    cy_readb(base_addr+(CyMSVR2<<index)));
 #endif
-	    }else{
+	    } else {
                 if (info->rtsdtr_inv) {
 			cy_writeb(base_addr+(CyMSVR1<<index), CyRTS);
                 } else {
@@ -3280,7 +3274,7 @@ set_line_char(struct cyclades_port * inf
 #endif
 	    }
 
-	    if (info->tty){
+	    if (info->tty) {
 		clear_bit(TTY_IO_ERROR, &info->tty->flags);
 	    }
 	CY_UNLOCK(info, flags);
@@ -3337,28 +3331,28 @@ set_line_char(struct cyclades_port * inf
 	case CS7: cy_writel(&ch_ctrl->comm_data_l , C_DL_CS7); break;
 	case CS8: cy_writel(&ch_ctrl->comm_data_l , C_DL_CS8); break;
 	}
-	if(cflag & CSTOPB){
+	if (cflag & CSTOPB) {
 	    cy_writel(&ch_ctrl->comm_data_l,
                cy_readl(&ch_ctrl->comm_data_l) | C_DL_2STOP);
-	}else{
+	} else {
 	    cy_writel(&ch_ctrl->comm_data_l,
                cy_readl(&ch_ctrl->comm_data_l) | C_DL_1STOP);
 	}
-	if (cflag & PARENB){
-	    if (cflag & PARODD){
+	if (cflag & PARENB) {
+	    if (cflag & PARODD) {
 		cy_writel(&ch_ctrl->comm_parity , C_PR_ODD);
-	    }else{
+	    } else {
 		cy_writel(&ch_ctrl->comm_parity , C_PR_EVEN);
 	    }
-	}else{
+	} else {
 	    cy_writel(&ch_ctrl->comm_parity , C_PR_NONE);
 	}
 
 	/* CTS flow control flag */
-	if (cflag & CRTSCTS){
+	if (cflag & CRTSCTS) {
 	    cy_writel(&ch_ctrl->hw_flow,
                cy_readl(&ch_ctrl->hw_flow) | C_RS_CTS | C_RS_RTS);
-	}else{
+	} else {
 	    cy_writel(&ch_ctrl->hw_flow,
                cy_readl(&ch_ctrl->hw_flow) & ~(C_RS_CTS | C_RS_RTS));
 	}
@@ -3376,25 +3370,25 @@ set_line_char(struct cyclades_port * inf
 	cy_writel(&ch_ctrl->sw_flow, sw_flow);
 
 	retval = cyz_issue_cmd(&cy_card[card], channel, C_CM_IOCTL, 0L);
-	if (retval != 0){
+	if (retval != 0) {
 	    printk("cyc:set_line_char retval on ttyC%d was %x\n",
 		   info->line, retval);
 	}
 
 	/* CD sensitivity */
-	if (cflag & CLOCAL){
+	if (cflag & CLOCAL) {
 	    info->flags &= ~ASYNC_CHECK_CD;
-	}else{
+	} else {
 	    info->flags |= ASYNC_CHECK_CD;
 	}
 
-	if(baud = 0){ /* baud rate is zero, turn off line */
+	if (baud = 0) { /* baud rate is zero, turn off line */
 	    cy_writel(&ch_ctrl->rs_control,
                cy_readl(&ch_ctrl->rs_control) & ~C_RS_DTR);
 #ifdef CY_DEBUG_DTR
 	    printk("cyc:set_line_char dropping Z DTR\n");
 #endif
-	}else{
+	} else {
 	    cy_writel(&ch_ctrl->rs_control,
                cy_readl(&ch_ctrl->rs_control) | C_RS_DTR);
 #ifdef CY_DEBUG_DTR
@@ -3403,12 +3397,12 @@ set_line_char(struct cyclades_port * inf
 	}
 
 	retval = cyz_issue_cmd( &cy_card[card], channel, C_CM_IOCTLM, 0L);
-	if (retval != 0){
+	if (retval != 0) {
 	    printk("cyc:set_line_char(2) retval on ttyC%d was %x\n",
 		   info->line, retval);
 	}
 
-	if (info->tty){
+	if (info->tty) {
 	    clear_bit(TTY_IO_ERROR, &info->tty->flags);
 	}
     }
@@ -3434,7 +3428,7 @@ get_serial_info(struct cyclades_port * i
     tmp.baud_base = info->baud;
     tmp.custom_divisor = info->custom_divisor;
     tmp.hub6 = 0;               /*!!!*/
-    return copy_to_user(retinfo,&tmp,sizeof(*retinfo))?-EFAULT:0;
+    return copy_to_user(retinfo,&tmp,sizeof(*retinfo)) ? -EFAULT : 0;
 } /* get_serial_info */
 

@@ -3476,10 +3470,10 @@ set_serial_info(struct cyclades_port * i
     info->closing_wait = new_serial.closing_wait * HZ/100;
 
 check_and_exit:
-    if (info->flags & ASYNC_INITIALIZED){
+    if (info->flags & ASYNC_INITIALIZED) {
         set_line_char(info);
         return 0;
-    }else{
+    } else {
         return startup(info);
     }
 } /* set_serial_info */
@@ -3567,7 +3561,7 @@ cy_tiocmget(struct tty_struct *tty, stru
     } else {
 	base_addr = cy_card[card].base_addr;
 
-        if (cy_card[card].num_chips != -1){
+        if (cy_card[card].num_chips != -1) {
 	    return -EINVAL;
 	}
 
@@ -3583,7 +3577,7 @@ cy_tiocmget(struct tty_struct *tty, stru
 		    | ((lstatus  & C_RS_RI) ? TIOCM_RNG : 0)
 		    | ((lstatus  & C_RS_DSR) ? TIOCM_DSR : 0)
 		    | ((lstatus  & C_RS_CTS) ? TIOCM_CTS : 0);
-	}else{
+	} else {
 	    result = 0;
 	    return -ENODEV;
 	}
@@ -3618,7 +3612,7 @@ cy_tiocmset(struct tty_struct *tty, stru
 	index = cy_card[card].bus_index;
 	base_addr = cy_card[card].base_addr + (cy_chip_offset[chip]<<index);
 
-	if (set & TIOCM_RTS){
+	if (set & TIOCM_RTS) {
 		CY_LOCK(info, flags);
 	        cy_writeb(base_addr+(CyCAR<<index), (u_char)channel);
                 if (info->rtsdtr_inv) {
@@ -3638,7 +3632,7 @@ cy_tiocmset(struct tty_struct *tty, stru
                 }
 		CY_UNLOCK(info, flags);
 	}
-	if (set & TIOCM_DTR){
+	if (set & TIOCM_DTR) {
 		CY_LOCK(info, flags);
 		cy_writeb(base_addr+(CyCAR<<index), (u_char)channel);
                 if (info->rtsdtr_inv) {
@@ -3680,7 +3674,7 @@ cy_tiocmset(struct tty_struct *tty, stru
 	    board_ctrl = &zfw_ctrl->board_ctrl;
 	    ch_ctrl = zfw_ctrl->ch_ctrl;
 
-	    if (set & TIOCM_RTS){
+	    if (set & TIOCM_RTS) {
 		    CY_LOCK(info, flags);
 		    cy_writel(&ch_ctrl[channel].rs_control,
                        cy_readl(&ch_ctrl[channel].rs_control) | C_RS_RTS);
@@ -3692,7 +3686,7 @@ cy_tiocmset(struct tty_struct *tty, stru
                        cy_readl(&ch_ctrl[channel].rs_control) & ~C_RS_RTS);
 		    CY_UNLOCK(info, flags);
 	    }
-	    if (set & TIOCM_DTR){
+	    if (set & TIOCM_DTR) {
 		    CY_LOCK(info, flags);
 		    cy_writel(&ch_ctrl[channel].rs_control,
                        cy_readl(&ch_ctrl[channel].rs_control) | C_RS_DTR);
@@ -3710,13 +3704,13 @@ cy_tiocmset(struct tty_struct *tty, stru
 #endif
 		    CY_UNLOCK(info, flags);
 	    }
-	}else{
+	} else {
 	    return -ENODEV;
 	}
 	CY_LOCK(info, flags);
         retval = cyz_issue_cmd(&cy_card[info->card],
 				    channel, C_CM_IOCTLM,0L);
-	if (retval != 0){
+	if (retval != 0) {
 	    printk("cyc:set_modem_info retval on ttyC%d was %x\n",
 		   info->line, retval);
 	}
@@ -3789,7 +3783,7 @@ static int
 get_mon_info(struct cyclades_port * info, struct cyclades_monitor __user * mon)
 {
 
-    if(copy_to_user(mon, &info->mon, sizeof(struct cyclades_monitor)))
+    if (copy_to_user(mon, &info->mon, sizeof(struct cyclades_monitor)))
     	return -EFAULT;
     info->mon.int_count  = 0;
     info->mon.char_count = 0;
@@ -4204,7 +4198,7 @@ cy_throttle(struct tty_struct * tty)
            tty->ldisc.chars_in_buffer(tty), info->line);
 #endif
 
-    if (serial_paranoia_check(info, tty->name, "cy_throttle")){
+    if (serial_paranoia_check(info, tty->name, "cy_throttle")) {
             return;
     }
 
@@ -4263,7 +4257,7 @@ cy_unthrottle(struct tty_struct * tty)
            tty->ldisc.chars_in_buffer(tty), info->line);
 #endif
 
-    if (serial_paranoia_check(info, tty->name, "cy_unthrottle")){
+    if (serial_paranoia_check(info, tty->name, "cy_unthrottle")) {
             return;
     }
 
@@ -4465,10 +4459,10 @@ cyy_init_card(void __iomem *true_base_ad
 						/* Cy_ClrIntr is 0x1800 */
     udelay(500L);
 
-    for(chip_number=0; chip_number<CyMAX_CHIPS_PER_CARD; chip_number++){
+    for(chip_number=0; chip_number<CyMAX_CHIPS_PER_CARD; chip_number++) {
         base_addr = true_base_addr + (cy_chip_offset[chip_number]<<index);
         mdelay(1);
-        if(cy_readb(base_addr+(CyCCR<<index)) != 0x00){
+        if (cy_readb(base_addr+(CyCCR<<index)) != 0x00) {
             /*************
             printk(" chip #%d at %#6lx is never idle (CCR != 0)\n",
                chip_number, (unsigned long)base_addr);
@@ -4488,14 +4482,14 @@ cyy_init_card(void __iomem *true_base_ad
         if (chip_number = 4
         && cy_readb(true_base_addr
 	    + (cy_chip_offset[0]<<index)
-	    + (CyGFRCR<<index)) = 0){
+	    + (CyGFRCR<<index)) = 0) {
             return chip_number;
         }
 
         cy_writeb(base_addr+(CyCCR<<index), CyCHIP_RESET);
         mdelay(1);
 
-        if(cy_readb(base_addr+(CyGFRCR<<index)) = 0x00){
+        if (cy_readb(base_addr+(CyGFRCR<<index)) = 0x00) {
             /*
             printk(" chip #%d at %#6lx is not responding ",
                chip_number, (unsigned long)base_addr);
@@ -4503,7 +4497,7 @@ cyy_init_card(void __iomem *true_base_ad
             */
             return chip_number;
         }
-        if((0xf0 & (cy_readb(base_addr+(CyGFRCR<<index)))) != 0x40){
+        if ((0xf0 & (cy_readb(base_addr+(CyGFRCR<<index)))) != 0x40) {
             /*
             printk(" chip #%d at %#6lx is not valid (GFRCR = %#2x)\n",
                chip_number, (unsigned long)base_addr,
@@ -4512,7 +4506,7 @@ cyy_init_card(void __iomem *true_base_ad
             return chip_number;
         }
         cy_writeb(base_addr+(CyGCR<<index), CyCH0_SERIAL);
-        if (cy_readb(base_addr+(CyGFRCR<<index)) >= CD1400_REV_J){
+        if (cy_readb(base_addr+(CyGFRCR<<index)) >= CD1400_REV_J) {
 	    /* It is a CD1400 rev. J or later */
 	    /* Impossible to reach 5ms with this chip. 
 	       Changed to 2ms instead (f = 500 Hz). */
@@ -4552,7 +4546,7 @@ cy_detect_isa(void)
 
 #ifdef MODULE
 	/* Check for module parameters */
-	for(i = 0 ; i < NR_CARDS; i++) {
+	for (i = 0 ; i < NR_CARDS; i++) {
 	    if (maddr[i] || i) {
 		isparam = 1;
 		cy_isa_addresses[i] = maddr[i];
@@ -4591,7 +4585,7 @@ cy_detect_isa(void)
                         continue;
                 }
 
-                if((cy_next_channel+cy_isa_nchan) > NR_PORTS) {
+                if ((cy_next_channel+cy_isa_nchan) > NR_PORTS) {
                         printk("Cyclom-Y/ISA found at 0x%lx ",
                                 (unsigned long) cy_isa_address);
                         printk("but no more channels are available.\n");
@@ -4611,9 +4605,8 @@ cy_detect_isa(void)
                 }
 
                 /* allocate IRQ */
-                if(request_irq(cy_isa_irq, cyy_interrupt,
-				   IRQF_DISABLED, "Cyclom-Y", &cy_card[j]))
-                {
+                if (request_irq(cy_isa_irq, cyy_interrupt,
+				   IRQF_DISABLED, "Cyclom-Y", &cy_card[j])) {
                         printk("Cyclom-Y/ISA found at 0x%lx ",
                                 (unsigned long) cy_isa_address);
                         printk("but could not allocate IRQ#%d.\n",
@@ -4686,8 +4679,8 @@ cy_detect_pci(void)
 
         for (i = 0; i < NR_CARDS; i++) {
                 /* look for a Cyclades card by vendor and device id */
-                while((device_id = cy_pci_dev_id[dev_index]) != 0) {
-                        if((pdev = pci_get_device(PCI_VENDOR_ID_CYCLADES,
+                while ((device_id = cy_pci_dev_id[dev_index]) != 0) {
+                        if ((pdev = pci_get_device(PCI_VENDOR_ID_CYCLADES,
                                         device_id, pdev)) = NULL) {
                                 dev_index++;    /* try next device id */
                         } else {
@@ -4710,7 +4703,7 @@ cy_detect_pci(void)
 		device_id &= ~PCI_DEVICE_ID_MASK;
 
     if ((device_id = PCI_DEVICE_ID_CYCLOM_Y_Lo)
-	   || (device_id = PCI_DEVICE_ID_CYCLOM_Y_Hi)){
+	   || (device_id = PCI_DEVICE_ID_CYCLOM_Y_Hi)) {
 #ifdef CY_PCI_DEBUG
             printk("Cyclom-Y/PCI (bus=0x0%x, pci_id=0x%x, ",
 		pdev->bus->number, pdev->devfn);
@@ -4757,14 +4750,14 @@ cy_detect_pci(void)
 #endif
                 cy_pci_nchan = (unsigned short)(CyPORTS_PER_CHIP * 
                        cyy_init_card(cy_pci_addr2, 1));
-                if(cy_pci_nchan = 0) {
+                if (cy_pci_nchan = 0) {
                         printk("Cyclom-Y PCI host card with ");
                         printk("no Serial-Modules at 0x%lx.\n",
 			    (ulong) cy_pci_phys2);
                         i--;
                         continue;
                 }
-                if((cy_next_channel+cy_pci_nchan) > NR_PORTS) {
+                if ((cy_next_channel+cy_pci_nchan) > NR_PORTS) {
                         printk("Cyclom-Y/PCI found at 0x%lx ",
 			    (ulong) cy_pci_phys2);
                         printk("but no channels are available.\n");
@@ -4784,7 +4777,7 @@ cy_detect_pci(void)
                 }
 
                 /* allocate IRQ */
-                if(request_irq(cy_pci_irq, cyy_interrupt,
+                if (request_irq(cy_pci_irq, cyy_interrupt,
 		        IRQF_SHARED, "Cyclom-Y", &cy_card[j]))
                 {
                         printk("Cyclom-Y/PCI found at 0x%lx ",
@@ -4839,7 +4832,7 @@ cy_detect_pci(void)
 		    cy_pci_nchan, cy_next_channel);
 
                 cy_next_channel += cy_pci_nchan;
-    }else if (device_id = PCI_DEVICE_ID_CYCLOM_Z_Lo){
+    } else if (device_id = PCI_DEVICE_ID_CYCLOM_Z_Lo) {
 	    /* print message */
 		printk("Cyclades-Z/PCI (bus=0x0%x, pci_id=0x%x, ",
 		    pdev->bus->number, pdev->devfn);
@@ -4849,7 +4842,7 @@ cy_detect_pci(void)
 		    (ulong)cy_pci_phys2, (ulong)cy_pci_phys0);
 	    printk("Cyclades-Z/PCI not supported for low addresses\n");
 	    break;
-    }else if (device_id = PCI_DEVICE_ID_CYCLOM_Z_Hi){
+    } else if (device_id = PCI_DEVICE_ID_CYCLOM_Z_Hi) {
 #ifdef CY_PCI_DEBUG
             printk("Cyclades-Z/PCI (bus=0x0%x, pci_id=0x%x, ",
 	        pdev->bus->number, pdev->devfn);
@@ -4941,7 +4934,7 @@ cy_detect_pci(void)
                    be allocated its maximum number of ports. */
                 cy_pci_nchan = 8;
 
-                if((cy_next_channel+cy_pci_nchan) > NR_PORTS) {
+                if ((cy_next_channel+cy_pci_nchan) > NR_PORTS) {
                         printk("Cyclades-8Zo/PCI found at 0x%lx ",
 			    (ulong)cy_pci_phys2);
                         printk("but no channels are available.\n");
@@ -4963,10 +4956,9 @@ cy_detect_pci(void)
 
 #ifdef CONFIG_CYZ_INTR
                 /* allocate IRQ only if board has an IRQ */
-		if( (cy_pci_irq != 0) && (cy_pci_irq != 255) ) {
-		    if(request_irq(cy_pci_irq, cyz_interrupt,
-			IRQF_SHARED, "Cyclades-Z", &cy_card[j]))
-		    {
+		if ((cy_pci_irq != 0) && (cy_pci_irq != 255)) {
+		    if (request_irq(cy_pci_irq, cyz_interrupt,
+			IRQF_SHARED, "Cyclades-Z", &cy_card[j])) {
                         printk("Cyclom-8Zo/PCI found at 0x%lx ",
 			    (ulong) cy_pci_phys2);
                         printk("but could not allocate IRQ%d.\n",
@@ -4991,7 +4983,7 @@ cy_detect_pci(void)
                 /* print message */
 #ifdef CONFIG_CYZ_INTR
 		/* don't report IRQ if board is no IRQ */
-		if( (cy_pci_irq != 0) && (cy_pci_irq != 255) )
+		if ((cy_pci_irq != 0) && (cy_pci_irq != 255))
 		    printk("Cyclades-8Zo/PCI #%d: 0x%lx-0x%lx, IRQ%d, ",
 			j+1,(ulong)cy_pci_phys2,
 			(ulong)(cy_pci_phys2 + CyPCI_Zwin - 1),
@@ -5035,7 +5027,7 @@ cy_detect_pci(void)
                 /* This must be the new Cyclades-Ze/PCI. */
                 cy_pci_nchan = ZE_V1_NPORTS;
 
-                if((cy_next_channel+cy_pci_nchan) > NR_PORTS) {
+                if ((cy_next_channel+cy_pci_nchan) > NR_PORTS) {
                         printk("Cyclades-Ze/PCI found at 0x%lx ",
 			    (ulong)cy_pci_phys2);
                         printk("but no channels are available.\n");
@@ -5057,10 +5049,9 @@ cy_detect_pci(void)
 
 #ifdef CONFIG_CYZ_INTR
                 /* allocate IRQ only if board has an IRQ */
-		if( (cy_pci_irq != 0) && (cy_pci_irq != 255) ) {
-		    if(request_irq(cy_pci_irq, cyz_interrupt,
-			IRQF_SHARED, "Cyclades-Z", &cy_card[j]))
-		    {
+		if ((cy_pci_irq != 0) && (cy_pci_irq != 255)) {
+		    if (request_irq(cy_pci_irq, cyz_interrupt,
+			IRQF_SHARED, "Cyclades-Z", &cy_card[j])) {
                         printk("Cyclom-Ze/PCI found at 0x%lx ",
 			    (ulong) cy_pci_phys2);
                         printk("but could not allocate IRQ%d.\n",
@@ -5084,7 +5075,7 @@ cy_detect_pci(void)
                 /* print message */
 #ifdef CONFIG_CYZ_INTR
 		/* don't report IRQ if board is no IRQ */
-		if( (cy_pci_irq != 0) && (cy_pci_irq != 255) )
+		if ((cy_pci_irq != 0) && (cy_pci_irq != 255))
 		    printk("Cyclades-Ze/PCI #%d: 0x%lx-0x%lx, IRQ%d, ",
 			j+1,(ulong)cy_pci_phys2,
 			(ulong)(cy_pci_phys2 + CyPCI_Ze_win - 1),
@@ -5313,8 +5304,7 @@ cy_init(void)
 		spin_lock_init(&cinfo->card_lock);
                 for (port = cinfo->first_line ;
                      port < cinfo->first_line + nports;
-                     port++)
-                {
+                     port++) {
                     info = &cy_port[port];
                     info->magic = CYCLADES_MAGIC;
                     info->type = PORT_STARTECH;
@@ -5370,14 +5360,13 @@ cy_init(void)
 #endif
                 }
                 continue;
-            }else{ /* Cyclom-Y of some kind*/
+            } else { /* Cyclom-Y of some kind*/
                 index = cinfo->bus_index;
 		spin_lock_init(&cinfo->card_lock);
 		cinfo->nports = CyPORTS_PER_CHIP * cinfo->num_chips;
                 for (port = cinfo->first_line ;
                      port < cinfo->first_line + cinfo->nports ;
-                     port++)
-                {
+                     port++) {
                     info = &cy_port[port];
                     info->magic = CYCLADES_MAGIC;
                     info->type = PORT_CIRRUS;
@@ -5441,7 +5430,7 @@ cy_init(void)
     }
 
 #ifndef CONFIG_CYZ_INTR
-    if (number_z_boards && !cyz_timeron){
+    if (number_z_boards && !cyz_timeron) {
 	cyz_timeron++;
 	cyz_timerlist.expires = jiffies + 1;
 	add_timer(&cyz_timerlist);
@@ -5461,7 +5450,7 @@ cy_cleanup_module(void)
     int i, e1;
 
 #ifndef CONFIG_CYZ_INTR
-    if (cyz_timeron){
+    if (cyz_timeron) {
 	cyz_timeron = 0;
 	del_timer(&cyz_timerlist);
     }


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
