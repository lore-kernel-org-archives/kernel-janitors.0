From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Feb 2021 14:42:53 +0000
Subject: [PATCH] misc: bcm-vk: Fix a couple error codes in probe()
Message-Id: <YBpyEbmz00rjvT9S@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Branden <scott.branden@broadcom.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Desmond Yan <desmond.yan@broadcom.com>, Olof Johansson <olof@lixom.net>, James Hu <james.hu@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

These errors should return negative error codes instead of returning
success.

Fixes: 064ffc7c3939 ("misc: bcm-vk: add autoload support")
Fixes: 522f692686a7 ("misc: bcm-vk: add Broadcom VK driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/misc/bcm-vk/bcm_vk_dev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/bcm-vk/bcm_vk_dev.c b/drivers/misc/bcm-vk/bcm_vk_dev.c
index c3d2bba68ef1..a82a8927d92b 100644
--- a/drivers/misc/bcm-vk/bcm_vk_dev.c
+++ b/drivers/misc/bcm-vk/bcm_vk_dev.c
@@ -1358,6 +1358,7 @@ static int bcm_vk_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		vk->bar[i] = pci_ioremap_bar(pdev, i * 2);
 		if (!vk->bar[i]) {
 			dev_err(dev, "failed to remap BAR%d\n", i);
+			err = -ENOMEM;
 			goto err_iounmap;
 		}
 	}
@@ -1463,7 +1464,8 @@ static int bcm_vk_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	boot_status = vkread32(vk, BAR_0, BAR_BOOT_STATUS);
 	if (auto_load) {
 		if ((boot_status & BOOT_STATE_MASK) = BROM_RUNNING) {
-			if (bcm_vk_trigger_autoload(vk))
+			err = bcm_vk_trigger_autoload(vk);
+			if (err)
 				goto err_bcm_vk_tty_exit;
 		} else {
 			dev_err(dev,
-- 
2.30.0
