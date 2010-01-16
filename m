From: Julia Lawall <julia@diku.dk>
Date: Sat, 16 Jan 2010 15:59:51 +0000
Subject: [PATCH 7/9] drivers/usb/serial: Eliminate useless code
Message-Id: <Pine.LNX.4.64.1001161659230.28745@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lonnie Mendez <dignome@gmail.com>, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The variables priv and portdata are initialized twice to the same (side
effect-free) expressions.  Drop one initialization in each case.

A simplified version of the semantic match that finds this problem is:
(http://coccinelle.lip6.fr/)

// <smpl>
@forall@
idexpression *x;
identifier f!=ERR_PTR;
@@

x = f(...)
... when != x
(
x = f(...,<+...x...+>,...)
|
* x = f(...)
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/usb/serial/cypress_m8.c |    1 -
 drivers/usb/serial/sierra.c     |    2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
index 60c2002..9b96c08 100644
--- a/drivers/usb/serial/cypress_m8.c
+++ b/drivers/usb/serial/cypress_m8.c
@@ -687,7 +687,6 @@ static void cypress_dtr_rts(struct usb_serial_port *port, int on)
 {
 	struct cypress_private *priv = usb_get_serial_port_data(port);
 	/* drop dtr and rts */
-	priv = usb_get_serial_port_data(port);
 	spin_lock_irq(&priv->lock);
 	if (on = 0)
 		priv->line_control = 0;
diff --git a/drivers/usb/serial/sierra.c b/drivers/usb/serial/sierra.c
index ac1b644..83a7f49 100644
--- a/drivers/usb/serial/sierra.c
+++ b/drivers/usb/serial/sierra.c
@@ -476,7 +476,7 @@ static void sierra_outdat_callback(struct urb *urb)
 static int sierra_write(struct tty_struct *tty, struct usb_serial_port *port,
 					const unsigned char *buf, int count)
 {
-	struct sierra_port_private *portdata = usb_get_serial_port_data(port);
+	struct sierra_port_private *portdata;
 	struct sierra_intf_private *intfdata;
 	struct usb_serial *serial = port->serial;
 	unsigned long flags;
