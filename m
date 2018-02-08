From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 08 Feb 2018 17:52:07 +0000
Subject: [PATCH] drm/exynos: g2d: Delete an error message for a failed memory allocation in two functions
Message-Id: <f1a7c103-fd17-3a61-61f7-570436e3c452@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Feb 2018 18:42:51 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 2b8bf2dd6387..5eb0d3292525 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -286,7 +286,6 @@ static int g2d_init_cmdlist(struct g2d_data *g2d)
 
 	node = kcalloc(G2D_CMDLIST_NUM, sizeof(*node), GFP_KERNEL);
 	if (!node) {
-		dev_err(dev, "failed to allocate memory\n");
 		ret = -ENOMEM;
 		goto err;
 	}
@@ -1358,10 +1357,9 @@ int exynos_g2d_exec_ioctl(struct drm_device *drm_dev, void *data,
 		return -EFAULT;
 
 	runqueue_node = kmem_cache_alloc(g2d->runqueue_slab, GFP_KERNEL);
-	if (!runqueue_node) {
-		dev_err(dev, "failed to allocate memory\n");
+	if (!runqueue_node)
 		return -ENOMEM;
-	}
+
 	run_cmdlist = &runqueue_node->run_cmdlist;
 	event_list = &runqueue_node->event_list;
 	INIT_LIST_HEAD(run_cmdlist);
-- 
2.16.1

