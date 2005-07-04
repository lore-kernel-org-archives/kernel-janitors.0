From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 04 Jul 2005 17:32:51 +0000
Subject: [KJ] [PATCH] drivers/serial/usb-serial: Remove unneeded void * casts
Message-Id: <20050704173251.GA775@mail.nuerscht.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87942283399117738=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============87942283399117738==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Domen Puncer submitted [1] lots of these patches a while ago. I do not
see many of them in Linus' tree. Is there a chance for such patches
being merged or are they just useless?

[1]
http://lists.osdl.org/pipermail/kernel-janitors/2004-December/002640.html

The following patch removes unneeded casts for the following (void *) pointers:
	- tty_struct->driver_data
	- void *private argument of usb_serial_port_softint()

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN -X dontdiff linux-2.6.13-rc1/drivers/usb/serial/usb-serial.c linux-2.6.13-rc1~unneeded_casts/drivers/usb/serial/usb-serial.c
--- linux-2.6.13-rc1/drivers/usb/serial/usb-serial.c	2005-06-30 19:55:20.000000000 +0200
+++ linux-2.6.13-rc1~unneeded_casts/drivers/usb/serial/usb-serial.c	2005-07-02 15:46:17.000000000 +0200
@@ -531,7 +531,7 @@ bailout_kref_put:
 
 static void serial_close(struct tty_struct *tty, struct file * filp)
 {
-	struct usb_serial_port *port = (struct usb_serial_port *) tty->driver_data;
+	struct usb_serial_port *port = tty->driver_data;
 
 	if (!port)
 		return;
@@ -561,7 +561,7 @@ static void serial_close(struct tty_stru
 
 static int serial_write (struct tty_struct * tty, const unsigned char *buf, int count)
 {
-	struct usb_serial_port *port = (struct usb_serial_port *) tty->driver_data;
+	struct usb_serial_port *port = tty->driver_data;
 	int retval = -EINVAL;
 
 	dbg("%s - port %d, %d byte(s)", __FUNCTION__, port->number, count);
@@ -580,7 +580,7 @@ exit:
 
 static int serial_write_room (struct tty_struct *tty) 
 {
-	struct usb_serial_port *port = (struct usb_serial_port *) tty->driver_data;
+	struct usb_serial_port *port = tty->driver_data;
 	int retval = -EINVAL;
 
 	dbg("%s - port %d", __FUNCTION__, port->number);
@@ -599,7 +599,7 @@ exit:
 
 static int serial_chars_in_buffer (struct tty_struct *tty) 
 {
-	struct usb_serial_port *port = (struct usb_serial_port *) tty->driver_data;
+	struct usb_serial_port *port = tty->driver_data;
 	int retval = -EINVAL;
 
 	dbg("%s = port %d", __FUNCTION__, port->number);
@@ -618,7 +618,7 @@ exit:
 
 static void serial_throttle (struct tty_struct * tty)
 {
-	struct usb_serial_port *port = (struct usb_serial_port *) tty->driver_data;
+	struct usb_serial_port *port = tty->driver_data;
 
 	dbg("%s - port %d", __FUNCTION__, port->number);
 
@@ -634,7 +634,7 @@ static void serial_throttle (struct tty_
 
 static void serial_unthrottle (struct tty_struct * tty)
 {
-	struct usb_serial_port *port = (struct usb_serial_port *) tty->driver_data;
+	struct usb_serial_port *port = tty->driver_data;
 
 	dbg("%s - port %d", __FUNCTION__, port->number);
 
@@ -650,7 +650,7 @@ static void serial_unthrottle (struct tt
 
 static int serial_ioctl (struct tty_struct *tty, struct file * file, unsigned int cmd, unsigned long arg)
 {
-	struct usb_serial_port *port = (struct usb_serial_port *) tty->driver_data;
+	struct usb_serial_port *port = tty->driver_data;
 	int retval = -ENODEV;
 
 	dbg("%s - port %d, cmd 0x%.4x", __FUNCTION__, port->number, cmd);
@@ -672,7 +672,7 @@ exit:
 
 static void serial_set_termios (struct tty_struct *tty, struct termios * old)
 {
-	struct usb_serial_port *port = (struct usb_serial_port *) tty->driver_data;
+	struct usb_serial_port *port = tty->driver_data;
 
 	dbg("%s - port %d", __FUNCTION__, port->number);
 
@@ -688,7 +688,7 @@ static void serial_set_termios (struct t
 
 static void serial_break (struct tty_struct *tty, int break_state)
 {
-	struct usb_serial_port *port = (struct usb_serial_port *) tty->driver_data;
+	struct usb_serial_port *port = tty->driver_data;
 
 	dbg("%s - port %d", __FUNCTION__, port->number);
 
@@ -749,7 +749,7 @@ done:
 
 static int serial_tiocmget (struct tty_struct *tty, struct file *file)
 {
-	struct usb_serial_port *port = (struct usb_serial_port *) tty->driver_data;
+	struct usb_serial_port *port = tty->driver_data;
 
 	dbg("%s - port %d", __FUNCTION__, port->number);
 
@@ -768,7 +768,7 @@ exit:
 static int serial_tiocmset (struct tty_struct *tty, struct file *file,
 			    unsigned int set, unsigned int clear)
 {
-	struct usb_serial_port *port = (struct usb_serial_port *) tty->driver_data;
+	struct usb_serial_port *port = tty->driver_data;
 
 	dbg("%s - port %d", __FUNCTION__, port->number);
 
@@ -786,7 +786,7 @@ exit:
 
 void usb_serial_port_softint(void *private)
 {
-	struct usb_serial_port *port = (struct usb_serial_port *)private;
+	struct usb_serial_port *port = private;
 	struct tty_struct *tty;
 
 	dbg("%s - port %d", __FUNCTION__, port->number);

--===============87942283399117738==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87942283399117738==--
