From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Apr 2013 06:33:46 +0000
Subject: [patch 1/2] USB: keyspan: pull in one indent level
Message-Id: <20130404063346.GC6494@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We can remove the "if (urb->actual_length) {" check because checking for
"while (i < urb->actual_length) {" is sufficient.  This lets us pull the
code in one indent level.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/serial/keyspan.c b/drivers/usb/serial/keyspan.c
index 5b912fc..c773ac7 100644
--- a/drivers/usb/serial/keyspan.c
+++ b/drivers/usb/serial/keyspan.c
@@ -712,45 +712,43 @@ static void usa49wg_indat_callback(struct urb *urb)
 	i = 0;
 	len = 0;
 
-	if (urb->actual_length) {
-		while (i < urb->actual_length) {
+	while (i < urb->actual_length) {
 
-			/* Check port number from message*/
-			if (data[i] >= serial->num_ports) {
-				dev_dbg(&urb->dev->dev, "%s - Unexpected port number %d\n",
-					__func__, data[i]);
-				return;
-			}
-			port = serial->port[data[i++]];
-			len = data[i++];
+		/* Check port number from message*/
+		if (data[i] >= serial->num_ports) {
+			dev_dbg(&urb->dev->dev, "%s - Unexpected port number %d\n",
+				__func__, data[i]);
+			return;
+		}
+		port = serial->port[data[i++]];
+		len = data[i++];
 
-			/* 0x80 bit is error flag */
-			if ((data[i] & 0x80) = 0) {
-				/* no error on any byte */
-				i++;
-				for (x = 1; x < len ; ++x)
-					tty_insert_flip_char(&port->port,
-							data[i++], 0);
-			} else {
-				/*
-				 * some bytes had errors, every byte has status
-				 */
-				for (x = 0; x + 1 < len; x += 2) {
-					int stat = data[i], flag = 0;
-					if (stat & RXERROR_OVERRUN)
-						flag |= TTY_OVERRUN;
-					if (stat & RXERROR_FRAMING)
-						flag |= TTY_FRAME;
-					if (stat & RXERROR_PARITY)
-						flag |= TTY_PARITY;
-					/* XXX should handle break (0x10) */
-					tty_insert_flip_char(&port->port,
-							data[i+1], flag);
-					i += 2;
-				}
+		/* 0x80 bit is error flag */
+		if ((data[i] & 0x80) = 0) {
+			/* no error on any byte */
+			i++;
+			for (x = 1; x < len ; ++x)
+				tty_insert_flip_char(&port->port,
+						data[i++], 0);
+		} else {
+			/*
+			 * some bytes had errors, every byte has status
+			 */
+			for (x = 0; x + 1 < len; x += 2) {
+				int stat = data[i], flag = 0;
+				if (stat & RXERROR_OVERRUN)
+					flag |= TTY_OVERRUN;
+				if (stat & RXERROR_FRAMING)
+					flag |= TTY_FRAME;
+				if (stat & RXERROR_PARITY)
+					flag |= TTY_PARITY;
+				/* XXX should handle break (0x10) */
+				tty_insert_flip_char(&port->port, data[i+1],
+						     flag);
+				i += 2;
 			}
-			tty_flip_buffer_push(&port->port);
 		}
+		tty_flip_buffer_push(&port->port);
 	}
 
 	/* Resubmit urb so we continue receiving */
