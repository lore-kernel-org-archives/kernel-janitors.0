From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Apr 2020 14:02:40 +0000
Subject: [PATCH][next] drm/amd/display: fix incorrect assignment due to a typo
Message-Id: <20200423140240.19360-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Anthony Koo <Anthony.Koo@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment to infopacket->sb[7] looks incorrect, the comment states it
is the minimum refresh rate yet it is being assigned a value from the
maximum refresh rate max_refresh_in_uhz. Fix this by using min_refresh_in_uhz
instead.

Addresses-Coverity: ("Copy-paste error")
Fixes: d2bacc38f6ca ("drm/amd/display: Change infopacket type programming")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/modules/freesync/freesync.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
index eb7421e83b86..fe11436536e8 100644
--- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
+++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
@@ -587,7 +587,7 @@ static void build_vrr_infopacket_data_v3(const struct mod_vrr_params *vrr,
 	} else {
 		// Non-fs case, program nominal range
 		/* PB7 = FreeSync Minimum refresh rate (Hz) */
-		infopacket->sb[7] = (unsigned char)((vrr->max_refresh_in_uhz + 500000) / 1000000);
+		infopacket->sb[7] = (unsigned char)((vrr->min_refresh_in_uhz + 500000) / 1000000);
 		/* PB8 = FreeSync Maximum refresh rate (Hz) */
 		infopacket->sb[8] = (unsigned char)((vrr->max_refresh_in_uhz + 500000) / 1000000);
 	}
-- 
2.25.1
