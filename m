From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 03 Aug 2010 15:44:20 +0000
Subject: [PATCH 09/11] staging: vt6655: do not use PCI resources before pci_enable_device()
Message-Id: <1280850260-6209-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, =?UTF-8?q?Charles=20Cl=C3=A9ment?= <caratorn@gmail.com>, Jim Lieb <lieb@canonical.com>, "David S. Miller" <davem@davemloft.net>, Alexander Beregalov <a.beregalov@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

IRQ and resource[] may not have correct values until
after PCI hotplug setup occurs at pci_enable_device() time.

The semantic match that finds this problem is as follows:

// <smpl>
@@
identifier x;
identifier request ~= "pci_request.*|pci_resource.*";
@@

(
* x->irq
|
* x->resource
|
* request(x, ...)
)
 ...
*pci_enable_device(x)
// </smpl>

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/vt6655/device_main.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index d498442..67c7b97 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -955,12 +955,13 @@ vt6655_probe(struct pci_dev *pcid, const struct pci_device_id *ent)
     pDevice->dev = dev;
     pDevice->next_module = root_device_dev;
     root_device_dev = dev;
-    dev->irq = pcid->irq;
 
     if (pci_enable_device(pcid)) {
         device_free_info(pDevice);
         return -ENODEV;
     }
+    dev->irq = pcid->irq;
+
 #ifdef	DEBUG
 	printk("Before get pci_info memaddr is %x\n",pDevice->memaddr);
 #endif
-- 
1.7.0.4

