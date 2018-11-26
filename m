From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 26 Nov 2018 20:36:43 +0000
Subject: Re: [PATCH] drm/amdgpu: fix spelling mistake "Pramater" -> "Parameter"
Message-Id: <CADnq5_Nm_-sLR1OfrXBPsE0YGNCEJ6Wv+sFAa01Am7XLvvpH9g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181126150228.8578-1-colin.king@canonical.com>
In-Reply-To: <20181126150228.8578-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Chunming Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Deucher,
 Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Christian Koenig <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Mon, Nov 26, 2018 at 10:02 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in the module description text and
> a comment too, fix them. Also line break overly long comment.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 8de55f7f1a3a..dd03fe77b3ed 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -454,9 +454,10 @@ module_param_named(cntl_sb_buf_per_se, amdgpu_cntl_sb_buf_per_se, int, 0444);
>
>  /**
>   * DOC: param_buf_per_se (int)
> - * Override the size of Off-Chip Pramater Cache per Shader Engine in Byte. The default is 0 (depending on gfx).
> + * Override the size of Off-Chip Parameter Cache per Shader Engine in Byte.
> + * The default is 0 (depending on gfx).
>   */
> -MODULE_PARM_DESC(param_buf_per_se, "the size of Off-Chip Pramater Cache per Shader Engine (default depending on gfx)");
> +MODULE_PARM_DESC(param_buf_per_se, "the size of Off-Chip Parameter Cache per Shader Engine (default depending on gfx)");
>  module_param_named(param_buf_per_se, amdgpu_param_buf_per_se, int, 0444);
>
>  /**
> --
> 2.19.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
