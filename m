From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Thu, 19 Apr 2018 14:05:42 +0000
Subject: [PATCH 12/61] gpu: drm: msm: adreno: simplify getting .drvdata
Message-Id: <20180419140641.27926-13-wsa+renesas@sang-engineering.com>
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

 drivers/gpu/drm/msm/adreno/adreno_device.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 8e0cb161754b..125c115c7ab4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -301,16 +301,14 @@ static const struct of_device_id dt_match[] = {
 #ifdef CONFIG_PM
 static int adreno_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_gpu *gpu = platform_get_drvdata(pdev);
+	struct msm_gpu *gpu = dev_get_drvdata(dev);
 
 	return gpu->funcs->pm_resume(gpu);
 }
 
 static int adreno_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_gpu *gpu = platform_get_drvdata(pdev);
+	struct msm_gpu *gpu = dev_get_drvdata(dev);
 
 	return gpu->funcs->pm_suspend(gpu);
 }
-- 
2.11.0

