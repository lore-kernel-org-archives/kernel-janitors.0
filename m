From: Colin King <colin.king@canonical.com>
Date: Mon, 11 Jan 2021 11:46:38 +0000
Subject: [PATCH][next] drm/amdgpu: Add missing BOOTUP_DEFAULT to profile_name[]
Message-Id: <20210111114638.16530-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Xiaojian Du <Xiaojian.Du@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A recent change added a new BOOTUP_DEFAULT power profile mode
to the PP_SMC_POWER_PROFILE enum but omitted updating the
corresponding profile_name array.  Fix this by adding in the
missing BOOTUP_DEFAULT to profile_name[].

Addresses-Coverity: ("Out-of-bounds read")
Fixes: c27c9778a19e ("drm/amd/powerplay: support BOOTUP_DEFAULT power profile mode")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index 75ddcadf3802..4763cb095820 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -774,6 +774,7 @@ static int vangogh_get_power_profile_mode(struct smu_context *smu,
 					   char *buf)
 {
 	static const char *profile_name[] = {
+					"BOOTUP_DEFAULT",
 					"FULL_SCREEN_3D",
 					"VIDEO",
 					"VR",
-- 
2.29.2
