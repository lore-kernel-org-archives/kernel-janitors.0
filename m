From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 08 May 2017 12:30:43 +0000
Subject: [PATCH v2] drm/nouveau/secboot: plug memory leak in ls_ucode_img_load_gr() error path
Message-Id: <20170508123043.18127-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bskeggs@redhat.com, airlied@linux.ie, acourbot@nvidia.com
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The last goto looks spurious because it releases less resources than the
previous one.
Also free 'img->sig' if 'ls_ucode_img_build()' fails.

Fixes: 9d896f3e41a6 ("drm/nouveau/secboot: abstract LS firmware loading functions")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: update topic
    only free 'img->sig' if 'ls_ucode_img_build()' fails
---
 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_gr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_gr.c
index d1cf02d22db1..1b0c793c0192 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_gr.c
@@ -116,6 +116,7 @@ ls_ucode_img_load_gr(const struct nvkm_subdev *subdev, struct ls_ucode_img *img,
 	ret = nvkm_firmware_get(subdev->device, f, &sig);
 	if (ret)
 		goto free_data;
+
 	img->sig = kmemdup(sig->data, sig->size, GFP_KERNEL);
 	if (!img->sig) {
 		ret = -ENOMEM;
@@ -126,8 +127,9 @@ ls_ucode_img_load_gr(const struct nvkm_subdev *subdev, struct ls_ucode_img *img,
 	img->ucode_data = ls_ucode_img_build(bl, code, data,
 					     &img->ucode_desc);
 	if (IS_ERR(img->ucode_data)) {
+		kfree(img->sig);
 		ret = PTR_ERR(img->ucode_data);
-		goto free_data;
+		goto free_sig;
 	}
 	img->ucode_size = img->ucode_desc.image_size;
 
-- 
2.11.0

