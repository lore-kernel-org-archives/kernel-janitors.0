From: "Denver Gingerich" <denver@ossguy.com>
Date: Thu, 10 May 2007 01:29:14 +0000
Subject: [KJ] [PATCH] fix compiler warning in dd.c
Message-Id: <6defe8840705091829h44b78dc2w44f07c0993469128@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Correct the following compiler warning:
warning: 'device_probe_drivers' defined but not used

Verified that there are no device_probe_drivers() calls in the kernel tree.

Signed-off-by: Denver Gingerich <denver@ossguy.com>

---

--- linux-2.6.21/drivers/base/dd.c.000	2007-05-09 18:56:24.000000000 -0400
+++ linux-2.6.21/drivers/base/dd.c	2007-05-09 20:38:12.000000000 -0400
@@ -207,19 +207,6 @@ static int __device_attach(struct device
 	return driver_probe_device(drv, dev);
 }

-static int device_probe_drivers(void *data)
-{
-	struct device *dev = data;
-	int ret = 0;
-
-	if (dev->bus) {
-		down(&dev->sem);
-		ret = bus_for_each_drv(dev->bus, NULL, dev, __device_attach);
-		up(&dev->sem);
-	}
-	return ret;
-}
-
 /**
  *	device_attach - try to attach device to a driver.
  *	@dev:	device.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
