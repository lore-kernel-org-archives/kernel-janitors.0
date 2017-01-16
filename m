From: Eric Engestrom <eric@engestrom.ch>
Date: Mon, 16 Jan 2017 23:40:10 +0000
Subject: Re: [patch] drm/vc4: fix a bounds check
Message-Id: <20170116234010.GA21894@engestrom.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170113074900.GB30524@mwanda>
In-Reply-To: <20170113074900.GB30524@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Friday, 2017-01-13 10:49:00 +0300, Dan Carpenter wrote:
> We accidentally return success even if vc4_full_res_bounds_check() fails.
> 
> Fixes: d5b1a78a772f ("drm/vc4: Add support for drawing 3D frames.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Not tested.

It would be good to test it, but the previous code would always return 0,
and from a quick look the callers expect non-zero values on error, so
this makes more sense at least.
Reviewed-by: Eric Engestrom <eric@engestrom.ch>

> 
> diff --git a/drivers/gpu/drm/vc4/vc4_render_cl.c b/drivers/gpu/drm/vc4/vc4_render_cl.c
> index 08886a3..5cdd003 100644
> --- a/drivers/gpu/drm/vc4/vc4_render_cl.c
> +++ b/drivers/gpu/drm/vc4/vc4_render_cl.c
> @@ -461,7 +461,7 @@ static int vc4_rcl_surface_setup(struct vc4_exec_info *exec,
>  		}
>  
>  		ret = vc4_full_res_bounds_check(exec, *obj, surf);
> -		if (!ret)
> +		if (ret)
>  			return ret;
>  
>  		return 0;

This now boils down to `return vc4_full_res_bounds_check(...);`, so you
could get rid of the `ret` variable completely :)
