From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 08 May 2017 09:46:02 +0000
Subject: Re: [Nouveau] [PATCH] drm/nouveau/secboot: fix some error handling in 'ls_ucode_img_load_gr'
Message-Id: <CACvgo51qBNs7brqa1SEig+XoSom6J=MBnX1rs8Gsswmp=q4HrA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: ML nouveau <nouveau@lists.freedesktop.org>, kernel-janitors@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>

Hi Christophe,

s/fix some error handling in 'ls_ucode_img_load_gr/plug memory leak in
ls_ucode_img_load_gr() error path/

On 8 May 2017 at 08:46, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> The last goto looks spurious because it releases less resources than the
> previous one.
> Add a new label in order to free the memory allocated by the 'kmemdup'
> call.
>
> Fixes: 9d896f3e41a6 ("drm/nouveau/secboot: abstract LS firmware loading functions")
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This fix is just a guess. I don't have the hardware to test it.
> At first, I just wanted to change the last 'goto free_data' into a
> 'goto free_img' in order to have a 'logical' goto layout.
> Then, I changed my mind and added another label to revert the 'kmemdup' a
> few lines above.
>
> I hope I'm correct :)
Coffee hasn't kicked in fully, but I think this is off. This free()
will be called even on success leading to issues.

> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_gr.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_gr.c
> index d1cf02d22db1..1b83e1395c34 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_gr.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_gr.c
> @@ -116,6 +116,7 @@ ls_ucode_img_load_gr(const struct nvkm_subdev *subdev, struct ls_ucode_img *img,
>         ret = nvkm_firmware_get(subdev->device, f, &sig);
>         if (ret)
>                 goto free_data;
> +
>         img->sig = kmemdup(sig->data, sig->size, GFP_KERNEL);
>         if (!img->sig) {
>                 ret = -ENOMEM;
> @@ -127,10 +128,12 @@ ls_ucode_img_load_gr(const struct nvkm_subdev *subdev, struct ls_ucode_img *img,
>                                              &img->ucode_desc);
>         if (IS_ERR(img->ucode_data)) {
>                 ret = PTR_ERR(img->ucode_data);
> -               goto free_data;
> +               goto free_img_sig;
Thus I'd just move the free here and use goto free_sig.

Regards,
Emil
