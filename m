From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 12 Apr 2017 09:01:52 +0000
Subject: Re: [PATCH] drm/edid: checking for NULL instead of IS_ERR
Message-Id: <20170412090151.sep7cb7l4te3ycib@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170412083350.GD3250@mwanda>
In-Reply-To: <20170412083350.GD3250@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, Apr 12, 2017 at 11:33:50AM +0300, Dan Carpenter wrote:
> drm_mode_create_tile_group() uses error pointers, it doesn't return
> NULL.  I re-arranged it a tiny bit to be more clear.
> 
> Fixes: 40d9b043a89e ("drm/connector: store tile information from displayid (v3)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

There's a second caller in msm, which is also broken. I feel like fixing
create_tile_group is easier (plus updating the docs).
-Daniel

> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index fad3d44e4642..c6bc21673885 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4522,9 +4522,9 @@ static int drm_parse_tiled_block(struct drm_connector *connector,
>  	tg = drm_mode_get_tile_group(connector->dev, tile->topology_id);
>  	if (!tg) {
>  		tg = drm_mode_create_tile_group(connector->dev, tile->topology_id);
> +		if (IS_ERR(tg))
> +			return PTR_ERR(tg);
>  	}
> -	if (!tg)
> -		return -ENOMEM;
>  
>  	if (connector->tile_group != tg) {
>  		/* if we haven't got a pointer,
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
