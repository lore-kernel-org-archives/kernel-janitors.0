From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 04 Dec 2019 06:02:20 +0000
Subject: [PATCH] drm/msm/a6xx: Fix a typo in an error message
Message-Id: <20191204060220.12563-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, jcrouse@codeaurora.org, dianders@chromium.org, mamtashukla555@gmail.com
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, freedreno@lists.freedesktop.org

'in' is duplicated in the error message. Axe one of them.
While at it, slighly improve indentation.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 85f14feafdec..d04e631ab3dc 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1051,8 +1051,8 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 
 		if (j = pri_count) {
 			DRM_DEV_ERROR(dev,
-				"Level %u not found in in the RPMh list\n",
-					level);
+				      "Level %u not found in the RPMh list\n",
+				      level);
 			DRM_DEV_ERROR(dev, "Available levels:\n");
 			for (j = 0; j < pri_count; j++)
 				DRM_DEV_ERROR(dev, "  %u\n", pri[j]);
-- 
2.20.1
