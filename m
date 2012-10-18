From: Johan Hovold <jhovold@gmail.com>
Date: Thu, 18 Oct 2012 08:52:17 +0000
Subject: [PATCH] USB: iuu_phoenix: fix sysfs-attribute creation
Message-Id: <1350550337-10491-1-git-send-email-jhovold@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Make sure sysfs attributes are created at port probe.

A recent patch ("USB: iuu_phoenix: fix port-data memory leak") removed
the sysfs-attribute creation by mistake.

Reported-by: Yuanhan Liu <yuanhan.liu@intel.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Johan Hovold <jhovold@gmail.com>
---

Hi Yuanhan,

Thanks for catching this.

Johan


 drivers/usb/serial/iuu_phoenix.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
index 959f71e..cd5533e 100644
--- a/drivers/usb/serial/iuu_phoenix.c
+++ b/drivers/usb/serial/iuu_phoenix.c
@@ -53,6 +53,8 @@ static int iuu_cardout;
 static bool xmas;
 static int vcc_default = 5;
 
+static int iuu_create_sysfs_attrs(struct usb_serial_port *port);
+static int iuu_remove_sysfs_attrs(struct usb_serial_port *port);
 static void read_rxcmd_callback(struct urb *urb);
 
 struct iuu_private {
@@ -75,6 +77,7 @@ struct iuu_private {
 static int iuu_port_probe(struct usb_serial_port *port)
 {
 	struct iuu_private *priv;
+	int ret;
 
 	priv = kzalloc(sizeof(struct iuu_private), GFP_KERNEL);
 	if (!priv)
@@ -99,6 +102,14 @@ static int iuu_port_probe(struct usb_serial_port *port)
 
 	usb_set_serial_port_data(port, priv);
 
+	ret = iuu_create_sysfs_attrs(port);
+	if (ret) {
+		kfree(priv->writebuf);
+		kfree(priv->buf);
+		kfree(priv);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -106,6 +117,7 @@ static int iuu_port_remove(struct usb_serial_port *port)
 {
 	struct iuu_private *priv = usb_get_serial_port_data(port);
 
+	iuu_remove_sysfs_attrs(port);
 	kfree(priv->writebuf);
 	kfree(priv->buf);
 	kfree(priv);
@@ -1197,8 +1209,6 @@ static struct usb_serial_driver iuu_device = {
 	.num_ports = 1,
 	.bulk_in_size = 512,
 	.bulk_out_size = 512,
-	.port_probe = iuu_create_sysfs_attrs,
-	.port_remove = iuu_remove_sysfs_attrs,
 	.open = iuu_open,
 	.close = iuu_close,
 	.write = iuu_uart_write,
-- 
1.7.12.3

