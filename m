From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 28 Apr 2020 14:14:59 +0000
Subject: [PATCH -next] drm/mcde: dsi: Fix return value check in dev_err()
Message-Id: <20200428141459.87624-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

In case of error, the function of_drm_find_bridge() returns NULL pointer
not ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 7af5ebb0c436..e705afc08c4e 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1073,10 +1073,9 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 			panel = NULL;
 
 			bridge = of_drm_find_bridge(child);
-			if (IS_ERR(bridge)) {
-				dev_err(dev, "failed to find bridge (%ld)\n",
-					PTR_ERR(bridge));
-				return PTR_ERR(bridge);
+			if (!bridge) {
+				dev_err(dev, "failed to find bridge\n");
+				return -EINVAL;
 			}
 		}
 	}
