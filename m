From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 09 Apr 2016 11:02:28 +0000
Subject: [PATCH] USB: ftdi_sio: constify ftdi_sio_quirk structures
Message-Id: <1460199748-14466-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

The ftdi_sio_quirk structures are never modified, so declare them as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/serial/ftdi_sio.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 3a814e8..0082080 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -93,27 +93,27 @@ static int   ftdi_8u2232c_probe(struct usb_serial *serial);
 static void  ftdi_USB_UIRT_setup(struct ftdi_private *priv);
 static void  ftdi_HE_TIRA1_setup(struct ftdi_private *priv);
 
-static struct ftdi_sio_quirk ftdi_jtag_quirk = {
+static const struct ftdi_sio_quirk ftdi_jtag_quirk = {
 	.probe	= ftdi_jtag_probe,
 };
 
-static struct ftdi_sio_quirk ftdi_NDI_device_quirk = {
+static const struct ftdi_sio_quirk ftdi_NDI_device_quirk = {
 	.probe	= ftdi_NDI_device_setup,
 };
 
-static struct ftdi_sio_quirk ftdi_USB_UIRT_quirk = {
+static const struct ftdi_sio_quirk ftdi_USB_UIRT_quirk = {
 	.port_probe = ftdi_USB_UIRT_setup,
 };
 
-static struct ftdi_sio_quirk ftdi_HE_TIRA1_quirk = {
+static const struct ftdi_sio_quirk ftdi_HE_TIRA1_quirk = {
 	.port_probe = ftdi_HE_TIRA1_setup,
 };
 
-static struct ftdi_sio_quirk ftdi_stmclite_quirk = {
+static const struct ftdi_sio_quirk ftdi_stmclite_quirk = {
 	.probe	= ftdi_stmclite_probe,
 };
 
-static struct ftdi_sio_quirk ftdi_8u2232c_quirk = {
+static const struct ftdi_sio_quirk ftdi_8u2232c_quirk = {
 	.probe	= ftdi_8u2232c_probe,
 };
 
@@ -1775,7 +1775,7 @@ static void remove_sysfs_attrs(struct usb_serial_port *port)
 static int ftdi_sio_probe(struct usb_serial *serial,
 					const struct usb_device_id *id)
 {
-	struct ftdi_sio_quirk *quirk +	const struct ftdi_sio_quirk *quirk  				(struct ftdi_sio_quirk *)id->driver_info;
 
 	if (quirk && quirk->probe) {
@@ -1792,7 +1792,7 @@ static int ftdi_sio_probe(struct usb_serial *serial,
 static int ftdi_sio_port_probe(struct usb_serial_port *port)
 {
 	struct ftdi_private *priv;
-	struct ftdi_sio_quirk *quirk = usb_get_serial_data(port->serial);
+	const struct ftdi_sio_quirk *quirk = usb_get_serial_data(port->serial);
 
 
 	priv = kzalloc(sizeof(struct ftdi_private), GFP_KERNEL);

