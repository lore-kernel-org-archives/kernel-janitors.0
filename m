From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Jan 2021 15:50:00 +0000
Subject: Re: [PATCH] drm/amdgpu: fix bitwise vs logical negate
Message-Id: <CADnq5_PL8baNFhVpydh02gDbk88aqeFC76wox9qZXXEXzf6uQQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YA6FW84XDSakXqNb@mwanda>
In-Reply-To: <YA6FW84XDSakXqNb@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Aaron Liu <aaron.liu@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Liu ChengZhe <ChengZhe.Liu@amd.com>, Huang Rui <ray.huang@amd.com>, Daniel Vetter <daniel@ffwll.ch>, Jiansong Chen <Jiansong.Chen@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>

On Mon, Jan 25, 2021 at 3:46 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> There was a mixup between logical and bitwise negate so it just sets
> "data1" and "data2" to zero.
>
> Fixes: 3c9a7b7d6e75 ("drm/amdgpu: update mmhub mgcg&ls for mmhub_v2_3")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Someone else sent the same fix last week.  Applied that one.

Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> index 1961745e89c7..ab9be5ad5a5f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> @@ -531,12 +531,12 @@ mmhub_v2_3_update_medium_grain_light_sleep(struct amdgpu_device *adev,
>
>         if (enable && (adev->cg_flags & AMD_CG_SUPPORT_MC_LS)) {
>                 data &= ~MM_ATC_L2_CGTT_CLK_CTRL__MGLS_OVERRIDE_MASK;
> -               data1 &= !(DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
> +               data1 &= ~(DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
>                         DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_WRITE_MASK |
>                         DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_READ_MASK |
>                         DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_RETURN_MASK |
>                         DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_REGISTER_MASK);
> -               data2 &= !(DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
> +               data2 &= ~(DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
>                         DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_WRITE_MASK |
>                         DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_READ_MASK |
>                         DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_RETURN_MASK |
> --
> 2.29.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
