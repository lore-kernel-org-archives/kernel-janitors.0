From: Colin King <colin.king@canonical.com>
Date: Fri, 28 Jun 2019 14:24:02 +0000
Subject: [PATCH] drm/amd/powerplay: fix off-by-one array bounds check
Message-Id: <20190628142402.2771-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The array bounds check for index is currently off-by-one and should
be using >= rather than > on the upper bound. Fix this.

Addresses-Coverity: ("Out-of-bounds read")
Fixes: b3490673f905 ("drm/amd/powerplay: introduce the navi10 pptable implementation")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
index 27e5c80..f678700 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -210,7 +210,7 @@ static int navi10_workload_map[] = {
 static int navi10_get_smu_msg_index(struct smu_context *smc, uint32_t index)
 {
 	int val;
-	if (index > SMU_MSG_MAX_COUNT)
+	if (index >= SMU_MSG_MAX_COUNT)
 		return -EINVAL;
 
 	val = navi10_message_map[index];
-- 
2.7.4
