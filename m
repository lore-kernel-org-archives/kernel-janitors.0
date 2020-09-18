From: Colin King <colin.king@canonical.com>
Date: Fri, 18 Sep 2020 15:51:36 +0000
Subject: [PATCH][next] drm/panel: fix null pointer dereference on pointer mode
Message-Id: <20200918155136.28958-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, Purism Kernel Team <kernel@puri.sm>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently a null pointer check on pointer mode is passing mode to
function drm_mode_vrefresh and this causes a null pointer dereference
on mode.  Fix this by not calling drm_mode_vrefresh since the call
is only required for error reporting.

Addresses-Coverity: ("Dereference after null check")
Fixes: 72967d5616d3 ("drm/panel: Add panel driver for the Mantix MLAF057WE51-X DSI panel")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
index 3482e28e30fc..be4761a643f9 100644
--- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
+++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
@@ -202,9 +202,8 @@ static int mantix_get_modes(struct drm_panel *panel,
 
 	mode = drm_mode_duplicate(connector->dev, &default_mode);
 	if (!mode) {
-		dev_err(ctx->dev, "Failed to add mode %ux%u@%u\n",
-			default_mode.hdisplay, default_mode.vdisplay,
-			drm_mode_vrefresh(mode));
+		dev_err(ctx->dev, "Failed to add mode %ux%u\n",
+			default_mode.hdisplay, default_mode.vdisplay);
 		return -ENOMEM;
 	}
 
-- 
2.27.0
