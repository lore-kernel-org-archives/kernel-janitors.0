From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 05 Oct 2018 10:51:56 +0000
Subject: [PATCH -next] drm/arm/malidp: remove set but not used variable 'afbc_superblock_size'
Message-Id: <1538737393-112861-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>, Mali DP Maintainers <malidp@foss.arm.com>, David Airlie <airlied@linux.ie>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/arm/malidp_drv.c: In function 'malidp_verify_afbc_framebuffer_size':
drivers/gpu/drm/arm/malidp_drv.c:318:6: warning:
 variable 'afbc_superblock_size' set but not used [-Wunused-but-set-variable]
  u32 afbc_superblock_size = 0, afbc_superblock_height = 0;

It never used since be introduced in
commit 3dae1c0919d8 ("drm/arm/malidp: Implemented the size validation for AFBC framebuffers")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 9021485..1b0ede6 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -315,7 +315,7 @@ static void malidp_atomic_commit_tail(struct drm_atomic_state *state)
 	int n_superblocks = 0;
 	const struct drm_format_info *info;
 	struct drm_gem_object *objs = NULL;
-	u32 afbc_superblock_size = 0, afbc_superblock_height = 0;
+	u32 afbc_superblock_height = 0;
 	u32 afbc_superblock_width = 0, afbc_size = 0;
 
 	switch (mode_cmd->modifier[0] & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK) {
@@ -333,9 +333,6 @@ static void malidp_atomic_commit_tail(struct drm_atomic_state *state)
 	n_superblocks = (mode_cmd->width / afbc_superblock_width) *
 		(mode_cmd->height / afbc_superblock_height);
 
-	afbc_superblock_size = info->cpp[0] * afbc_superblock_width *
-		afbc_superblock_height;
-
 	afbc_size = ALIGN(n_superblocks * AFBC_HEADER_SIZE, 128);
 
 	if (mode_cmd->width * info->cpp[0] != mode_cmd->pitches[0]) {
