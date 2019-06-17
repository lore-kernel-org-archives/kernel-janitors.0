From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 Jun 2019 15:06:14 +0000
Subject: Re: [PATCH] drm/amd/powerplay: Delete a redundant memory setting in vega20_set_default_od8_setttings
Message-Id: <CADnq5_MKRU6-iCJZWwpR8z+mmdkgVh_STJtVJCiSTec21e+oqA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <de3f6a5e-8ac4-bc8e-0d0c-3a4a5db283e9@web.de>
In-Reply-To: <de3f6a5e-8ac4-bc8e-0d0c-3a4a5db283e9-S0/GAf8tV78@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring-S0/GAf8tV78@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Evan Quan <evan.quan-5C7GfCeVMHo@public.gmane.org>, Rex Zhu <rex.zhu-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

Applied this and the dc patch.

Thanks!

Alex

On Mon, Jun 17, 2019 at 10:07 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 17 Jun 2019 14:24:14 +0200
>
> The memory was set to zero already by a call of the function “kzalloc”.
> Thus remove an extra call of the function “memset” for this purpose.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/amd/powerplay/vega20_ppt.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> index 4aa8f5a69c4c..62497ad66a39 100644
> --- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> @@ -1295,7 +1295,6 @@ static int vega20_set_default_od8_setttings(struct smu_context *smu)
>         if (!table_context->od8_settings)
>                 return -ENOMEM;
>
> -       memset(table_context->od8_settings, 0, sizeof(struct vega20_od8_settings));
>         od8_settings = (struct vega20_od8_settings *)table_context->od8_settings;
>
>         if (smu_feature_is_enabled(smu, FEATURE_DPM_SOCCLK_BIT)) {
> --
> 2.22.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
