From: Dan Carpenter <error27@gmail.com>
Date: Fri, 08 Jul 2011 07:21:15 +0000
Subject: [patch] NFC: pn533: use after free in pn533_disconnect()
Message-Id: <20110708072115.GR18655@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lauro Ramos Venancio <lauro.venancio@openbossa.org>
Cc: "John W. Linville" <linville@tuxdriver.com>, Samuel Ortiz <sameo@linux.intel.com>, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

We freed "dev" on the line before.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/nfc/pn533.c b/drivers/nfc/pn533.c
index 0372315..c77e054 100644
--- a/drivers/nfc/pn533.c
+++ b/drivers/nfc/pn533.c
@@ -1596,7 +1596,7 @@ static void pn533_disconnect(struct usb_interface *interface)
 	usb_free_urb(dev->out_urb);
 	kfree(dev);
 
-	nfc_dev_info(&dev->interface->dev, "NXP PN533 NFC device disconnected");
+	nfc_dev_info(&interface->dev, "NXP PN533 NFC device disconnected");
 }
 
 static struct usb_driver pn533_driver = {
