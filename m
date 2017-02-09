From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 09 Feb 2017 02:07:41 +0000
Subject: Re: [PATCH] drm/amdgpu/virt: fix double kfree on bo_va
Message-Id: <CADnq5_MWcg7qXiFj5=MUqZhAJLH++he3JViNoeLP8fSbcUv8Gw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170203202342.13128-1-colin.king@canonical.com>
In-Reply-To: <20170203202342.13128-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Xiangliang Yu <Xiangliang.Yu@amd.com>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Monk Liu <Monk.Liu@amd.com>

On Fri, Feb 3, 2017 at 3:23 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> bo_va is being kfree'd twice, once in the call to amdgpu_vm_bo_rmv
> and then a short while later. Fix this double free by removing
> the 2nd kfree.
>
> Detected by CoverityScan, CID#1399524 ("Double Free")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  thanks!

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> index 3fd951c..dcfb7df 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> @@ -83,7 +83,6 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>                 DRM_ERROR("failed to do bo_map on static CSA, err=%d\n", r);
>                 amdgpu_vm_bo_rmv(adev, bo_va);
>                 ttm_eu_backoff_reservation(&ticket, &list);
> -               kfree(bo_va);
>                 return r;
>         }
>
> --
> 2.10.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
