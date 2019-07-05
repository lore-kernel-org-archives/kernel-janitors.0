From: Colin King <colin.king@canonical.com>
Date: Fri, 05 Jul 2019 15:55:49 +0000
Subject: [PATCH][next] drm/exynos: remove redundant assignment to pointer 'node'
Message-Id: <20190705155549.15836-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer 'node' is being assigned with a value that is never
read and is re-assigned later. The assignment is redundant and
can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 50904eee96f7..2a3382d43bc9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -267,7 +267,7 @@ static inline void g2d_hw_reset(struct g2d_data *g2d)
 static int g2d_init_cmdlist(struct g2d_data *g2d)
 {
 	struct device *dev = g2d->dev;
-	struct g2d_cmdlist_node *node = g2d->cmdlist_node;
+	struct g2d_cmdlist_node *node;
 	int nr;
 	int ret;
 	struct g2d_buf_info *buf_info;
-- 
2.20.1
