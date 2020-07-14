From: Roland Scheidegger <sroland@vmware.com>
Date: Tue, 14 Jul 2020 01:39:13 +0000
Subject: Re: [PATCH] drm/vmwgfx: Fix two list_for_each loop exit tests
Message-Id: <77f0761a-11e6-e321-2245-700258d54924@vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200626103959.GC314359@mwanda>
In-Reply-To: <20200626103959.GC314359@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Am 26.06.20 um 12:39 schrieb Dan Carpenter:
> These if statements are supposed to be true if we ended the
> list_for_each_entry() loops without hitting a break statement but they
> don't work.
> 
> In the first loop, we increment "i" after the "if (i = unit)" condition
> so we don't necessarily know that "i" is not equal to unit at the end of
> the loop.
So, if I understand this right, this would only really be a problem if
there's no list entries at all, right? That is i = unit = 0.
Not sure if that can actually happen, but in any case the fix looks correct.


> 
> In the second loop we exit when mode is not pointing to a valid
> drm_display_mode struct so it doesn't make sense to check "mode->type".
Looks good to me too, condition order seems fine to me as well, though I
wouldn't particularly care.

Applied to vmwgfx-next as well, thanks.

Roland


> 
> Fixes: a278724aa23c ("drm/vmwgfx: Implement fbdev on kms v2")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I reversed the second condition as well, just because I was copy and
> pasting the exit condition.  Plus I always feel like error handling is
> better than success handling.  If anyone feel strongly, then I can send
> a v2.
> 
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 3c97654b5a43..44168a7d7b44 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -2576,7 +2576,7 @@ int vmw_kms_fbdev_init_data(struct vmw_private *dev_priv,
>  		++i;
>  	}
>  
> -	if (i != unit) {
> +	if (&con->head = &dev_priv->dev->mode_config.connector_list) {
>  		DRM_ERROR("Could not find initial display unit.\n");
>  		ret = -EINVAL;
>  		goto out_unlock;
> @@ -2600,13 +2600,13 @@ int vmw_kms_fbdev_init_data(struct vmw_private *dev_priv,
>  			break;
>  	}
>  
> -	if (mode->type & DRM_MODE_TYPE_PREFERRED)
> -		*p_mode = mode;
> -	else {
> +	if (&mode->head = &con->modes) {
>  		WARN_ONCE(true, "Could not find initial preferred mode.\n");
>  		*p_mode = list_first_entry(&con->modes,
>  					   struct drm_display_mode,
>  					   head);
> +	} else {
> +		*p_mode = mode;
>  	}
>  
>   out_unlock:
> 
