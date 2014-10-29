From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Oct 2014 16:26:07 +0000
Subject: Re: [patch] drm/radeon: remove some buggy dead code
Message-Id: <CADnq5_NryAMC=h_3f-iHH1pk7tZq23426ktpfhH1Hocn5FWCkA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141029154707.GA5290@mwanda>
In-Reply-To: <20141029154707.GA5290@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, kernel-janitors@vger.kernel.org, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>

On Wed, Oct 29, 2014 at 11:47 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> The calculation of "num_shader_engines" has a precedence bug because
> the right shift happens before the mask, but this variable is never used
> so we can just delete it.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied in preference to Joe Perches's patch.

Thanks!

Alex

>
> diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
> index a31f1ca..f37d39d 100644
> --- a/drivers/gpu/drm/radeon/evergreen.c
> +++ b/drivers/gpu/drm/radeon/evergreen.c
> @@ -3005,7 +3005,7 @@ static void evergreen_gpu_init(struct radeon_device *rdev)
>         u32 vgt_cache_invalidation;
>         u32 hdp_host_path_cntl, tmp;
>         u32 disabled_rb_mask;
> -       int i, j, num_shader_engines, ps_thread_count;
> +       int i, j, ps_thread_count;
>
>         switch (rdev->family) {
>         case CHIP_CYPRESS:
> @@ -3303,8 +3303,6 @@ static void evergreen_gpu_init(struct radeon_device *rdev)
>         rdev->config.evergreen.tile_config |>                 ((gb_addr_config & 0x30000000) >> 28) << 12;
>
> -       num_shader_engines = (gb_addr_config & NUM_SHADER_ENGINES(3) >> 12) + 1;
> -
>         if ((rdev->family >= CHIP_CEDAR) && (rdev->family <= CHIP_HEMLOCK)) {
>                 u32 efuse_straps_4;
>                 u32 efuse_straps_3;
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
