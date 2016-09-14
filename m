From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 14:05:03 +0000
Subject: [PATCH 06/11] virtio_console: Rename a jump label in port_fops_open()
Message-Id: <c615cc2d-89e5-65a7-4bc8-8c6c6c7e68e3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <020438b9-a7f8-0050-04c1-43382ba60b75@users.sourceforge.net>
In-Reply-To: <020438b9-a7f8-0050-04c1-43382ba60b75@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: virtualization@lists.linux-foundation.org, Amit Shah <amit.shah@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, Rusty Russell <rusty@rustcorp.com.au>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 14:58:24 +0200

Adjust a jump label according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/virtio_console.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 40b8775..99dc659 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -1058,7 +1058,7 @@ static int port_fops_open(struct inode *inode, struct file *filp)
 	 */
 	if (is_console_port(port)) {
 		ret = -ENXIO;
-		goto out;
+		goto put_ref;
 	}
 
 	/* Allow only one process to open a particular port at a time */
@@ -1066,7 +1066,7 @@ static int port_fops_open(struct inode *inode, struct file *filp)
 	if (port->guest_connected) {
 		spin_unlock_irq(&port->inbuf_lock);
 		ret = -EBUSY;
-		goto out;
+		goto put_ref;
 	}
 
 	port->guest_connected = true;
@@ -1087,7 +1087,7 @@ static int port_fops_open(struct inode *inode, struct file *filp)
 	send_control_msg(filp->private_data, VIRTIO_CONSOLE_PORT_OPEN, 1);
 
 	return 0;
-out:
+ put_ref:
 	kref_put(&port->kref, remove_port);
 	return ret;
 }
-- 
2.10.0

