From: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Mon, 25 Apr 2016 09:10:12 +0000
Subject: Re: [patch] drm: atmel-hlcdc: fix a NULL check
Message-Id: <20160425111012.5e06978e@bbrezillon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160425090454.GA25366@mwanda>
In-Reply-To: <20160425090454.GA25366@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On Mon, 25 Apr 2016 12:04:54 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> If kmalloc() returned NULL we would end up dereferencing "state" a
> couple lines later.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks,

Boris

> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> index 8df0aaf..867069b 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> @@ -415,8 +415,9 @@ atmel_hlcdc_crtc_duplicate_state(struct drm_crtc *crtc)
>  		return NULL;
>  
>  	state = kmalloc(sizeof(*state), GFP_KERNEL);
> -	if (state)
> -		__drm_atomic_helper_crtc_duplicate_state(crtc, &state->base);
> +	if (!state)
> +		return NULL;
> +	__drm_atomic_helper_crtc_duplicate_state(crtc, &state->base);
>  
>  	cur = drm_crtc_state_to_atmel_hlcdc_crtc_state(crtc->state);
>  	state->output_mode = cur->output_mode;



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
