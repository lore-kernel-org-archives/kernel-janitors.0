From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 23 Jan 2020 21:38:57 +0000
Subject: Re: [PATCH] drm/amd/amdgpu: fix spelling mistake "to" -> "too"
Message-Id: <CADnq5_PxfM2i0BxpKtOUeL2+hxLUbwocyWNmd9qzXnOesJfuWg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200123002216.2832146-1-colin.king@canonical.com>
In-Reply-To: <20200123002216.2832146-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Wed, Jan 22, 2020 at 7:22 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a DRM_ERROR message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> index ceb0dbf685f1..59ddba137946 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -652,7 +652,7 @@ static int amdgpu_vce_cs_reloc(struct amdgpu_cs_parser *p, uint32_t ib_idx,
>
>         if ((addr + (uint64_t)size) >
>             (mapping->last + 1) * AMDGPU_GPU_PAGE_SIZE) {
> -               DRM_ERROR("BO to small for addr 0x%010Lx %d %d\n",
> +               DRM_ERROR("BO too small for addr 0x%010Lx %d %d\n",
>                           addr, lo, hi);
>                 return -EINVAL;
>         }
> --
> 2.24.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
