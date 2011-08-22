From: Julia Lawall <julia@diku.dk>
Date: Mon, 22 Aug 2011 14:00:33 +0000
Subject: [PATCH 1/4] drivers/staging/usbip/userspace/libsrc/vhci_driver.c: test the just-initialized value
Message-Id: <1314021636-11528-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Mooney <mfm@muteddisk.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Test the just-initialized value rather than some other one.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier x,y,f!={PTR_ERR,ERR_PTR,ERR_CAST};
statement S;
@@

x = f(...);
(
if (\(x = NULL\|IS_ERR(x)\)) S
|
*if (\(y = NULL\|IS_ERR(y)\))
 { ... when != x
   return ...; }
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/usbip/userspace/libsrc/vhci_driver.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/usbip/userspace/libsrc/vhci_driver.c b/drivers/staging/usbip/userspace/libsrc/vhci_driver.c
index abbc285..2697877 100644
--- a/drivers/staging/usbip/userspace/libsrc/vhci_driver.c
+++ b/drivers/staging/usbip/userspace/libsrc/vhci_driver.c
@@ -133,7 +133,7 @@ static int check_usbip_device(struct sysfs_class_device *cdev)
 			     strlen(vhci_driver->hc_device->path))) {
 			/* found usbip device */
 			usbip_cdev = calloc(1, sizeof(*usbip_cdev));
-			if (!cdev) {
+			if (!usbip_cdev) {
 				dbg("calloc failed");
 				return -1;
 			}

