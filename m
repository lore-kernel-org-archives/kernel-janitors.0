From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Oct 2014 15:47:07 +0000
Subject: [patch] drm/radeon: remove some buggy dead code
Message-Id: <20141029154707.GA5290@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>
Cc: kernel-janitors@vger.kernel.org, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org

The calculation of "num_shader_engines" has a precedence bug because
the right shift happens before the mask, but this variable is never used
so we can just delete it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
index a31f1ca..f37d39d 100644
--- a/drivers/gpu/drm/radeon/evergreen.c
+++ b/drivers/gpu/drm/radeon/evergreen.c
@@ -3005,7 +3005,7 @@ static void evergreen_gpu_init(struct radeon_device *rdev)
 	u32 vgt_cache_invalidation;
 	u32 hdp_host_path_cntl, tmp;
 	u32 disabled_rb_mask;
-	int i, j, num_shader_engines, ps_thread_count;
+	int i, j, ps_thread_count;
 
 	switch (rdev->family) {
 	case CHIP_CYPRESS:
@@ -3303,8 +3303,6 @@ static void evergreen_gpu_init(struct radeon_device *rdev)
 	rdev->config.evergreen.tile_config | 		((gb_addr_config & 0x30000000) >> 28) << 12;
 
-	num_shader_engines = (gb_addr_config & NUM_SHADER_ENGINES(3) >> 12) + 1;
-
 	if ((rdev->family >= CHIP_CEDAR) && (rdev->family <= CHIP_HEMLOCK)) {
 		u32 efuse_straps_4;
 		u32 efuse_straps_3;
