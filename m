From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 10 Nov 2018 02:45:52 +0000
Subject: [PATCH -next] drm/panel: Remove set but not used variable 'config'
Message-Id: <1541817952-20499-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/panel/panel-truly-nt35597.c: In function 'truly_nt35597_panel_add':
drivers/gpu/drm/panel/panel-truly-nt35597.c:488:31: warning:
 variable 'config' set but not used [-Wunused-but-set-variable]

It never used since introdution in
  1dd0b147c1ff ("drm/panel: Add support for Truly NT35597 panel driver")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/panel/panel-truly-nt35597.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-truly-nt35597.c b/drivers/gpu/drm/panel/panel-truly-nt35597.c
index fc2a66c..2d5a540 100644
--- a/drivers/gpu/drm/panel/panel-truly-nt35597.c
+++ b/drivers/gpu/drm/panel/panel-truly-nt35597.c
@@ -485,9 +485,7 @@ static int truly_nt35597_panel_add(struct truly_nt35597 *ctx)
 {
 	struct device *dev = ctx->dev;
 	int ret, i;
-	const struct nt35597_config *config;
 
-	config = ctx->config;
 	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++)
 		ctx->supplies[i].supply = regulator_names[i];
