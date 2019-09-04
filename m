From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Sep 2019 10:03:29 +0000
Subject: [PATCH] drm: panel-lvds: Potential Oops in probe error handling
Message-Id: <20190904100329.GE7007@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>, Sam Ravnborg <sam@ravnborg.org>

The "lvds->backlight" pointer could be NULl if of_parse_phandle()
returns NULL.

Fixes: 7c9dff5bd643 ("drm: panels: Add LVDS panel driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/panel/panel-lvds.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index ad47cc95459e..3b4eb959e994 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -272,7 +272,8 @@ static int panel_lvds_probe(struct platform_device *pdev)
 	return 0;
 
 error:
-	put_device(&lvds->backlight->dev);
+	if (lvds->backlight)
+		put_device(&lvds->backlight->dev);
 	return ret;
 }
 
-- 
2.20.1
