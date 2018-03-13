From: Colin King <colin.king@canonical.com>
Date: Tue, 13 Mar 2018 13:22:17 +0000
Subject: [PATCH][next] drm/amd/pp: remove redundant pointer internal_buf
Message-Id: <20180313132217.31025-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Rex Zhu <Rex.Zhu@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer internal_buf is assigned a value but the pointer is never
read, hence it is redundant and can be removed.

Cleans up clang warning:
drivers/gpu/drm/amd/amdgpu/../powerplay/smumgr/smu7_smumgr.c:630:2:
warning: Value stored to 'internal_buf' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c
index 7394bb46b8b2..dcb151cabc00 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c
@@ -585,7 +585,6 @@ int smu7_setup_pwr_virus(struct pp_hwmgr *hwmgr)
 int smu7_init(struct pp_hwmgr *hwmgr)
 {
 	struct smu7_smumgr *smu_data;
-	uint8_t *internal_buf;
 	uint64_t mc_addr = 0;
 	int r;
 	/* Allocate memory for backend private data */
@@ -627,7 +626,6 @@ int smu7_init(struct pp_hwmgr *hwmgr)
 					&smu_data->header_buffer.kaddr);
 		return -EINVAL;
 	}
-	internal_buf = smu_data->smu_buffer.kaddr;
 	smu_data->smu_buffer.mc_addr = mc_addr;
 
 	if (smum_is_hw_avfs_present(hwmgr))
-- 
2.15.1

