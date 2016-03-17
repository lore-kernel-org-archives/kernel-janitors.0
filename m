From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Mar 2016 10:32:15 +0000
Subject: [patch 1/2] drm/exynos: mic: fix an error code
Message-Id: <20160317103214.GA3100@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally return success instead of a negative error code here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is the common problem introduced by do nothing gotos.  The other
issue with do nothing gotos is that they are annoying and don't actually
prevent people from putting a direct return in the middle of functions.

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index 9869d70..890c9b1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -457,6 +457,7 @@ static int exynos_mic_probe(struct platform_device *pdev)
 							"samsung,disp-syscon");
 	if (IS_ERR(mic->sysreg)) {
 		DRM_ERROR("mic: Failed to get system register.\n");
+		ret = PTR_ERR(mic->sysreg);
 		goto err;
 	}
 
