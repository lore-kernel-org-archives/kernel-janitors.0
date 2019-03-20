From: Colin King <colin.king@canonical.com>
Date: Wed, 20 Mar 2019 17:29:09 +0000
Subject: [PATCH][next] drm/amd/powerplay: fix spelling mistake "unknow" -> "unknown"
Message-Id: <20190320172909.10348-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in pr_warn message; fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
index 17143888e37e..026bebe6fb45 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -2024,6 +2024,6 @@ void smu_v11_0_set_smu_funcs(struct smu_context *smu)
 		vega20_set_ppt_funcs(smu);
 		break;
 	default:
-		pr_warn("Unknow asic for smu11\n");
+		pr_warn("Unknown asic for smu11\n");
 	}
 }
-- 
2.20.1
