From: Colin King <colin.king@canonical.com>
Date: Mon, 22 Jul 2019 22:25:35 +0000
Subject: [PATCH] drm/exynos: fix missing decrement of retry counter
Message-Id: <20190722222535.19114-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the retry counter is not being decremented, leading to a
potential infinite spin if the scalar_reads don't change state.

Addresses-Coverity: ("Infinite loop")
Fixes: 280e54c9f614 ("drm/exynos: scaler: Reset hardware before starting the operation")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/exynos/exynos_drm_scaler.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
index 9af096479e1c..b24ba948b725 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
@@ -94,12 +94,12 @@ static inline int scaler_reset(struct scaler_context *scaler)
 	scaler_write(SCALER_CFG_SOFT_RESET, SCALER_CFG);
 	do {
 		cpu_relax();
-	} while (retry > 1 &&
+	} while (--retry > 1 &&
 		 scaler_read(SCALER_CFG) & SCALER_CFG_SOFT_RESET);
 	do {
 		cpu_relax();
 		scaler_write(1, SCALER_INT_EN);
-	} while (retry > 0 && scaler_read(SCALER_INT_EN) != 1);
+	} while (--retry > 0 && scaler_read(SCALER_INT_EN) != 1);
 
 	return retry ? 0 : -EIO;
 }
-- 
2.20.1
