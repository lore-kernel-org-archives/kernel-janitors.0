From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 04 Oct 2018 02:54:52 +0000
Subject: [PATCH v2 -next] USB: core: remove set but not used variable 'udev'
Message-Id: <1538622372-6467-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Drake <drake@endlessm.com>, Joe Perches <joe@perches.com>, Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@linux.intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Martin Liu <liumartin@google.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/usb/core/driver.c: In function 'usb_driver_claim_interface':
drivers/usb/core/driver.c:513:21: warning:
 variable 'udev' set but not used [-Wunused-but-set-variable]

Since commit c183813fcee44a24 ("USB: remove LPM management from 
usb_driver_claim_interface()"), 'udev' is not used.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
v2: add fixes commit info
---
 drivers/usb/core/driver.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index a1f225f..5356438 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -510,7 +510,6 @@ int usb_driver_claim_interface(struct usb_driver *driver,
 				struct usb_interface *iface, void *priv)
 {
 	struct device *dev;
-	struct usb_device *udev;
 	int retval = 0;
 
 	if (!iface)
@@ -524,8 +523,6 @@ int usb_driver_claim_interface(struct usb_driver *driver,
 	if (!iface->authorized)
 		return -ENODEV;
 
-	udev = interface_to_usbdev(iface);
-
 	dev->driver = &driver->drvwrap.driver;
 	usb_set_intfdata(iface, priv);
 	iface->needs_binding = 0;
