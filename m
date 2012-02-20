From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Mon, 20 Feb 2012 03:26:05 +0000
Subject: [PATCH] Staging: usbip: Remove commented code.
Message-Id: <1329707645-25978-1-git-send-email-santoshprasadnayak@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mfm@muteddisk.com
Cc: dan.carpenter@oracle.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, santosh.iitg@gmail.com, Santosh Nayak <santoshprasadnayak@gmail.com>

From: Santosh Nayak  <santoshprasadnayak@gmail.com>

Remove commented code of old style lock initilization

Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
---
 drivers/staging/usbip/stub_dev.c |    2 --
 drivers/staging/usbip/vhci_hcd.c |    2 --
 2 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/usbip/stub_dev.c b/drivers/staging/usbip/stub_dev.c
index 03420e2..fa870e3 100644
--- a/drivers/staging/usbip/stub_dev.c
+++ b/drivers/staging/usbip/stub_dev.c
@@ -297,7 +297,6 @@ static struct stub_device *stub_device_alloc(struct usb_device *udev,
 	sdev->devid		= (busnum << 16) | devnum;
 	sdev->ud.side		= USBIP_STUB;
 	sdev->ud.status		= SDEV_ST_AVAILABLE;
-	/* sdev->ud.lock = SPIN_LOCK_UNLOCKED; */
 	spin_lock_init(&sdev->ud.lock);
 	sdev->ud.tcp_socket	= NULL;
 
@@ -306,7 +305,6 @@ static struct stub_device *stub_device_alloc(struct usb_device *udev,
 	INIT_LIST_HEAD(&sdev->priv_free);
 	INIT_LIST_HEAD(&sdev->unlink_free);
 	INIT_LIST_HEAD(&sdev->unlink_tx);
-	/* sdev->priv_lock = SPIN_LOCK_UNLOCKED; */
 	spin_lock_init(&sdev->priv_lock);
 
 	init_waitqueue_head(&sdev->tx_waitq);
diff --git a/drivers/staging/usbip/vhci_hcd.c b/drivers/staging/usbip/vhci_hcd.c
index 8d96ab0..dca9bf1 100644
--- a/drivers/staging/usbip/vhci_hcd.c
+++ b/drivers/staging/usbip/vhci_hcd.c
@@ -895,14 +895,12 @@ static void vhci_device_init(struct vhci_device *vdev)
 
 	vdev->ud.side   = USBIP_VHCI;
 	vdev->ud.status = VDEV_ST_NULL;
-	/* vdev->ud.lock   = SPIN_LOCK_UNLOCKED; */
 	spin_lock_init(&vdev->ud.lock);
 
 	INIT_LIST_HEAD(&vdev->priv_rx);
 	INIT_LIST_HEAD(&vdev->priv_tx);
 	INIT_LIST_HEAD(&vdev->unlink_tx);
 	INIT_LIST_HEAD(&vdev->unlink_rx);
-	/* vdev->priv_lock = SPIN_LOCK_UNLOCKED; */
 	spin_lock_init(&vdev->priv_lock);
 
 	init_waitqueue_head(&vdev->waitq_tx);
-- 
1.7.3.1

