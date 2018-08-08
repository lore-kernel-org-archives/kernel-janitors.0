From: Colin King <colin.king@canonical.com>
Date: Wed, 08 Aug 2018 17:18:33 +0000
Subject: [PATCH][next] drm/msm: a6xx: fix spelling mistake: "initalization" -> "initialization"
Message-Id: <20180808171833.8789-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jordan Crouse <jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err message and comment

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index fbb501986720..bbb8126ec5c5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -125,7 +125,7 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 		val = 0xbabeface, 100, 10000);
 
 	if (ret)
-		dev_err(gmu->dev, "GMU firmware initalization timed out\n");
+		dev_err(gmu->dev, "GMU firmware initialization timed out\n");
 
 	return ret;
 }
@@ -1034,7 +1034,7 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
 
 	/*
 	 * The GMU handles its own frequency switching so build a list of
-	 * available frequencies to send during initalization
+	 * available frequencies to send during initialization
 	 */
 	ret = dev_pm_opp_of_add_table(gmu->dev);
 	if (ret) {
-- 
2.17.1

