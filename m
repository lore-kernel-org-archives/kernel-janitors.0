From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Mar 2019 06:27:31 +0000
Subject: [PATCH] drm/v3d: fix a NULL vs error pointer mixup
Message-Id: <20190321062731.GC21489@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Anholt <eric@anholt.net>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

The drm_gem_shmem_create() returns error pointers and v3d_bo_create() is
also supposed to return error pointers.

Fixes: 40609d4820b2 ("drm/v3d: Use the new shmem helpers to reduce driver boilerplate.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/v3d/v3d_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index c0219ebb4284..a22b75a3a533 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -130,8 +130,8 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
 	int ret;
 
 	shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
-	if (!shmem_obj)
-		return NULL;
+	if (IS_ERR(shmem_obj))
+		return ERR_CAST(shmem_obj);
 	bo = to_v3d_bo(&shmem_obj->base);
 
 	ret = v3d_bo_create_finish(&shmem_obj->base);
-- 
2.17.1
