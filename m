From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Thu, 24 Dec 2009 12:44:30 +0000
Subject: drivers/gpu/drm/radeon: move a dereference below a NULL test
Message-Id: <1261658670.3546.7.camel@ICE-BOX>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel mailing list <dri-devel@lists.sourceforge.net>, Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

If a NULL value is possible, the dereference should only occur after the
NULL test.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
diff --git a/drivers/gpu/drm/radeon/radeon_irq.c
b/drivers/gpu/drm/radeon/radeon_irq.c
index b79ecc4..2f349a3 100644
--- a/drivers/gpu/drm/radeon/radeon_irq.c
+++ b/drivers/gpu/drm/radeon/radeon_irq.c
@@ -289,16 +289,16 @@ int radeon_irq_emit(struct drm_device *dev, void
*data, struct drm_file *file_pr
 	drm_radeon_irq_emit_t *emit = data;
 	int result;
 
-	if ((dev_priv->flags & RADEON_FAMILY_MASK) >= CHIP_R600)
-		return -EINVAL;
-
-	LOCK_TEST_WITH_RETURN(dev, file_priv);
-
 	if (!dev_priv) {
 		DRM_ERROR("called with no initialization\n");
 		return -EINVAL;
 	}
 
+	if ((dev_priv->flags & RADEON_FAMILY_MASK) >= CHIP_R600)
+		return -EINVAL;
+
+	LOCK_TEST_WITH_RETURN(dev, file_priv);
+
 	result = radeon_emit_irq(dev);
 
 	if (DRM_COPY_TO_USER(emit->irq_seq, &result, sizeof(int))) {


