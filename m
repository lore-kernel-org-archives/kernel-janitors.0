From: Colin King <colin.king@canonical.com>
Date: Tue, 26 Jun 2018 16:03:54 +0000
Subject: [PATCH][next] drm/panel: ILI9881c: fix missing assignment to error return ret
Message-Id: <20180626160354.1363-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently, ret is being checked for an error condition however it
is not being assigned in the previous statement on the call of
function mipi_dsi_dcs_exit_sleep_mode.  Add in the missing assignment
of ret.

Detected by CoverityScan, CID#1470174, 1470178 ("Unchecked return value")

Fixes: 26aec25593c2 ("drm/panel: Add Ilitek ILI9881c panel driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index e848af235df5..3ad4a46c4e94 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -334,7 +334,7 @@ static int ili9881c_prepare(struct drm_panel *panel)
 	if (ret)
 		return ret;
 
-	mipi_dsi_dcs_exit_sleep_mode(ctx->dsi);
+	ret = mipi_dsi_dcs_exit_sleep_mode(ctx->dsi);
 	if (ret)
 		return ret;
 
-- 
2.17.1

