From: Colin King <colin.king@canonical.com>
Date: Mon, 23 Nov 2020 10:54:17 +0000
Subject: [PATCH] drm/amd/powerplay: fix spelling mistake "smu_state_memroy_block" -> "smu_state_memory_block"
Message-Id: <20201123105417.198314-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180428222155.20242-1-colin.king@canonical.com>
In-Reply-To: <20180428222155.20242-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Evan Quan <evan.quan@amd.com>, Kevin Wang <kevin1.wang@amd.com>, Chengming Gui <Jack.Gui@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The struct name smu_state_memroy_block contains a spelling mistake, rename
it to smu_state_memory_block

Fixes: 8554e67d6e22 ("drm/amd/powerplay: implement power_dpm_state sys interface for SMU11")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
index 7550757cc059..a559ea2204c1 100644
--- a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
@@ -99,7 +99,7 @@ struct smu_state_display_block {
 	bool              enable_vari_bright;
 };
 
-struct smu_state_memroy_block {
+struct smu_state_memory_block {
 	bool              dll_off;
 	uint8_t                 m3arb;
 	uint8_t                 unused[3];
@@ -146,7 +146,7 @@ struct smu_power_state {
 	struct smu_state_validation_block             validation;
 	struct smu_state_pcie_block                   pcie;
 	struct smu_state_display_block                display;
-	struct smu_state_memroy_block                 memory;
+	struct smu_state_memory_block                 memory;
 	struct smu_state_software_algorithm_block     software;
 	struct smu_uvd_clocks                         uvd_clocks;
 	struct smu_hw_power_state                     hardware;
-- 
2.28.0
