From: Mao Wenan <maowenan@huawei.com>
Date: Sun, 15 Sep 2019 14:22:23 +0000
Subject: [PATCH v2] usbip: vhci_hcd indicate failed message
Message-Id: <20190915142223.158404-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5D7E3D1A.5070906@bfs.de>
In-Reply-To: <5D7E3D1A.5070906@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: valentina.manea.m@gmail.com, shuah@kernel.org, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

If the return value of vhci_init_attr_group and
sysfs_create_group is non-zero, which mean they failed
to init attr_group and create sysfs group, so it would
better add 'failed' message to indicate that.
This patch also change pr_err to dev_err to trace which
device is failed.

Fixes: 0775a9cbc694 ("usbip: vhci extension: modifications to vhci driver")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 v2: change pr_err to dev_err.
 drivers/usb/usbip/vhci_hcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 000ab7225717..bea28ec846ee 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -1185,12 +1185,12 @@ static int vhci_start(struct usb_hcd *hcd)
 	if (id = 0 && usb_hcd_is_primary_hcd(hcd)) {
 		err = vhci_init_attr_group();
 		if (err) {
-			pr_err("init attr group\n");
+			dev_err(hcd_dev(hcd), "init attr group failed\n");
 			return err;
 		}
 		err = sysfs_create_group(&hcd_dev(hcd)->kobj, &vhci_attr_group);
 		if (err) {
-			pr_err("create sysfs files\n");
+			dev_err(hcd_dev(hcd), "create sysfs files failed\n");
 			vhci_finish_attr_group();
 			return err;
 		}
-- 
2.20.1
