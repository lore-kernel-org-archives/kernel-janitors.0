From: Colin King <colin.king@canonical.com>
Date: Thu, 27 Aug 2020 15:57:50 +0000
Subject: [PATCH][next] drm/amdgpu/swsmu: fix potential uint32_t multiplication overflow
Message-Id: <20200827155750.60938-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The calculation of tmp64 is performed using a 32 bit multiply and then
is stored in the uint64_t variable tmp64. This indicates that a 64 bit
result may be expected, so cast crystal_clock_freq to a uint64_t
to ensure a 64 bit multiplication is being performed to avoid any
potential 32 bit overflow.

Addresses-Coverity: ("Unintentional integer overflow)"
Fixes: 13819ef6453c ("drm/amdgpu/swsmu: add smu11 helpers to get manual fan speeds")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index d2a15e6f48be..0a5161d09722 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -1218,7 +1218,7 @@ int smu_v11_0_get_fan_speed_rpm(struct smu_context *smu,
 
 	crystal_clock_freq = amdgpu_asic_get_xclk(adev);
 
-	tmp64 = 60 * crystal_clock_freq * 10000;
+	tmp64 = (uint64_t)crystal_clock_freq * 60 * 10000;
 	do_div(tmp64, (tach_period * 8));
 	*speed = (uint32_t)tmp64;
 
-- 
2.27.0
