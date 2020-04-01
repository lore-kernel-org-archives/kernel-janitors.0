From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 01 Apr 2020 18:16:22 +0000
Subject: Re: [PATCH][next] drm/amdgpu/vcn: fix spelling mistake "fimware" -> "firmware"
Message-Id: <CADnq5_OZ2Wfqpby69aTXy1OCE25ncMNZ=PqZh=jN7gX1s1h2ew@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200401163545.263372-1-colin.king@canonical.com>
In-Reply-To: <20200401163545.263372-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Wed, Apr 1, 2020 at 12:35 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a dev_err error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index 328b6ceb80de..d653a18dcbc3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -187,7 +187,7 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
>                                 PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM, &adev->vcn.inst[i].fw_shared_bo,
>                                 &adev->vcn.inst[i].fw_shared_gpu_addr, &adev->vcn.inst[i].fw_shared_cpu_addr);
>                 if (r) {
> -                       dev_err(adev->dev, "VCN %d (%d) failed to allocate fimware shared bo\n", i, r);
> +                       dev_err(adev->dev, "VCN %d (%d) failed to allocate firmware shared bo\n", i, r);
>                         return r;
>                 }
>         }
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
