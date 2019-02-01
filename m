From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 01 Feb 2019 20:27:57 +0000
Subject: Re: [PATCH][drm-next] drm/amd/amdgpu: fix spelling mistake "matech" -> "match"
Message-Id: <CADnq5_ObHBu6=zZ3Lr0E1AvwwqA3bd8RCQyddc6n188karCTDQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190201104159.19215-1-colin.king@canonical.com>
In-Reply-To: <20190201104159.19215-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Fri, Feb 1, 2019 at 5:42 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a dev_err message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> index dac187454b33..2ae25095e501 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -129,7 +129,7 @@ int amdgpu_xgmi_add_device(struct amdgpu_device *adev)
>         if (!hive) {
>                 ret = -EINVAL;
>                 dev_err(adev->dev,
> -                       "XGMI: node 0x%llx, can not matech hive 0x%llx in the hive list.\n",
> +                       "XGMI: node 0x%llx, can not match hive 0x%llx in the hive list.\n",
>                         adev->gmc.xgmi.node_id, adev->gmc.xgmi.hive_id);
>                 goto exit;
>         }
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
