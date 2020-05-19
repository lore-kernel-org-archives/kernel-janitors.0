From: Lucas Stach <l.stach@pengutronix.de>
Date: Tue, 19 May 2020 10:49:33 +0000
Subject: Re: [PATCH] drm/etnaviv: Fix a leak in submit_pin_objects()
Message-Id: <20aa90bd9004e24d6e79968fa03a97d2030bf013.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200518112955.GA48709@mwanda>
In-Reply-To: <20200518112955.GA48709@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, kernel-janitors@vger.kernel.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>

Am Montag, den 18.05.2020, 14:29 +0300 schrieb Dan Carpenter:
> If the mapping address is wrong then we have to release the reference to
> it before returning -EINVAL.
> 
> Fixes: 088880ddc0b2 ("drm/etnaviv: implement softpin")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to etnaviv/fixes.

Regards,
Lucas

> ---
> From static analysis.  Untested.
> 
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 3b0afa156d92..54def341c1db 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -238,8 +238,10 @@ static int submit_pin_objects(struct etnaviv_gem_submit *submit)
>  		}
>  
>  		if ((submit->flags & ETNA_SUBMIT_SOFTPIN) &&
> -		     submit->bos[i].va != mapping->iova)
> +		     submit->bos[i].va != mapping->iova) {
> +			etnaviv_gem_mapping_unreference(mapping);
>  			return -EINVAL;
> +		}
>  
>  		atomic_inc(&etnaviv_obj->gpu_active);
>  
