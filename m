From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 21 Jan 2019 13:59:52 +0000
Subject: [PATCH] drm/komeda: Fix a signedness bug
Message-Id: <20190121135952.GA14103@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James (Qian) Wang" <james.qian.wang@arm.com>
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

The mdev->irq value comes from platform_get_irq() so it can't be more
than INT_MAX and if it's unsigned then it breaks the error handling in
komeda_parse_dt().

Fixes: 29e56aec911d ("drm/komeda: Add DT parsing")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
index a0bf7050037a..a52da6180c69 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
@@ -82,7 +82,7 @@ struct komeda_dev {
 	struct clk *mclk;
 
 	/** @irq: irq number */
-	u32 irq;
+	int irq;
 
 	int n_pipelines;
 	struct komeda_pipeline *pipelines[KOMEDA_MAX_PIPELINES];
-- 
2.17.1
