From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 08 May 2017 07:46:40 +0000
Subject: [PATCH] drm/nouveau/secboot: fix some error handling in 'ls_ucode_img_load_gr'
Message-Id: <20170508074640.16922-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

The last goto looks spurious because it releases less resources than the
previous one.
Add a new label in order to free the memory allocated by the 'kmemdup'
call.

Fixes: 9d896f3e41a6 ("drm/nouveau/secboot: abstract LS firmware loading functions")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This fix is just a guess. I don't have the hardware to test it.
At first, I just wanted to change the last 'goto free_data' into a
'goto free_img' in order to have a 'logical' goto layout.
Then, I changed my mind and added another label to revert the 'kmemdup' a
few lines above.

I hope I'm correct :)
---
 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_gr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_gr.c
index d1cf02d22db1..1b83e1395c34 100644
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
@@ -127,10 +128,12 @@ ls_ucode_img_load_gr(const struct nvkm_subdev *subdev, struct ls_ucode_img *img,
 					     &img->ucode_desc);
 	if (IS_ERR(img->ucode_data)) {
 		ret = PTR_ERR(img->ucode_data);
-		goto free_data;
+		goto free_img_sig;
 	}
 	img->ucode_size = img->ucode_desc.image_size;
 
+free_img_sig:
+	kfree(img->sig);
 free_sig:
 	nvkm_firmware_put(sig);
 free_data:
-- 
2.11.0

