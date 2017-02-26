From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 26 Feb 2017 12:10:57 +0000
Subject: [PATCH v2] drm/msm/dsi: Fix the releasing of resources in error path in 'dsi_bus_clk_enable()'
Message-Id: <20170226121057.9717-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, hali-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

If a 'clk_prepare_enable()' fails, then we need to disable_unprepare the
clk already handled.

With the current implemenatation, we try to do that on the clk that has
triggered the error, which is a no-op and leave msm_host->bus_clks[0]
untouched.

Count forward in order to fix it and be more future proof.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: change the for loop from a backward to a forward one, to ease reading.
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 1fc07ce24686..e6f56cd8ce08 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -422,7 +422,7 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 static int dsi_bus_clk_enable(struct msm_dsi_host *msm_host)
 {
 	const struct msm_dsi_config *cfg = msm_host->cfg_hnd->cfg;
-	int i, ret;
+	int i, j, ret;
 
 	DBG("id=%d", msm_host->id);
 
@@ -437,8 +437,8 @@ static int dsi_bus_clk_enable(struct msm_dsi_host *msm_host)
 
 	return 0;
 err:
-	for (; i > 0; i--)
-		clk_disable_unprepare(msm_host->bus_clks[i]);
+	for (j = 0; j < i; j++)
+		clk_disable_unprepare(msm_host->bus_clks[j]);
 
 	return ret;
 }
-- 
2.9.3

