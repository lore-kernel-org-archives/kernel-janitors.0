From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 03 Aug 2010 15:42:30 +0000
Subject: [PATCH 01/11] agp: efficeon-agp: do not use PCI resources before pci_enable_device()
Message-Id: <1280850150-4967-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Eric Anholt <eric@anholt.net>, linux-kernel@vger.kernel.org

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
 drivers/char/agp/efficeon-agp.c |   22 +++++++++++-----------
 1 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/char/agp/efficeon-agp.c b/drivers/char/agp/efficeon-agp.c
index aa109cb..d607f53 100644
--- a/drivers/char/agp/efficeon-agp.c
+++ b/drivers/char/agp/efficeon-agp.c
@@ -372,6 +372,17 @@ static int __devinit agp_efficeon_probe(struct pci_dev *pdev,
 	bridge->capndx = cap_ptr;
 
 	/*
+	* If the device has not been properly setup, the following will catch
+	* the problem and should stop the system from crashing.
+	* 20030610 - hamish@zot.org
+	*/
+	if (pci_enable_device(pdev)) {
+		printk(KERN_ERR PFX "Unable to Enable PCI device\n");
+		agp_put_bridge(bridge);
+		return -ENODEV;
+	}
+
+	/*
 	* The following fixes the case where the BIOS has "forgotten" to
 	* provide an address range for the GART.
 	* 20030610 - hamish@zot.org
@@ -385,17 +396,6 @@ static int __devinit agp_efficeon_probe(struct pci_dev *pdev,
 		}
 	}
 
-	/*
-	* If the device has not been properly setup, the following will catch
-	* the problem and should stop the system from crashing.
-	* 20030610 - hamish@zot.org
-	*/
-	if (pci_enable_device(pdev)) {
-		printk(KERN_ERR PFX "Unable to Enable PCI device\n");
-		agp_put_bridge(bridge);
-		return -ENODEV;
-	}
-
 	/* Fill in the mode register */
 	if (cap_ptr) {
 		pci_read_config_dword(pdev,
-- 
1.7.0.4

