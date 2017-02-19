From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 19 Feb 2017 16:59:42 +0000
Subject: [PATCH] drm/rockchip: cdn-dp: Fix error handling
Message-Id: <20170219165942.17268-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mark.yao@rock-chips.com, airlied@linux.ie, heiko@sntech.de
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

It is likely that both 'clk_disable_unprepare()' should be called if
'pm_runtime_get_sync()' fails.

Add a new label for that, because 'err_set_rate' is not meaningful in this
case.


Fixes: 1a0f7ed3abe2 ("drm/rockchip: cdn-dp: add cdn DP support for rk3399")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Not sure but a 'pm_runtime_get_sync()' is maybe also required in the
'err_set_rate' path.
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 9ab67a670885..0fe1ec8b8fb1 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -111,7 +111,7 @@ static int cdn_dp_clk_enable(struct cdn_dp_device *dp)
 	ret = pm_runtime_get_sync(dp->dev);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dp->dev, "cannot get pm runtime %d\n", ret);
-		goto err_pclk;
+		goto err_sync;
 	}
 
 	reset_control_assert(dp->core_rst);
@@ -133,6 +133,7 @@ static int cdn_dp_clk_enable(struct cdn_dp_device *dp)
 	return 0;
 
 err_set_rate:
+err_sync:
 	clk_disable_unprepare(dp->core_clk);
 err_core_clk:
 	clk_disable_unprepare(dp->pclk);
-- 
2.9.3

