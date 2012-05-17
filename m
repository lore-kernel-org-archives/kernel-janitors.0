From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 May 2012 07:09:44 +0000
Subject: [patch] drm: checking the wrong variable in savage_do_init_bci()
Message-Id: <20120517070944.GE14660@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Nicolas Kaiser <nikai@nikai.net>, Dave Airlie <airlied@redhat.com>, kernel-janitors@vger.kernel.org, Greg Dietsche <Gregory.Dietsche@cuw.edu>, dri-devel@lists.freedesktop.org

drm_core_ioremap() initializes ->handle.  We already know
"dev->agp_buffer_map" is a valid pointer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/savage/savage_bci.c b/drivers/gpu/drm/savage/savage_bci.c
index cb1ee4e..6eb507a 100644
--- a/drivers/gpu/drm/savage/savage_bci.c
+++ b/drivers/gpu/drm/savage/savage_bci.c
@@ -735,7 +735,7 @@ static int savage_do_init_bci(struct drm_device * dev, drm_savage_init_t * init)
 			return -EINVAL;
 		}
 		drm_core_ioremap(dev->agp_buffer_map, dev);
-		if (!dev->agp_buffer_map) {
+		if (!dev->agp_buffer_map->handle) {
 			DRM_ERROR("failed to ioremap DMA buffer region!\n");
 			savage_do_cleanup_bci(dev);
 			return -ENOMEM;
