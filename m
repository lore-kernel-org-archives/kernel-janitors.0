From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 24 Jun 2020 15:19:16 +0000
Subject: Re: [PATCH] drm/radeon: fix array out-of-bounds read and write issues
Message-Id: <CADnq5_NGQzU6rrrqO4iXTHPSxpAt-w0ayxfrS0jj3K8u38f3hg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200624120710.10957-1-colin.king@canonical.com>
In-Reply-To: <20200624120710.10957-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

Applied.  Thanks!

Alex

On Wed, Jun 24, 2020 at 8:07 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is an off-by-one bounds check on the index into arrays
> table->mc_reg_address and table->mc_reg_table_entry[k].mc_data[j] that
> can lead to reads and writes outside of arrays. Fix the bound checking
> off-by-one error.
>
> Addresses-Coverity: ("Out-of-bounds read/write")
> Fixes: cc8dbbb4f62a ("drm/radeon: add dpm support for CI dGPUs (v2)")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/radeon/ci_dpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_dpm.c
> index 134aa2b01f90..86ac032275bb 100644
> --- a/drivers/gpu/drm/radeon/ci_dpm.c
> +++ b/drivers/gpu/drm/radeon/ci_dpm.c
> @@ -4351,7 +4351,7 @@ static int ci_set_mc_special_registers(struct radeon_device *rdev,
>                                         table->mc_reg_table_entry[k].mc_data[j] |= 0x100;
>                         }
>                         j++;
> -                       if (j > SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE)
> +                       if (j >= SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE)
>                                 return -EINVAL;
>
>                         if (!pi->mem_gddr5) {
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
