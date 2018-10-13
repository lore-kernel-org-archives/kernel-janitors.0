From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 13 Oct 2018 10:21:40 +0000
Subject: [PATCH] drm/exynos: checking for NULL instead of IS_ERR()
Message-Id: <20181013102140.GB16086@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Inki Dae <inki.dae@samsung.com>, Maciej Purski <m.purski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org

The of_drm_find_panel() function returns error pointers and never NULL
but we the driver assumes that ->panel is NULL when it's not present.

Fixes: 6afb7721e2a0 ("drm/exynos: move connector creation to attach callback")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 07af7758066d..32f256749789 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1527,7 +1527,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 		}
 
 		dsi->panel = of_drm_find_panel(device->dev.of_node);
-		if (dsi->panel) {
+		if (IS_ERR(dsi->panel)) {
+			dsi->panel = NULL;
+		} else {
 			drm_panel_attach(dsi->panel, &dsi->connector);
 			dsi->connector.status = connector_status_connected;
 		}
