From: Colin King <colin.king@canonical.com>
Date: Wed, 25 Sep 2019 12:03:57 +0000
Subject: [PATCH] drm/panel: clean up indentation issue
Message-Id: <20190925120357.10408-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Mavrodiev <stefan@olimex.com>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a continue statement that is indented one level too deeply,
remove the extraneous tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
index 2bae1db3ff34..7dd67262a2ed 100644
--- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
+++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
@@ -161,7 +161,7 @@ static int lcd_olinuxino_get_modes(struct drm_panel *panel)
 				lcd_mode->hactive,
 				lcd_mode->vactive,
 				lcd_mode->refresh);
-				continue;
+			continue;
 		}
 
 		mode->clock = lcd_mode->pixelclock;
-- 
2.20.1
