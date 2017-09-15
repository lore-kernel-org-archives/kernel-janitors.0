From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Sep 2017 07:51:49 +0000
Subject: [PATCH 4/9] [media] tm6000: One function call less in tm6000_usb_probe() after error detection
Message-Id: <66140cb8-68e4-b891-2313-3c07e54ab3e2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2aade468-5dfd-76ee-f59f-c25864930f61@users.sourceforge.net>
In-Reply-To: <2aade468-5dfd-76ee-f59f-c25864930f61@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, =?UTF-8?Q?David_H=c3=a4rdeman?= <david@hardeman.nu>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Santosh Kumar Singh <kumar.san1093@gmail.com>, Sean Young <sean@mess.org>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 14 Sep 2017 16:11:55 +0200

* Adjust jump targets so that the function "kfree" will be always called
  with a non-null pointer.

* Delete an initialisation for the local variable "dev"
  which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/tm6000/tm6000-cards.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/tm6000/tm6000-cards.c b/drivers/media/usb/tm6000/tm6000-cards.c
index e18632056976..77347541904d 100644
--- a/drivers/media/usb/tm6000/tm6000-cards.c
+++ b/drivers/media/usb/tm6000/tm6000-cards.c
@@ -1184,7 +1184,7 @@ static int tm6000_usb_probe(struct usb_interface *interface,
 			    const struct usb_device_id *id)
 {
 	struct usb_device *usbdev;
-	struct tm6000_core *dev = NULL;
+	struct tm6000_core *dev;
 	int i, rc = 0;
 	int nr = 0;
 	char *speed;
@@ -1194,7 +1194,7 @@ static int tm6000_usb_probe(struct usb_interface *interface,
 	/* Selects the proper interface */
 	rc = usb_set_interface(usbdev, 0, 1);
 	if (rc < 0)
-		goto err;
+		goto report_failure;
 
 	/* Check to see next free device and mark as used */
 	nr = find_first_zero_bit(&tm6000_devused, TM6000_MAXBOARDS);
@@ -1312,8 +1312,7 @@ static int tm6000_usb_probe(struct usb_interface *interface,
 	if (!dev->isoc_in.endp) {
 		printk(KERN_ERR "tm6000: probing error: no IN ISOC endpoint!\n");
 		rc = -ENODEV;
-
-		goto err;
+		goto free_device;
 	}
 
 	/* save our data pointer in this interface device */
@@ -1323,16 +1322,16 @@ static int tm6000_usb_probe(struct usb_interface *interface,
 
 	rc = tm6000_init_dev(dev);
 	if (rc < 0)
-		goto err;
+		goto free_device;
 
 	return 0;
 
-err:
+free_device:
+	kfree(dev);
+report_failure:
 	printk(KERN_ERR "tm6000: Error %d while registering\n", rc);
 
 	clear_bit(nr, &tm6000_devused);
-
-	kfree(dev);
 put_device:
 	usb_put_dev(usbdev);
 	return rc;
-- 
2.14.1

