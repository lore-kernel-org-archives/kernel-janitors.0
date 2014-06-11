From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jun 2014 06:36:23 +0000
Subject: [patch] drm/exynos: change zero to NULL for sparse
Message-Id: <20140611063623.GA16247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5397F355.4060105@samsung.com>
In-Reply-To: <5397F355.4060105@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org

We recently changed this function to return a pointer instead of an int
so we need to change this zero to a NULL or Sparse complains:

	drivers/gpu/drm/exynos/exynos_drm_drv.h:346:47:
	warning: Using plain integer as NULL pointer

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 36535f3..06cde45 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -343,7 +343,7 @@ struct exynos_drm_display * exynos_dpi_probe(struct device *dev);
 int exynos_dpi_remove(struct device *dev);
 #else
 static inline struct exynos_drm_display *
-exynos_dpi_probe(struct device *dev) { return 0; }
+exynos_dpi_probe(struct device *dev) { return NULL; }
 static inline int exynos_dpi_remove(struct device *dev) { return 0; }
 #endif
 
