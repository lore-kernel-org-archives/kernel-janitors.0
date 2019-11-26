From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 26 Nov 2019 16:23:38 +0000
Subject: Re: [PATCH] drm/amdgpu: Fix a bug in jpeg_v1_0_start()
Message-Id: <CADnq5_MB-M_AdArX3Bvg765iMiTR-rJLUpJjDmA=azrXAYTa-g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191126121029.3tye7e3gyduxryfr@kili.mountain>
In-Reply-To: <20191126121029.3tye7e3gyduxryfr@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>, Christian K??nig <christian.koenig@amd.com>

On Tue, Nov 26, 2019 at 7:10 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Originally the last WREG32_SOC15() was a part of the if statement block
> but the curly braces are on the wrong line.
>
> Fixes: bb0db70f3f75 ("drm/amdgpu: separate JPEG1.0 code out from VCN1.0")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  Thanks!

Alex

> ---
> From static analysis (Smatch).  Not tested.
>
>  drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
> index 553506df077d..a141408dfb23 100644
> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
> @@ -522,7 +522,8 @@ void jpeg_v1_0_start(struct amdgpu_device *adev, int mode)
>                 WREG32_SOC15(JPEG, 0, mmUVD_LMI_JRBC_RB_64BIT_BAR_HIGH, upper_32_bits(ring->gpu_addr));
>                 WREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_RPTR, 0);
>                 WREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_WPTR, 0);
> -       }       WREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_CNTL, UVD_JRBC_RB_CNTL__RB_RPTR_WR_EN_MASK);
> +               WREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_CNTL, UVD_JRBC_RB_CNTL__RB_RPTR_WR_EN_MASK);
> +       }
>
>         /* initialize wptr */
>         ring->wptr = RREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_WPTR);
> --
> 2.11.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
