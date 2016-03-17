From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Mar 2016 10:39:12 +0000
Subject: [patch 2/2] drm/exynos: mic: remove some dead code
Message-Id: <20160317103912.GB3100@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Inki Dae <inki.dae@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>

We know "ret" is zero and the test makes static checkers complain so
let's delete this printk.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index 890c9b1..12db353 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -130,8 +130,6 @@ static void mic_set_path(struct exynos_mic *mic, bool enable)
 		val &= ~(MIC0_RGB_MUX | MIC0_I80_MUX | MIC0_ON_MUX);
 
 	regmap_write(mic->sysreg, DSD_CFG_MUX, val);
-	if (ret)
-		DRM_ERROR("mic: Failed to read system register\n");
 }
 
 static int mic_sw_reset(struct exynos_mic *mic)
