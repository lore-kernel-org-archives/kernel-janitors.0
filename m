From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 22 Jul 2016 08:45:30 +0000
Subject: [PATCH] GPU-DRM-GMA500: Delete unnecessary checks before two function calls
Message-Id: <f1a0fd83-4320-f3db-e1bb-3b9832a4429f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <5447DFD5.5020905@users.sourceforge.net>
In-Reply-To: <5447DFD5.5020905@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 22 Jul 2016 10:30:30 +0200

The functions pci_dev_put() and psb_intel_i2c_destroy() test whether
their argument is NULL and then return immediately.
Thus the tests around their calls are not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c | 3 +--
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 9 +++------
 drivers/gpu/drm/gma500/psb_drv.c        | 6 ++----
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 9 +++------
 4 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
index 28f9d90..563f193 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
@@ -246,8 +246,7 @@ static void cdv_hdmi_destroy(struct drm_connector *connector)
 {
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 
-	if (gma_encoder->i2c_bus)
-		psb_intel_i2c_destroy(gma_encoder->i2c_bus);
+	psb_intel_i2c_destroy(gma_encoder->i2c_bus);
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 	kfree(connector);
diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 813ef23..38dc890 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -444,8 +444,7 @@ static void cdv_intel_lvds_destroy(struct drm_connector *connector)
 {
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 
-	if (gma_encoder->i2c_bus)
-		psb_intel_i2c_destroy(gma_encoder->i2c_bus);
+	psb_intel_i2c_destroy(gma_encoder->i2c_bus);
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 	kfree(connector);
@@ -780,12 +779,10 @@ out:
 failed_find:
 	mutex_unlock(&dev->mode_config.mutex);
 	printk(KERN_ERR "Failed find\n");
-	if (gma_encoder->ddc_bus)
-		psb_intel_i2c_destroy(gma_encoder->ddc_bus);
+	psb_intel_i2c_destroy(gma_encoder->ddc_bus);
 failed_ddc:
 	printk(KERN_ERR "Failed DDC\n");
-	if (gma_encoder->i2c_bus)
-		psb_intel_i2c_destroy(gma_encoder->i2c_bus);
+	psb_intel_i2c_destroy(gma_encoder->i2c_bus);
 failed_blc_i2c:
 	printk(KERN_ERR "Failed BLC\n");
 	drm_encoder_cleanup(encoder);
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 82b8ce4..50eb944f 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -210,10 +210,8 @@ static int psb_driver_unload(struct drm_device *dev)
 			iounmap(dev_priv->aux_reg);
 			dev_priv->aux_reg = NULL;
 		}
-		if (dev_priv->aux_pdev)
-			pci_dev_put(dev_priv->aux_pdev);
-		if (dev_priv->lpc_pdev)
-			pci_dev_put(dev_priv->lpc_pdev);
+		pci_dev_put(dev_priv->aux_pdev);
+		pci_dev_put(dev_priv->lpc_pdev);
 
 		/* Destroy VBT data */
 		psb_intel_destroy_bios(dev);
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index b1b9331..e55733c 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -561,8 +561,7 @@ void psb_intel_lvds_destroy(struct drm_connector *connector)
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 	struct psb_intel_lvds_priv *lvds_priv = gma_encoder->dev_priv;
 
-	if (lvds_priv->ddc_bus)
-		psb_intel_i2c_destroy(lvds_priv->ddc_bus);
+	psb_intel_i2c_destroy(lvds_priv->ddc_bus);
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 	kfree(connector);
@@ -835,11 +834,9 @@ out:
 
 failed_find:
 	mutex_unlock(&dev->mode_config.mutex);
-	if (lvds_priv->ddc_bus)
-		psb_intel_i2c_destroy(lvds_priv->ddc_bus);
+	psb_intel_i2c_destroy(lvds_priv->ddc_bus);
 failed_ddc:
-	if (lvds_priv->i2c_bus)
-		psb_intel_i2c_destroy(lvds_priv->i2c_bus);
+	psb_intel_i2c_destroy(lvds_priv->i2c_bus);
 failed_blc_i2c:
 	drm_encoder_cleanup(encoder);
 	drm_connector_cleanup(connector);
-- 
2.9.2

