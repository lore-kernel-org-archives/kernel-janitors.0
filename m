From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Jan 2016 13:10:24 +0000
Subject: [patch] drm/etnaviv: unlock on error in etnaviv_gem_get_iova()
Message-Id: <20160104131024.GA13563@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@arm.linux.org.uk>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

We have to drop a lock before returning -ENOMEM here.

Fixes: a8c21a5451d8 ('drm/etnaviv: add initial etnaviv DRM driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 8d6f859..9f77c3b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -305,8 +305,10 @@ int etnaviv_gem_get_iova(struct etnaviv_gpu *gpu,
 	mapping = etnaviv_gem_get_vram_mapping(etnaviv_obj, NULL);
 	if (!mapping) {
 		mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
-		if (!mapping)
-			return -ENOMEM;
+		if (!mapping) {
+			ret = -ENOMEM;
+			goto out;
+		}
 
 		INIT_LIST_HEAD(&mapping->scan_node);
 		mapping->object = etnaviv_obj;
