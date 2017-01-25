From: Colin King <colin.king@canonical.com>
Date: Wed, 25 Jan 2017 12:07:32 +0000
Subject: [PATCH] drm/amd/powerplay: header should be defining _SMU7_CLOCK_POWER_GATING_H_
Message-Id: <20170125120732.25126-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Ken Wang <Qingqing.Wang@amd.com>, =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

_SMU7_CLOCK_POWER_GATING_H_ is being used as a header guard, followed by
a #define of a different macro.  Define _SMU7_CLOCK_POWER_GATING_H_ instead
to fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/smu7_clockpowergating.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_clockpowergating.h b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_clockpowergating.h
index d52a28c..c96ed9e 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_clockpowergating.h
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_clockpowergating.h
@@ -22,7 +22,7 @@
  */
 
 #ifndef _SMU7_CLOCK_POWER_GATING_H_
-#define _SMU7_CLOCK__POWER_GATING_H_
+#define _SMU7_CLOCK_POWER_GATING_H_
 
 #include "smu7_hwmgr.h"
 #include "pp_asicblocks.h"
-- 
2.10.2

