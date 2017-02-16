From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Feb 2017 12:00:28 +0000
Subject: [patch v2] drm/msm/dsi: free first element on error
Message-Id: <20170216120028.GA29698@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87a89mnznw.fsf@intel.com>
In-Reply-To: <87a89mnznw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Clark <robdclark@gmail.com>, Archit Taneja <architt@codeaurora.org>
Cc: David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Hai Li <hali@codeaurora.org>, Rob Herring <robh@kernel.org>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org

We're off by one here.  We free something that wasn't allocated and we
don't free msm_host->bus_clks[].

Fixes: 6e0eb52eba9e ("drm/msm/dsi: Parse bus clocks from a list")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 1fc07ce24686..4fa32296162e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -437,7 +437,7 @@ static int dsi_bus_clk_enable(struct msm_dsi_host *msm_host)
 
 	return 0;
 err:
-	for (; i > 0; i--)
+	while (i--)
 		clk_disable_unprepare(msm_host->bus_clks[i]);
 
 	return ret;
