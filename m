From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 02 Oct 2013 13:58:53 +0000
Subject: Re: [patch] drm/radeon/dpm: cleanup a type issue with rv6xx_clocks_per_unit()
Message-Id: <CADnq5_OHzXsDL-w-6kZTJQBzZ0UDTfciLadEtH-_6RXUiR9=Yg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130702062255.GB24410@elgon.mountain>
In-Reply-To: <20130702062255.GB24410@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>, kernel-janitors@vger.kernel.org, =?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>

On Tue, Jul 2, 2013 at 2:22 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The rv6xx_clocks_per_unit() function pretends it can set flags in a u64
> bitfield but really because "1" is an int it doesn't work for more than
> 32 bits.  The only caller truncates the high bits away anyway.  I've
> just changed it to be a u32.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

>
> diff --git a/drivers/gpu/drm/radeon/rv6xx_dpm.c b/drivers/gpu/drm/radeon/rv6xx_dpm.c
> index 0e8b7d9..a4b80f23 100644
> --- a/drivers/gpu/drm/radeon/rv6xx_dpm.c
> +++ b/drivers/gpu/drm/radeon/rv6xx_dpm.c
> @@ -406,9 +406,9 @@ static void rv6xx_enable_engine_feedback_and_reference_sync(struct radeon_device
>         WREG32_P(SPLL_CNTL_MODE, SPLL_DIV_SYNC, ~SPLL_DIV_SYNC);
>  }
>
> -static u64 rv6xx_clocks_per_unit(u32 unit)
> +static u32 rv6xx_clocks_per_unit(u32 unit)
>  {
> -       u64 tmp = 1 << (2 * unit);
> +       u32 tmp = 1 << (2 * unit);
>
>         return tmp;
>  }
> @@ -416,7 +416,7 @@ static u64 rv6xx_clocks_per_unit(u32 unit)
>  static u32 rv6xx_scale_count_given_unit(struct radeon_device *rdev,
>                                         u32 unscaled_count, u32 unit)
>  {
> -       u32 count_per_unit = (u32)rv6xx_clocks_per_unit(unit);
> +       u32 count_per_unit = rv6xx_clocks_per_unit(unit);
>
>         return (unscaled_count + count_per_unit - 1) / count_per_unit;
>  }
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
