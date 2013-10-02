From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 02 Oct 2013 15:33:44 +0000
Subject: Re: [patch -next] drm/radeon/dpm/btc: off by one in btc_set_mc_special_registers()
Message-Id: <CADnq5_M3nuMgex8OY670fGDStwa1CEzATVT3==Z9bm68tmAdjA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130927201838.GJ6247@mwanda>
In-Reply-To: <20130927201838.GJ6247@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>, Jerome Glisse <jglisse@redhat.com>, kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>

On Fri, Sep 27, 2013 at 4:18 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> It should be ">=" instead of ">" here.  The table->mc_reg_address[]
> array has SMC_EVERGREEN_MC_REGISTER_ARRAY_SIZE (16) elements.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Resend.

Applied.  thanks!

Alex

>
> diff --git a/drivers/gpu/drm/radeon/btc_dpm.c b/drivers/gpu/drm/radeon/btc_dpm.c
> index bab0185..55491e7 100644
> --- a/drivers/gpu/drm/radeon/btc_dpm.c
> +++ b/drivers/gpu/drm/radeon/btc_dpm.c
> @@ -1913,7 +1913,7 @@ static int btc_set_mc_special_registers(struct radeon_device *rdev,
>                         }
>                         j++;
>
> -                       if (j > SMC_EVERGREEN_MC_REGISTER_ARRAY_SIZE)
> +                       if (j >= SMC_EVERGREEN_MC_REGISTER_ARRAY_SIZE)
>                                 return -EINVAL;
>
>                         tmp = RREG32(MC_PMG_CMD_MRS);
> @@ -1928,7 +1928,7 @@ static int btc_set_mc_special_registers(struct radeon_device *rdev,
>                         }
>                         j++;
>
> -                       if (j > SMC_EVERGREEN_MC_REGISTER_ARRAY_SIZE)
> +                       if (j >= SMC_EVERGREEN_MC_REGISTER_ARRAY_SIZE)
>                                 return -EINVAL;
>                         break;
>                 case MC_SEQ_RESERVE_M >> 2:
> @@ -1942,7 +1942,7 @@ static int btc_set_mc_special_registers(struct radeon_device *rdev,
>                         }
>                         j++;
>
> -                       if (j > SMC_EVERGREEN_MC_REGISTER_ARRAY_SIZE)
> +                       if (j >= SMC_EVERGREEN_MC_REGISTER_ARRAY_SIZE)
>                                 return -EINVAL;
>                         break;
>                 default:
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
