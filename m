From: Carlo Perassi <carlo@linux.it>
Date: Thu, 23 Jun 2005 19:36:01 +0000
Subject: [KJ] [PATCH] (2/2) - trailing, 80th and similar things
Message-Id: <20050623193601.GB4790@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26656242192978663=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============26656242192978663==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reading this driver I noticed some trailing whitespaces and tabs so I
removed them with some 80th column fitting and a few more similar
things.

Signed-off-by: Carlo Perassi <carlo@linux.it>
---
 drivers/usb/serial/cypress_m8.c |  216 ++++++++++++++++++++++------------------
 1 files changed, 124 insertions(+), 92 deletions(-)

Index: linux-2.6.12/drivers/usb/serial/cypress_m8.c
===================================================================
--- linux-2.6.12.orig/drivers/usb/serial/cypress_m8.c
+++ linux-2.6.12/drivers/usb/serial/cypress_m8.c
@@ -453,8 +453,8 @@
 	priv->cbr_mask = B300;
 	usb_set_serial_port_data(serial->port[0], priv);
 	
-	return (0);	
-}	
+	return 0;
+}
 
 
 static int cypress_earthmate_startup (struct usb_serial *serial)
@@ -464,14 +464,15 @@
 	dbg("%s", __FUNCTION__);
 
 	if (generic_startup(serial)) {
-		dbg("%s - Failed setting up port %d", __FUNCTION__, serial->port[0]->number);
+		dbg("%s - Failed setting up port %d", __FUNCTION__,
+				serial->port[0]->number);
 		return 1;
 	}
 
 	priv = usb_get_serial_port_data(serial->port[0]);
 	priv->chiptype = CT_EARTHMATE;
-	
-	return (0);	
+
+	return 0;
 } /* cypress_earthmate_startup */
 
 
@@ -482,14 +483,15 @@
 	dbg("%s", __FUNCTION__);
 
 	if (generic_startup(serial)) {
-		dbg("%s - Failed setting up port %d", __FUNCTION__, serial->port[0]->number);
+		dbg("%s - Failed setting up port %d", __FUNCTION__,
+				serial->port[0]->number);
 		return 1;
 	}
 
 	priv = usb_get_serial_port_data(serial->port[0]);
 	priv->chiptype = CT_CYPHIDCOM;
 	
-	return (0);	
+	return 0;
 } /* cypress_hidcom_startup */
 
 
@@ -909,7 +911,8 @@
 } /* cypress_ioctl */
 
 
-static void cypress_set_termios (struct usb_serial_port *port, struct termios *old_termios)
+static void cypress_set_termios (struct usb_serial_port *port,
+		struct termios *old_termios)
 {
 	struct cypress_private *priv = usb_get_serial_port_data(port);
 	struct tty_struct *tty;
@@ -918,7 +921,7 @@
 	unsigned long flags;
 	__u8 oldlines;
 	int linechange = 0;
-	
+
 	dbg("%s - port %d", __FUNCTION__, port->number);
 
 	tty = port->tty;
@@ -931,10 +934,12 @@
 	if (!priv->termios_initialized) {
 		if (priv->chiptype == CT_EARTHMATE) {
 			*(tty->termios) = tty_std_termios;
-			tty->termios->c_cflag = B4800 | CS8 | CREAD | HUPCL | CLOCAL;
+			tty->termios->c_cflag = B4800 | CS8 | CREAD | HUPCL |
+				CLOCAL;
 		} else if (priv->chiptype == CT_CYPHIDCOM) {
 			*(tty->termios) = tty_std_termios;
-			tty->termios->c_cflag = B9600 | CS8 | CREAD | HUPCL | CLOCAL;
+			tty->termios->c_cflag = B9600 | CS8 | CREAD | HUPCL |
+				CLOCAL;
 		}
 		priv->termios_initialized = 1;
 	}
@@ -946,12 +951,15 @@
 	/* check if there are new settings */
 	if (old_termios) {
 		if ((cflag != old_termios->c_cflag) ||
-		    (RELEVANT_IFLAG(iflag) != RELEVANT_IFLAG(old_termios->c_iflag))) {
-			dbg("%s - attempting to set new termios settings", __FUNCTION__);
-			/* should make a copy of this in case something goes wrong in the function, we can restore it */
+			(RELEVANT_IFLAG(iflag) !=
+			 RELEVANT_IFLAG(old_termios->c_iflag))) {
+			dbg("%s - attempting to set new termios settings",
+					__FUNCTION__);
+			/* should make a copy of this in case something goes
+			 * wrong in the function, we can restore it */
 			spin_lock_irqsave(&priv->lock, flags);
 			priv->tmp_termios = *(tty->termios);
-			spin_unlock_irqrestore(&priv->lock, flags); 
+			spin_unlock_irqrestore(&priv->lock, flags);
 		} else {
 			dbg("%s - nothing to do, exiting", __FUNCTION__);
 			return;
@@ -962,11 +970,13 @@
 	/* set number of data bits, parity, stop bits */
 	/* when parity is disabled the parity type bit is ignored */
 
-	stop_bits = cflag & CSTOPB ? 1 : 0; /* 1 means 2 stop bits, 0 means 1 stop bit */
-	
+	/* 1 means 2 stop bits, 0 means 1 stop bit */
+	stop_bits = cflag & CSTOPB ? 1 : 0;
+
 	if (cflag & PARENB) {
 		parity_enable = 1;
-		parity_type = cflag & PARODD ? 1 : 0; /* 1 means odd parity, 0 means even parity */
+		/* 1 means odd parity, 0 means even parity */
+		parity_type = cflag & PARODD ? 1 : 0;
 	} else
 		parity_enable = parity_type = 0;
 
@@ -976,7 +986,8 @@
 			case CS6: data_bits = 1; break;
 			case CS7: data_bits = 2; break;
 			case CS8: data_bits = 3; break;
-			default: err("%s - CSIZE was set, but not CS5-CS8", __FUNCTION__); data_bits = 3;
+			default: err("%s - CSIZE was set, but not CS5-CS8",
+						 __FUNCTION__); data_bits = 3;
 		}
 	} else
 		data_bits = 3;
@@ -991,63 +1002,75 @@
 	} else {
 		baud_mask = (cflag & CBAUD);
 		switch(baud_mask) {
-			case B300: dbg("%s - setting baud 300bps", __FUNCTION__); break;
-			case B600: dbg("%s - setting baud 600bps", __FUNCTION__); break;
-			case B1200: dbg("%s - setting baud 1200bps", __FUNCTION__); break;
-			case B2400: dbg("%s - setting baud 2400bps", __FUNCTION__); break;
-			case B4800: dbg("%s - setting baud 4800bps", __FUNCTION__); break;
-			case B9600: dbg("%s - setting baud 9600bps", __FUNCTION__); break;
-			case B19200: dbg("%s - setting baud 19200bps", __FUNCTION__); break;
-			case B38400: dbg("%s - setting baud 38400bps", __FUNCTION__); break;
-			case B57600: dbg("%s - setting baud 57600bps", __FUNCTION__); break;
-			case B115200: dbg("%s - setting baud 115200bps", __FUNCTION__); break;
-			default: dbg("%s - unknown masked baud rate", __FUNCTION__);
+			case B300: dbg("%s - setting baud 300bps",
+						__FUNCTION__); break;
+			case B600: dbg("%s - setting baud 600bps",
+						__FUNCTION__); break;
+			case B1200: dbg("%s - setting baud 1200bps",
+						__FUNCTION__); break;
+			case B2400: dbg("%s - setting baud 2400bps",
+						__FUNCTION__); break;
+			case B4800: dbg("%s - setting baud 4800bps",
+						__FUNCTION__); break;
+			case B9600: dbg("%s - setting baud 9600bps",
+						__FUNCTION__); break;
+			case B19200: dbg("%s - setting baud 19200bps",
+						__FUNCTION__); break;
+			case B38400: dbg("%s - setting baud 38400bps",
+						__FUNCTION__); break;
+			case B57600: dbg("%s - setting baud 57600bps",
+						__FUNCTION__); break;
+			case B115200: dbg("%s - setting baud 115200bps",
+						__FUNCTION__); break;
+			default: dbg("%s - unknown masked baud rate",
+						__FUNCTION__);
 		}
 		priv->line_control = (CONTROL_DTR | CONTROL_RTS);
 	}
 	spin_unlock_irqrestore(&priv->lock, flags);
 	
-	dbg("%s - sending %d stop_bits, %d parity_enable, %d parity_type, %d data_bits (+5)", __FUNCTION__,
-	    stop_bits, parity_enable, parity_type, data_bits);
-
-	cypress_serial_control(port, baud_mask, data_bits, stop_bits, parity_enable,
-			       parity_type, 0, CYPRESS_SET_CONFIG);
-
-	/* we perform a CYPRESS_GET_CONFIG so that the current settings are filled into the private structure
-         * this should confirm that all is working if it returns what we just set */
+	dbg("%s - sending %d stop_bits, %d parity_enable, %d parity_type, \
+			%d data_bits (+5)", __FUNCTION__, stop_bits,
+			parity_enable, parity_type, data_bits);
+
+	cypress_serial_control(port, baud_mask, data_bits, stop_bits,
+			parity_enable, parity_type, 0, CYPRESS_SET_CONFIG);
+
+	/* we perform a CYPRESS_GET_CONFIG so that the current settings are
+	 * filled into the private structure this should confirm that all is
+	 * working if it returns what we just set */
 	cypress_serial_control(port, 0, 0, 0, 0, 0, 0, CYPRESS_GET_CONFIG);
 
-	/* Here we can define custom tty settings for devices
-         *
-         * the main tty termios flag base comes from empeg.c
-         */
+	/* Here we can define custom tty settings for devices the main tty
+	 * termios flag base comes from empeg.c */
 
-	spin_lock_irqsave(&priv->lock, flags);	
+	spin_lock_irqsave(&priv->lock, flags);
 	if ( (priv->chiptype == CT_EARTHMATE) && (priv->baud_rate == 4800) ) {
-
-		dbg("Using custom termios settings for a baud rate of 4800bps.");
+		dbg("Using custom termios settings for a baud rate of \
+				4800bps.");
 		/* define custom termios settings for NMEA protocol */
 
 		tty->termios->c_iflag /* input modes - */
-			&= ~(IGNBRK		/* disable ignore break */
-			| BRKINT		/* disable break causes interrupt */
-			| PARMRK		/* disable mark parity errors */
-			| ISTRIP		/* disable clear high bit of input characters */
-			| INLCR			/* disable translate NL to CR */
-			| IGNCR			/* disable ignore CR */
-			| ICRNL			/* disable translate CR to NL */
-			| IXON);		/* disable enable XON/XOFF flow control */
-		
+			&= ~(IGNBRK  /* disable ignore break */
+			| BRKINT     /* disable break causes interrupt */
+			| PARMRK     /* disable mark parity errors */
+			| ISTRIP     /* disable clear high bit of input char */
+			| INLCR      /* disable translate NL to CR */
+			| IGNCR      /* disable ignore CR */
+			| ICRNL      /* disable translate CR to NL */
+			| IXON);     /* disable enable XON/XOFF flow control */
+
 		tty->termios->c_oflag /* output modes */
-			&= ~OPOST;		/* disable postprocess output characters */
-		
-		tty->termios->c_lflag /* line discipline modes */
-			&= ~(ECHO 		/* disable echo input characters */
-			| ECHONL		/* disable echo new line */
-			| ICANON		/* disable erase, kill, werase, and rprnt special characters */
-			| ISIG			/* disable interrupt, quit, and suspend special characters */
-			| IEXTEN);		/* disable non-POSIX special characters */
+			&= ~OPOST;    /* disable postprocess output char */
 
+		tty->termios->c_lflag /* line discipline modes */
+			&= ~(ECHO     /* disable echo input characters */
+			| ECHONL      /* disable echo new line */
+			| ICANON      /* disable erase, kill, werase, and rprnt
+					 special characters */
+			| ISIG        /* disable interrupt, quit, and suspend
+					 special characters */
+			| IEXTEN);    /* disable non-POSIX special characters */
 	} /* CT_CYPHIDCOM: Application should handle this for device */
 
 	linechange = (priv->line_control != oldlines);
@@ -1060,7 +1083,7 @@
 	}
 } /* cypress_set_termios */
 
- 
+
 /* returns amount of data still left in soft buffer */
 static int cypress_chars_in_buffer(struct usb_serial_port *port)
 {
@@ -1110,7 +1133,8 @@
 
 		result = usb_submit_urb(port->interrupt_in_urb, GFP_ATOMIC);
 		if (result)
-			dev_err(&port->dev, "%s - failed submitting read urb, error %d\n", __FUNCTION__, result);
+			dev_err(&port->dev, "%s - failed submitting read urb, \
+					error %d\n", __FUNCTION__, result);
 	}
 }
 
@@ -1122,7 +1146,7 @@
 	struct tty_struct *tty;
 	unsigned char *data = urb->transfer_buffer;
 	unsigned long flags;
-	char tty_flag = TTY_NORMAL;	
+	char tty_flag = TTY_NORMAL;
 	int havedata = 0;
 	int bytes = 0;
 	int result;
@@ -1131,7 +1155,8 @@
 	dbg("%s - port %d", __FUNCTION__, port->number);
 
 	if (urb->status) {
-		dbg("%s - nonzero read status received: %d", __FUNCTION__, urb->status);
+		dbg("%s - nonzero read status received: %d", __FUNCTION__,
+				urb->status);
 		return;
 	}
 
@@ -1155,51 +1180,55 @@
 		case 32:
 			/* This is for the CY7C64013... */
 			priv->current_status = data[0] & 0xF8;
-			bytes = data[1]+2;
-			i=2;
+			bytes = data[1] + 2;
+			i = 2;
 			if (bytes > 2)
 				havedata = 1;
 			break;
 		case 8:
 			/* This is for the CY7C63743... */
 			priv->current_status = data[0] & 0xF8;
-			bytes = (data[0] & 0x07)+1;
-			i=1;
+			bytes = (data[0] & 0x07) + 1;
+			i = 1;
 			if (bytes > 1)
 				havedata = 1;
 			break;
 		default:
-			dbg("%s - wrong packet size - received %d bytes", __FUNCTION__, urb->actual_length);
+			dbg("%s - wrong packet size - received %d bytes",
+					__FUNCTION__, urb->actual_length);
 			spin_unlock_irqrestore(&priv->lock, flags);
 			goto continue_read;
 	}
 	spin_unlock_irqrestore(&priv->lock, flags);
 
-	usb_serial_debug_data (debug, &port->dev, __FUNCTION__, urb->actual_length, data);
+	usb_serial_debug_data (debug, &port->dev, __FUNCTION__,
+			urb->actual_length, data);
 
 	spin_lock_irqsave(&priv->lock, flags);
 	/* check to see if status has changed */
 	if (priv != NULL) {
 		if (priv->current_status != priv->prev_status) {
-			priv->diff_status |= priv->current_status ^ priv->prev_status;
+			priv->diff_status |= priv->current_status ^
+				priv->prev_status;
 			wake_up_interruptible(&priv->delta_msr_wait);
 			priv->prev_status = priv->current_status;
 		}
 	}
-	spin_unlock_irqrestore(&priv->lock, flags);	
+	spin_unlock_irqrestore(&priv->lock, flags);
 
-	/* hangup, as defined in acm.c... this might be a bad place for it though */
-	if (tty && !(tty->termios->c_cflag & CLOCAL) && !(priv->current_status & UART_CD)) {
+	/* hangup, as defined in acm.c... this might be a bad place for it
+	 * though */
+	if (tty && !(tty->termios->c_cflag & CLOCAL) &&
+			!(priv->current_status & UART_CD)) {
 		dbg("%s - calling hangup", __FUNCTION__);
 		tty_hangup(tty);
 		goto continue_read;
 	}
 
-	/* There is one error bit... I'm assuming it is a parity error indicator
-	 * as the generic firmware will set this bit to 1 if a parity error occurs.
-	 * I can not find reference to any other error events.
-	 *
-	 */
+	/* There is one error bit... I'm assuming it is a parity error
+	 * indicator as the generic firmware will set this bit to 1 if a
+	 * parity error occurs.
+	 * I can not find reference to any other error events. */
 	spin_lock_irqsave(&priv->lock, flags);
 	if (priv->current_status & CYP_ERROR) {
 		spin_unlock_irqrestore(&priv->lock, flags);
@@ -1211,7 +1240,8 @@
 	/* process read if there is data other than line status */
 	if (tty && (bytes > i)) {
 		for (; i < bytes ; ++i) {
-			dbg("pushing byte number %d - %d - %c",i,data[i],data[i]);
+			dbg("pushing byte number %d - %d - %c", i, data[i],
+					data[i]);
 			if(tty->flip.count >= TTY_FLIPBUF_SIZE) {
 				tty_flip_buffer_push(tty);
 			}
@@ -1221,25 +1251,27 @@
 	}
 
 	spin_lock_irqsave(&priv->lock, flags);
-	priv->bytes_in += bytes;  /* control and status byte(s) are also counted */
+	/* control and status byte(s) are also counted */
+	priv->bytes_in += bytes;
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 continue_read:
-	
-	/* Continue trying to always read... unless the port has closed.  */
+
+	/* Continue trying to always read... unless the port has closed. */
 
 	if (port->open_count > 0) {
 	usb_fill_int_urb(port->interrupt_in_urb, port->serial->dev,
-		usb_rcvintpipe(port->serial->dev, port->interrupt_in_endpointAddress),
-		port->interrupt_in_urb->transfer_buffer,
-		port->interrupt_in_urb->transfer_buffer_length,
-		cypress_read_int_callback, port,
-		interval);
+			usb_rcvintpipe(port->serial->dev,
+				port->interrupt_in_endpointAddress),
+			port->interrupt_in_urb->transfer_buffer,
+			port->interrupt_in_urb->transfer_buffer_length,
+			cypress_read_int_callback, port, interval);
 	result = usb_submit_urb(port->interrupt_in_urb, GFP_ATOMIC);
 	if (result)
-		dev_err(&urb->dev->dev, "%s - failed resubmitting read urb, error %d\n", __FUNCTION__, result);
+		dev_err(&urb->dev->dev, "%s - failed resubmitting read urb, \
+				error %d\n", __FUNCTION__, result);
 	}
-	
+
 	return;
 } /* cypress_read_int_callback */
 


--===============26656242192978663==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26656242192978663==--
