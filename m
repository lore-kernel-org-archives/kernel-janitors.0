From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 May 2018 08:04:45 +0000
Subject: [PATCH] drm/exynos: fimc: signedness bug in fimc_setup_clocks()
Message-Id: <20180518080445.GB28335@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org

"id" needs to be signed for the error handling to work.

Fixes: 7a2d5c77c558 ("drm/exynos: fimc: Convert driver to IPP v2 core API")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 4dfbfc7f3b84..5ce84025d1cb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1200,7 +1200,7 @@ static int fimc_setup_clocks(struct fimc_context *ctx)
 
 int exynos_drm_check_fimc_device(struct device *dev)
 {
-	unsigned int id = of_alias_get_id(dev->of_node, "fimc");
+	int id = of_alias_get_id(dev->of_node, "fimc");
 
 	if (id >= 0 && (BIT(id) & fimc_mask))
 		return 0;
