From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Jul 2018 10:49:21 +0000
Subject: [PATCH] staging: gdm724x: redundant variables idProduct and idVendor
Message-Id: <20180711104921.30561-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Quytelda Kahja <quytelda@tamalin.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable idProduct and idVendor are being assigned but are never used
hence they are redundant and can be removed.

Cleans up clang warnings:
warning: variable 'idProduct' set but not used [-Wunused-but-set-variable]
warning: variable 'idVendor' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/gdm724x/gdm_usb.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/gdm724x/gdm_usb.c b/drivers/staging/gdm724x/gdm_usb.c
index 0218782d1a08..dc4da66c3695 100644
--- a/drivers/staging/gdm724x/gdm_usb.c
+++ b/drivers/staging/gdm724x/gdm_usb.c
@@ -879,14 +879,9 @@ static void gdm_usb_disconnect(struct usb_interface *intf)
 {
 	struct phy_dev *phy_dev;
 	struct lte_udev *udev;
-	u16 idVendor, idProduct;
 	struct usb_device *usbdev;
 
 	usbdev = interface_to_usbdev(intf);
-
-	idVendor = __le16_to_cpu(usbdev->descriptor.idVendor);
-	idProduct = __le16_to_cpu(usbdev->descriptor.idProduct);
-
 	phy_dev = usb_get_intfdata(intf);
 
 	udev = phy_dev->priv_dev;
-- 
2.17.1

