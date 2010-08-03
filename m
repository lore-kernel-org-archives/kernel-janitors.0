From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 03 Aug 2010 15:42:34 +0000
Subject: [PATCH 02/11] agp: intel-agp: do not use PCI resources before pci_enable_device()
Message-Id: <1280850154-5010-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>, Zhenyu Wang <zhenyuw@linux.intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>, David Woodhouse <David.Woodhouse@intel.com>, linux-kernel@vger.kernel.org

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
 drivers/char/agp/intel-agp.c |   22 +++++++++++-----------
 1 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/char/agp/intel-agp.c b/drivers/char/agp/intel-agp.c
index d836a71..237dd23 100644
--- a/drivers/char/agp/intel-agp.c
+++ b/drivers/char/agp/intel-agp.c
@@ -908,6 +908,17 @@ static int __devinit agp_intel_probe(struct pci_dev *pdev,
 	dev_info(&pdev->dev, "Intel %s Chipset\n", intel_agp_chipsets[i].name);
 
 	/*
+	* If the device has not been properly setup, the following will catch
+	* the problem and should stop the system from crashing.
+	* 20030610 - hamish@zot.org
+	*/
+	if (pci_enable_device(pdev)) {
+		dev_err(&pdev->dev, "can't enable PCI device\n");
+		agp_put_bridge(bridge);
+		return -ENODEV;
+	}
+
+	/*
 	* The following fixes the case where the BIOS has "forgotten" to
 	* provide an address range for the GART.
 	* 20030610 - hamish@zot.org
@@ -921,17 +932,6 @@ static int __devinit agp_intel_probe(struct pci_dev *pdev,
 		}
 	}
 
-	/*
-	* If the device has not been properly setup, the following will catch
-	* the problem and should stop the system from crashing.
-	* 20030610 - hamish@zot.org
-	*/
-	if (pci_enable_device(pdev)) {
-		dev_err(&pdev->dev, "can't enable PCI device\n");
-		agp_put_bridge(bridge);
-		return -ENODEV;
-	}
-
 	/* Fill in the mode register */
 	if (cap_ptr) {
 		pci_read_config_dword(pdev,
-- 
1.7.0.4

