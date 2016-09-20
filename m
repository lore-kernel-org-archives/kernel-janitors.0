From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 20 Sep 2016 09:01:50 +0000
Subject: [PATCH 6/6] GPU-DRM-GMA500: Rename a jump label in mid_get_vbt_data()
Message-Id: <64e06a00-42d1-e7a8-1fe7-1b5de026b060@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <3c9785ef-4553-2e3d-2cb2-5cf6d1f31ccd@users.sourceforge.net>
In-Reply-To: <3c9785ef-4553-2e3d-2cb2-5cf6d1f31ccd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 20 Sep 2016 10:40:22 +0200

* Adjust a jump target.

* Delete the explicit initialisation for the local variable "ret"
  which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/gma500/mid_bios.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/gma500/mid_bios.c b/drivers/gpu/drm/gma500/mid_bios.c
index e5cece0..602d16f 100644
--- a/drivers/gpu/drm/gma500/mid_bios.c
+++ b/drivers/gpu/drm/gma500/mid_bios.c
@@ -284,7 +284,7 @@ static void mid_get_vbt_data(struct drm_psb_private *dev_priv)
 	u8 __iomem *vbt_virtual;
 	struct mid_vbt_header vbt_header;
 	struct pci_dev *pci_gfx_root = pci_get_bus_and_slot(0, PCI_DEVFN(2, 0));
-	int ret = -1;
+	int ret;
 
 	/* Get the address of the platform config vbt */
 	pci_read_config_dword(pci_gfx_root, 0xFC, &addr);
@@ -293,18 +293,18 @@ static void mid_get_vbt_data(struct drm_psb_private *dev_priv)
 	dev_dbg(dev->dev, "drm platform config address is %x\n", addr);
 
 	if (!addr)
-		goto out;
+		goto report_failure;
 
 	/* get the virtual address of the vbt */
 	vbt_virtual = ioremap(addr, sizeof(vbt_header));
 	if (!vbt_virtual)
-		goto out;
+		goto report_failure;
 
 	memcpy_fromio(&vbt_header, vbt_virtual, sizeof(vbt_header));
 	iounmap(vbt_virtual);
 
 	if (memcmp(&vbt_header.signature, "$GCT", 4))
-		goto out;
+		goto report_failure;
 
 	dev_dbg(dev->dev, "GCT revision is %02x\n", vbt_header.revision);
 
@@ -322,9 +322,8 @@ static void mid_get_vbt_data(struct drm_psb_private *dev_priv)
 		dev_err(dev->dev, "Unknown revision of GCT!\n");
 		return;
 	}
-
-out:
 	if (ret)
+ report_failure:
 		dev_err(dev->dev, "Unable to read GCT!");
 	else
 		dev_priv->has_gct = true;
-- 
2.10.0

