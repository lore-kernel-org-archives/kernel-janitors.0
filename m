From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 01 Oct 2016 19:46:32 +0000
Subject: [PATCH 15/15] drm/omap: improve function-level documentation
Message-Id: <1475351192-27079-16-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

Use the names of the corresponding functions.

Issue detected using Coccinelle (http://coccinelle.lip6.fr/)

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpu/drm/omapdrm/omap_drv.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index e1cfba5..8d93355 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -635,7 +635,7 @@ static int ioctl_gem_info(struct drm_device *dev, void *data,
  */
 
 /**
- * load - setup chip and create an initial config
+ * dev_load - setup chip and create an initial config
  * @dev: DRM device
  * @flags: startup flags
  *
@@ -733,7 +733,7 @@ static int dev_open(struct drm_device *dev, struct drm_file *file)
 }
 
 /**
- * lastclose - clean up after all DRM clients have exited
+ * dev_lastclose - clean up after all DRM clients have exited
  * @dev: DRM device
  *
  * Take care of cleaning up after all DRM clients have exited.  In the

