From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Thu, 24 Dec 2009 13:25:54 +0000
Subject: drivers/gpu/drm/radeon/radeon_cp.c: fix resource leak on error
Message-Id: <1261661154.3546.47.camel@ICE-BOX>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel mailing list <dri-devel@lists.sourceforge.net>, Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

If drm_addmap() fails master_priv is leaked.


Coverity CID: 13195

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
diff --git a/drivers/gpu/drm/radeon/radeon_cp.c
b/drivers/gpu/drm/radeon/radeon_cp.c
index 0b2f9c2..06123ba 100644
--- a/drivers/gpu/drm/radeon/radeon_cp.c
+++ b/drivers/gpu/drm/radeon/radeon_cp.c
@@ -2145,6 +2145,7 @@ int radeon_master_create(struct drm_device *dev,
struct drm_master *master)
 			 &master_priv->sarea);
 	if (ret) {
 		DRM_ERROR("SAREA setup failed\n");
+		kfree(master_priv);
 		return ret;
 	}
 	master_priv->sarea_priv = master_priv->sarea->handle + sizeof(struct
drm_sarea);


