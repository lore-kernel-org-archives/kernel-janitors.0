From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2017 18:39:11 +0000
Subject: Re: [PATCH] drm/amdgpu: remove redundant outer loop and remove commented out code
Message-Id: <CADnq5_P8712br5qGWg1FQpy8toQwptgDoG2D66BLhTqESNPggA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170317143722.13473-1-colin.king@canonical.com>
In-Reply-To: <20170317143722.13473-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Tom St Denis <tom.stdenis-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, jimqu <Jim.Qu-5C7GfCeVMHo@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Rex Zhu <Rex.Zhu-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Fri, Mar 17, 2017 at 10:37 AM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The outer loop is redundant and can be removed as it is doing nothing
> useful. Also remove some commented out code that is not being used.
>
> Detected by CoverityScan, CID#1402073
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  thanks!

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/vce_v2_0.c | 27 +++++++--------------------
>  1 file changed, 7 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
> index 9ea99348e493..72dea663f113 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
> @@ -273,24 +273,14 @@ static int vce_v2_0_start(struct amdgpu_device *adev)
>
>  static int vce_v2_0_stop(struct amdgpu_device *adev)
>  {
> -       int i, j;
> +       int i;
>         int status;
>
>         if (vce_v2_0_lmi_clean(adev)) {
>                 DRM_INFO("vce is not idle \n");
>                 return 0;
>         }
> -/*
> -       for (i = 0; i < 10; ++i) {
> -               for (j = 0; j < 100; ++j) {
> -                       status = RREG32(mmVCE_FW_REG_STATUS);
> -                       if (!(status & 1))
> -                               break;
> -                       mdelay(1);
> -               }
> -               break;
> -       }
> -*/
> +
>         if (vce_v2_0_wait_for_idle(adev)) {
>                 DRM_INFO("VCE is busy, Can't set clock gateing");
>                 return 0;
> @@ -299,14 +289,11 @@ static int vce_v2_0_stop(struct amdgpu_device *adev)
>         /* Stall UMC and register bus before resetting VCPU */
>         WREG32_P(mmVCE_LMI_CTRL2, 1 << 8, ~(1 << 8));
>
> -       for (i = 0; i < 10; ++i) {
> -               for (j = 0; j < 100; ++j) {
> -                       status = RREG32(mmVCE_LMI_STATUS);
> -                       if (status & 0x240)
> -                               break;
> -                       mdelay(1);
> -               }
> -               break;
> +       for (i = 0; i < 100; ++i) {
> +               status = RREG32(mmVCE_LMI_STATUS);
> +               if (status & 0x240)
> +                       break;
> +               mdelay(1);
>         }
>
>         WREG32_P(mmVCE_VCPU_CNTL, 0, ~0x80001);
> --
> 2.11.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
