From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 06 Jul 2020 16:06:36 +0000
Subject: Re: [PATCH -next] drm/amdgpu: remove set but not used variable 'adev'
Message-Id: <CADnq5_M35jhfPDCGaYxYBxMcptVJjcXw5qSy-PLTh0Z8vjSFZA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200702015552.42377-1-yuehaibing@huawei.com>
In-Reply-To: <20200702015552.42377-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>, "Kuehling, Felix" <Felix.Kuehling@amd.com>, tiancyin <tianci.yin@amd.com>, kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Sumit Semwal <sumit.semwal@linaro.org>, "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>, Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>, linux-media <linux-media@vger.kernel.org>, Christian Koenig <christian.koenig@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>

On Thu, Jul 2, 2020 at 3:25 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_init_mem_type':
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:81:24: warning:
>  variable 'adev' set but not used [-Wunused-but-set-variable]
>   struct amdgpu_device *adev;
>                         ^
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

With our current -next tree, this patch is no longer applicable.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index bb95627ad2cc..8199702d3354 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -78,10 +78,6 @@
>  static int amdgpu_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
>                                 struct ttm_mem_type_manager *man)
>  {
> -       struct amdgpu_device *adev;
> -
> -       adev = amdgpu_ttm_adev(bdev);
> -
>         switch (type) {
>         case TTM_PL_SYSTEM:
>                 /* System memory */
>
>
>
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
