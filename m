From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 03 Aug 2010 15:44:27 +0000
Subject: [PATCH 11/11] sis: do not use PCI resources before pci_enable_device()
Message-Id: <1280850268-6298-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Thomas Winischhofer <thomas@winischhofer.net>, Andrew Morton <akpm@linux-foundation.org>, Roel Kluin <roel.kluin@gmail.com>, Dan Carpenter <error27@gmail.com>, Christoph Egger <siccegge@stud.informatik.uni-erlangen.de>, linux-kernel@vger.kernel.org

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
 drivers/video/sis/sis_main.c |   13 +++++--------
 1 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/video/sis/sis_main.c b/drivers/video/sis/sis_main.c
index 559bf17..47ba64e 100644
--- a/drivers/video/sis/sis_main.c
+++ b/drivers/video/sis/sis_main.c
@@ -5782,6 +5782,11 @@ sisfb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	ivideo->subsysvendor = pdev->subsystem_vendor;
 	ivideo->subsysdevice = pdev->subsystem_device;
 
+	if (!ivideo->sisvga_enabled && pci_enable_device(pdev)) {
+		framebuffer_release(sis_fb_info);
+		return -EIO;
+	}
+
 #ifndef MODULE
 	if(sisfb_mode_idx = -1) {
 		sisfb_get_vga_mode_from_kernel();
@@ -5923,14 +5928,6 @@ sisfb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 #endif
 
-	if(!ivideo->sisvga_enabled) {
-		if(pci_enable_device(pdev)) {
-			if(ivideo->nbridge) pci_dev_put(ivideo->nbridge);
-			pci_set_drvdata(pdev, NULL);
-			framebuffer_release(sis_fb_info);
-			return -EIO;
-		}
-	}
 
 	ivideo->video_base = pci_resource_start(pdev, 0);
 	ivideo->mmio_base  = pci_resource_start(pdev, 1);
-- 
1.7.0.4

