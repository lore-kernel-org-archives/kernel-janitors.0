From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 25 Mar 2012 19:08:32 +0000
Subject: [PATCH] drivers/usb/misc/usbtest.c: add kfrees
Message-Id: <1332702512-20440-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Free the two previously allocated buffers before exiting the function in an
error case.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/misc/usbtest.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index 959145b..7bd0bfc 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -2276,6 +2276,8 @@ usbtest_probe(struct usb_interface *intf, const struct usb_device_id *id)
 			if (status < 0) {
 				WARNING(dev, "couldn't get endpoints, %d\n",
 						status);
+				kfree(dev->buf);
+				kfree(dev);
 				return status;
 			}
 			/* may find bulk or ISO pipes */

