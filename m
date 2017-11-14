From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Nov 2017 06:14:35 +0000
Subject: [PATCH] drm/tilcdc: uninitialized variable in tilcdc_get_overlay()
Message-Id: <20171114061434.xkbvrcvu4bgjqqxw@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jyri Sarha <jsarha@ti.com>
Cc: David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

The code seems to assume that of_fdt_unflatten_tree() sets "overlay" to
NULL on error but actually it could be uninitialized.

Fixes: 4e7221580223 ("drm/tilcdc: Add DRM_TILCDC_SLAVE_COMPAT for ti,tilcdc,slave binding support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
index d2b9e5f04724..a8a70b36f0ff 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
@@ -144,7 +144,7 @@ static struct device_node * __init tilcdc_get_overlay(struct kfree_table *kft)
 	const int size = __dtb_tilcdc_slave_compat_end -
 		__dtb_tilcdc_slave_compat_begin;
 	static void *overlay_data;
-	struct device_node *overlay;
+	struct device_node *overlay = NULL;
 
 	if (!size) {
 		pr_warn("%s: No overlay data\n", __func__);
