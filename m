From: Colin King <colin.king@canonical.com>
Date: Tue, 18 Aug 2020 12:09:14 +0000
Subject: [PATCH][next] drm/amd/display: fix potential integer overflow when shifting 32 bit variable bl_pwm
Message-Id: <20200818120914.20280-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Anthony Koo <Anthony.Koo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The 32 bit unsigned integer bl_pwm is being shifted using 32 bit arithmetic
and then being assigned to a 64 bit unsigned integer.  There is a potential
for a 32 bit overflow so cast bl_pwm to enforce a 64 bit shift operation
to avoid this.

Addresses-Coverity: ("unintentional integer overflow")
Fixes: 3ba01817365c ("drm/amd/display: Move panel_cntl specific register from abm to panel_cntl.")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c b/drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c
index a6d73d30837c..df7f826eebd8 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c
@@ -76,7 +76,7 @@ static unsigned int dce_get_16_bit_backlight_from_pwm(struct panel_cntl *panel_c
 	else
 		bl_pwm &= 0xFFFF;
 
-	current_backlight = bl_pwm << (1 + bl_int_count);
+	current_backlight = (uint64_t)bl_pwm << (1 + bl_int_count);
 
 	if (bl_period = 0)
 		bl_period = 0xFFFF;
-- 
2.27.0
