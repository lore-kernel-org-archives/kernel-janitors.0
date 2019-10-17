From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Oct 2019 19:39:14 +0000
Subject: Re: [PATCH] drm/amdgpu/vi: silence an uninitialized variable warning
Message-Id: <CADnq5_N50-qL9KStb9_1kSqHgXb3fO=AzqOgAVzKDHSONZPXvw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191017091216.GA31278@mwanda>
In-Reply-To: <20191017091216.GA31278@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Jim Qu <Jim.Qu-5C7GfCeVMHo@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Evan Quan <evan.quan-5C7GfCeVMHo@public.gmane.org>, Rex Zhu <rex.zhu-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Thu, Oct 17, 2019 at 5:12 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Smatch complains that we need to initialized "*cap" otherwise it can
> lead to an uninitialized variable bug in the caller.  This seems like a
> reasonable warning and it doesn't hurt to silence it at least.
>
> drivers/gpu/drm/amd/amdgpu/vi.c:767 vi_asic_reset_method() error: uninitialized symbol 'baco_reset'.
>
> Fixes: 425db2553e43 ("drm/amdgpu: expose BACO interfaces to upper level from PP")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/powerplay/amd_powerplay.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> index 83196b79edd5..f4ff15378e61 100644
> --- a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> +++ b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> @@ -1421,6 +1421,7 @@ static int pp_get_asic_baco_capability(void *handle, bool *cap)
>  {
>         struct pp_hwmgr *hwmgr = handle;
>
> +       *cap = false;
>         if (!hwmgr)
>                 return -EINVAL;
>
> --
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
