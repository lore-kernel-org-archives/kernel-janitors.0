From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Jul 2013 06:57:49 +0000
Subject: [patch] staging: frontier: use after free in disconnect()
Message-Id: <20130722065749.GD14617@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

usb_alphatrack_delete() frees "dev" so we can't use it on that path.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/frontier/alphatrack.c b/drivers/staging/frontier/alphatrack.c
index 5590ebf..817f837 100644
--- a/drivers/staging/frontier/alphatrack.c
+++ b/drivers/staging/frontier/alphatrack.c
@@ -827,11 +827,11 @@ static void usb_alphatrack_disconnect(struct usb_interface *intf)
 		mutex_unlock(&dev->mtx);
 		usb_alphatrack_delete(dev);
 	} else {
+		atomic_set(&dev->writes_pending, 0);
 		dev->intf = NULL;
 		mutex_unlock(&dev->mtx);
 	}
 
-	atomic_set(&dev->writes_pending, 0);
 	mutex_unlock(&disconnect_mutex);
 
 	dev_info(&intf->dev, "Alphatrack Surface #%d now disconnected\n",
