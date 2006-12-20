From: Tobias Klauser <tklauser@distanz.ch>
Date: Wed, 20 Dec 2006 10:42:12 +0000
Subject: [KJ] [PATCH] USB: Remove unneeded void * casts in idmouse.c
Message-Id: <20061220104212.GA14334@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The patch removes unneeded void * casts for the following (void *) pointers:
- struct file: private_data

The patch also contains some whitespace and coding style cleanups in the
relevant areas.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/usb/misc/idmouse.c |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/idmouse.c b/drivers/usb/misc/idmouse.c
index c941853..15c70bd 100644
--- a/drivers/usb/misc/idmouse.c
+++ b/drivers/usb/misc/idmouse.c
@@ -269,7 +269,7 @@ static int idmouse_release(struct inode *inode, struct file *file)
 	/* prevent a race condition with open() */
 	mutex_lock(&disconnect_mutex);
 
-	dev = (struct usb_idmouse *) file->private_data;
+	dev = file->private_data;
 
 	if (dev = NULL) {
 		mutex_unlock(&disconnect_mutex);
@@ -304,17 +304,15 @@ static int idmouse_release(struct inode *inode, struct file *file)
 static ssize_t idmouse_read(struct file *file, char __user *buffer, size_t count,
 				loff_t * ppos)
 {
-	struct usb_idmouse *dev;
+	struct usb_idmouse *dev = file->private_data;
 	int result;
 
-	dev = (struct usb_idmouse *) file->private_data;
-
 	/* lock this object */
-	down (&dev->sem);
+	down(&dev->sem);
 
 	/* verify that the device wasn't unplugged */
 	if (!dev->present) {
-		up (&dev->sem);
+		up(&dev->sem);
 		return -ENODEV;
 	}
 
-- 
1.4.4.2

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
