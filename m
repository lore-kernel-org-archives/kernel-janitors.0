From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Thu, 08 Mar 2018 02:03:12 +0000
Subject: [PATCH 3/5] drm/vgem: Replace uint32_t for u32
Message-Id: <386320c12f1414cdf13bdadabed0f4f3287a7538.1520474055.git.rodrigosiqueiramelo@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1520474055.git.rodrigosiqueiramelo@gmail.com>
In-Reply-To: <cover.1520474055.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

This patch fixes the checkpatch.pl check:

vgem_drv.c:229: CHECK: Prefer kernel type 'u32' over 'uint32_t'

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 5767030d04a8..bf704ed51da4 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -226,7 +226,7 @@ static int vgem_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 }
 
 static int vgem_gem_dumb_map(struct drm_file *file, struct drm_device *dev,
-			     uint32_t handle, uint64_t *offset)
+			     u32 handle, uint64_t *offset)
 {
 	struct drm_gem_object *obj;
 	int ret;
-- 
2.16.2

