From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 May 2016 19:54:57 +0000
Subject: [patch] drm/exynos/hdmi: add a missing tab
Message-Id: <20160512195457.GA19095@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>

Smatch warns that the if statement isn't indented.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 0f87acb..748e62f 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1612,7 +1612,7 @@ static int hdmi_clk_init(struct hdmi_context *hdata)
 
 	clks = devm_kzalloc(dev, sizeof(*clks) * count, GFP_KERNEL);
 	if (!clks)
-	return -ENOMEM;
+		return -ENOMEM;
 
 	hdata->clk_gates = clks;
 	hdata->clk_muxes = clks + drv_data->clk_gates.count;
