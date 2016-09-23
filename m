From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 23 Sep 2016 16:39:04 +0000
Subject: [PATCH 3/3] drm/vmwgfx: Adjust checks for null pointers in 13 functions
Message-Id: <92437e11-dd21-7517-3ddd-431a9703f4ad@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8de6f7c3-5614-b210-7b2f-66c1aed4279b@users.sourceforge.net>
In-Reply-To: <8de6f7c3-5614-b210-7b2f-66c1aed4279b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com, David Airlie <airlied@linux.ie>, Sinclair Yeh <syeh@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 23 Sep 2016 17:53:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" can point information out like the following.

Comparison to NULL could be written !=85

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 31 +++++++++++++++--------------=
--
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_surface.c
index 15504c6..b445ce9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -324,7 +324,7 @@ static void vmw_hw_surface_destroy(struct vmw_resource =
*res)
 	if (res->id !=3D -1) {
=20
 		cmd =3D vmw_fifo_reserve(dev_priv, vmw_surface_destroy_size());
-		if (unlikely(cmd =3D NULL)) {
+		if (unlikely(!cmd)) {
 			DRM_ERROR("Failed reserving FIFO space for surface "
 				  "destruction.\n");
 			return;
@@ -397,7 +397,7 @@ static int vmw_legacy_srf_create(struct vmw_resource *r=
es)
=20
 	submit_size =3D vmw_surface_define_size(srf);
 	cmd =3D vmw_fifo_reserve(dev_priv, submit_size);
-	if (unlikely(cmd =3D NULL)) {
+	if (unlikely(!cmd)) {
 		DRM_ERROR("Failed reserving FIFO space for surface "
 			  "creation.\n");
 		ret =3D -ENOMEM;
@@ -446,11 +446,10 @@ static int vmw_legacy_srf_dma(struct vmw_resource *re=
s,
 	uint8_t *cmd;
 	struct vmw_private *dev_priv =3D res->dev_priv;
=20
-	BUG_ON(val_buf->bo =3D NULL);
-
+	BUG_ON(!val_buf->bo);
 	submit_size =3D vmw_surface_dma_size(srf);
 	cmd =3D vmw_fifo_reserve(dev_priv, submit_size);
-	if (unlikely(cmd =3D NULL)) {
+	if (unlikely(!cmd)) {
 		DRM_ERROR("Failed reserving FIFO space for surface "
 			  "DMA.\n");
 		return -ENOMEM;
@@ -538,7 +537,7 @@ static int vmw_legacy_srf_destroy(struct vmw_resource *=
res)
=20
 	submit_size =3D vmw_surface_destroy_size();
 	cmd =3D vmw_fifo_reserve(dev_priv, submit_size);
-	if (unlikely(cmd =3D NULL)) {
+	if (unlikely(!cmd)) {
 		DRM_ERROR("Failed reserving FIFO space for surface "
 			  "eviction.\n");
 		return -ENOMEM;
@@ -578,7 +577,7 @@ static int vmw_surface_init(struct vmw_private *dev_pri=
v,
 	int ret;
 	struct vmw_resource *res =3D &srf->res;
=20
-	BUG_ON(res_free =3D NULL);
+	BUG_ON(!res_free);
 	if (!dev_priv->has_mob)
 		vmw_fifo_resource_inc(dev_priv);
 	ret =3D vmw_resource_init(dev_priv, res, true, res_free,
@@ -747,7 +746,7 @@ int vmw_surface_define_ioctl(struct drm_device *dev, vo=
id *data,
 	}
=20
 	user_srf =3D kzalloc(sizeof(*user_srf), GFP_KERNEL);
-	if (unlikely(user_srf =3D NULL)) {
+	if (unlikely(!user_srf)) {
 		ret =3D -ENOMEM;
 		goto out_no_user_srf;
 	}
@@ -772,7 +771,7 @@ int vmw_surface_define_ioctl(struct drm_device *dev, vo=
id *data,
 	srf->offsets =3D kmalloc_array(srf->num_sizes,
 				     sizeof(*srf->offsets),
 				     GFP_KERNEL);
-	if (unlikely(srf->offsets =3D NULL)) {
+	if (unlikely(!srf->offsets)) {
 		ret =3D -ENOMEM;
 		goto out_no_offsets;
 	}
@@ -914,7 +913,7 @@ vmw_surface_handle_reference(struct vmw_private *dev_pr=
iv,
=20
 	ret =3D -EINVAL;
 	base =3D ttm_base_object_lookup_for_ref(dev_priv->tdev, handle);
-	if (unlikely(base =3D NULL)) {
+	if (unlikely(!base)) {
 		DRM_ERROR("Could not find surface to reference.\n");
 		goto out_no_lookup;
 	}
@@ -1060,7 +1059,7 @@ static int vmw_gb_surface_create(struct vmw_resource =
*res)
=20
 	cmd =3D vmw_fifo_reserve(dev_priv, submit_len);
 	cmd2 =3D (typeof(cmd2))cmd;
-	if (unlikely(cmd =3D NULL)) {
+	if (unlikely(!cmd)) {
 		DRM_ERROR("Failed reserving FIFO space for surface "
 			  "creation.\n");
 		ret =3D -ENOMEM;
@@ -1126,7 +1125,7 @@ static int vmw_gb_surface_bind(struct vmw_resource *r=
es,
 	submit_size =3D sizeof(*cmd1) + (res->backup_dirty ? sizeof(*cmd2) : 0);
=20
 	cmd1 =3D vmw_fifo_reserve(dev_priv, submit_size);
-	if (unlikely(cmd1 =3D NULL)) {
+	if (unlikely(!cmd1)) {
 		DRM_ERROR("Failed reserving FIFO space for surface "
 			  "binding.\n");
 		return -ENOMEM;
@@ -1176,7 +1175,7 @@ static int vmw_gb_surface_unbind(struct vmw_resource =
*res,
=20
 	submit_size =3D sizeof(*cmd3) + (readback ? sizeof(*cmd1) : sizeof(*cmd2)=
);
 	cmd =3D vmw_fifo_reserve(dev_priv, submit_size);
-	if (unlikely(cmd =3D NULL)) {
+	if (unlikely(!cmd)) {
 		DRM_ERROR("Failed reserving FIFO space for surface "
 			  "unbinding.\n");
 		return -ENOMEM;
@@ -1235,7 +1234,7 @@ static int vmw_gb_surface_destroy(struct vmw_resource=
 *res)
 	vmw_binding_res_list_scrub(&res->binding_head);
=20
 	cmd =3D vmw_fifo_reserve(dev_priv, sizeof(*cmd));
-	if (unlikely(cmd =3D NULL)) {
+	if (unlikely(!cmd)) {
 		DRM_ERROR("Failed reserving FIFO space for surface "
 			  "destruction.\n");
 		mutex_unlock(&dev_priv->binding_mutex);
@@ -1401,7 +1400,7 @@ int vmw_gb_surface_reference_ioctl(struct drm_device =
*dev, void *data,
=20
 	user_srf =3D container_of(base, struct vmw_user_surface, prime.base);
 	srf =3D &user_srf->srf;
-	if (srf->res.backup =3D NULL) {
+	if (!srf->res.backup) {
 		DRM_ERROR("Shared GB surface is missing a backup buffer.\n");
 		goto out_bad_resource;
 	}
@@ -1515,7 +1514,7 @@ int vmw_surface_gb_priv_define(struct drm_device *dev,
 	}
=20
 	user_srf =3D kzalloc(sizeof(*user_srf), GFP_KERNEL);
-	if (unlikely(user_srf =3D NULL)) {
+	if (unlikely(!user_srf)) {
 		ret =3D -ENOMEM;
 		goto out_no_user_srf;
 	}
--=20
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
