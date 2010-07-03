From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 03 Jul 2010 16:04:43 +0000
Subject: [PATCH 18/19] drivers/staging/vt6655: use for_each_pci_dev()
Message-Id: <1278173084-12017-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, =?UTF-8?q?Charles=20Cl=C3=A9ment?= <caratorn@gmail.com>, Jim Lieb <lieb@canonical.com>, "David S. Miller" <davem@davemloft.net>, Alexander Beregalov <a.beregalov@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Use for_each_pci_dev() to simplify the code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/vt6655/device_main.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 0d697d0..d498442 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -3655,7 +3655,7 @@ device_notify_reboot(struct notifier_block *nb, unsigned long event, void *p)
     case SYS_DOWN:
     case SYS_HALT:
     case SYS_POWER_OFF:
-        while ((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
+	for_each_pci_dev(pdev) {
             if(pci_dev_driver(pdev) = &device_driver) {
                 if (pci_get_drvdata(pdev))
                     viawget_suspend(pdev, PMSG_HIBERNATE);
-- 
1.7.0.4

