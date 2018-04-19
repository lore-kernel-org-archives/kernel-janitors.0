From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Thu, 19 Apr 2018 14:05:44 +0000
Subject: [PATCH 14/61] gpu: drm: msm: dsi: simplify getting .drvdata
Message-Id: <20180419140641.27926-15-wsa+renesas@sang-engineering.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-1-wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

We should get drvdata from struct device directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy. Please apply individually.

 drivers/gpu/drm/msm/dsi/dsi_host.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 7a03a9489708..10ed20736072 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -471,8 +471,7 @@ static void dsi_bus_clk_disable(struct msm_dsi_host *msm_host)
 
 int msm_dsi_runtime_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_dsi *msm_dsi = platform_get_drvdata(pdev);
+	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
 	struct mipi_dsi_host *host = msm_dsi->host;
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 
@@ -486,8 +485,7 @@ int msm_dsi_runtime_suspend(struct device *dev)
 
 int msm_dsi_runtime_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_dsi *msm_dsi = platform_get_drvdata(pdev);
+	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
 	struct mipi_dsi_host *host = msm_dsi->host;
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 
-- 
2.11.0

