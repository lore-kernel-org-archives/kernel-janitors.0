From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 17 Dec 2018 09:44:06 +0000
Subject: Re: [PATCH] drm: Fix an error pointer dereference()
Message-Id: <20181217094406.GZ21184@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181217065733.GA12159@kadam>
In-Reply-To: <20181217065733.GA12159@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>

On Mon, Dec 17, 2018 at 10:00:38AM +0300, Dan Carpenter wrote:
> The drm_mode_create_tile_group() is only called from
> drm_parse_tiled_block() and the caller expects it to return a NULL on
> error.  In other words, this function should match
> drm_mode_get_tile_group().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I sent a version of this patch last year which updated
> drm_parse_tiled_block() to check for error pointers.  Daniel Vetter
> said that there was another caller in the msm code, but I don't think
> there is now.

Yup, that msm callsite was removed in

commit 8b03ad30e314691f7bfccc0f9fae0dffd498b667
Author: Chandan Uddaraju <chandanu@codeaurora.org>
Date:   Wed Apr 18 12:45:15 2018 -0700

    drm/msm/dsi: Use one connector for dual DSI mode
    
Thanks for resending your patch, applied for 4.22.
-Daniel

> 
> 
>  drivers/gpu/drm/drm_connector.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index da8ae80c2750..3971174f6aed 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2077,7 +2077,7 @@ EXPORT_SYMBOL(drm_mode_get_tile_group);
>   * identifier for the tile group.
>   *
>   * RETURNS:
> - * new tile group or error.
> + * new tile group or NULL.
>   */
>  struct drm_tile_group *drm_mode_create_tile_group(struct drm_device *dev,
>  						  char topology[8])
> @@ -2087,7 +2087,7 @@ struct drm_tile_group *drm_mode_create_tile_group(struct drm_device *dev,
>  
>  	tg = kzalloc(sizeof(*tg), GFP_KERNEL);
>  	if (!tg)
> -		return ERR_PTR(-ENOMEM);
> +		return NULL;
>  
>  	kref_init(&tg->refcount);
>  	memcpy(tg->group_data, topology, 8);
> @@ -2099,7 +2099,7 @@ struct drm_tile_group *drm_mode_create_tile_group(struct drm_device *dev,
>  		tg->id = ret;
>  	} else {
>  		kfree(tg);
> -		tg = ERR_PTR(ret);
> +		tg = NULL;
>  	}
>  
>  	mutex_unlock(&dev->mode_config.idr_mutex);
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
