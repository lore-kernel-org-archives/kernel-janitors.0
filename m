From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 07 Oct 2019 16:25:38 +0000
Subject: Re: [PATCH] drm/amd/powerplay: Fix error handling in smu_init_fb_allocations()
Message-Id: <CADnq5_PVO79Y-2YyZjovuXW9JYBg3Kfp9F7hL0-whzwhbKOr5A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191007090206.GD3865@mwanda>
 <MN2PR12MB32963D6B4480B85DC9DC379FA29B0@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB32963D6B4480B85DC9DC379FA29B0-rweVpJHSKTqAm9ToKNQgFgdYzm3356FpvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Wang, Kevin(Yang)" <Kevin1.Wang-5C7GfCeVMHo@public.gmane.org>
Cc: "Zhou, David(ChunMing)" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, "Deucher,
 Alexander" <Alexander.Deucher-5C7GfCeVMHo@public.gmane.org>, "Quan, Evan" <Evan.Quan-5C7GfCeVMHo@public.gmane.org>, Rex Zhu <rex.zhu-5C7GfCeVMHo@public.gmane.org>, "Koenig, Christian" <Christian.Koenig-5C7GfCeVMHo@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

Applied.  Thanks!

Alex

On Mon, Oct 7, 2019 at 6:32 AM Wang, Kevin(Yang) <Kevin1.Wang@amd.com> wrote:
>
> thanks correct it.
>
> Reviewed-by: Kevin Wang <kevin1.wang@amd.com>
>
> Best Regards,
> Kevin
> ________________________________
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Monday, October 7, 2019 5:02 PM
> To: Rex Zhu <rex.zhu@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
> Cc: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Zhou, David(ChunMing) <David1.Zhou@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; kernel-janitors@vger.kernel.org <kernel-janitors@vger.kernel.org>
> Subject: [PATCH] drm/amd/powerplay: Fix error handling in smu_init_fb_allocations()
>
> The error handling is off by one.  We should not free the first
> "tables[i].bo" without decrementing "i" because that might result in a
> double free.  The second problem is that when an error occurs, then the
> zeroth element "tables[0].bo" isn't freed.
>
> I had make "i" signed int for the error handling to work, so I just
> updated "ret" as well as a clean up.
>
> Fixes: f96357a991b9 ("drm/amd/powerplay: implement smu_init(fini)_fb_allocations function")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> index f1fbbc8b77ee..c9266ea70331 100644
> --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> @@ -896,8 +896,7 @@ static int smu_init_fb_allocations(struct smu_context *smu)
>          struct amdgpu_device *adev = smu->adev;
>          struct smu_table_context *smu_table = &smu->smu_table;
>          struct smu_table *tables = smu_table->tables;
> -       uint32_t i = 0;
> -       int32_t ret = 0;
> +       int ret, i;
>
>          for (i = 0; i < SMU_TABLE_COUNT; i++) {
>                  if (tables[i].size == 0)
> @@ -915,7 +914,7 @@ static int smu_init_fb_allocations(struct smu_context *smu)
>
>          return 0;
>  failed:
> -       for (; i > 0; i--) {
> +       while (--i >= 0) {
>                  if (tables[i].size == 0)
>                          continue;
>                  amdgpu_bo_free_kernel(&tables[i].bo,
> --
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
