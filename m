From: Sean Paul <sean@poorly.run>
Date: Wed, 19 Jun 2019 15:03:39 +0000
Subject: Re: [PATCH] drm: self_refresh: Fix a reversed condition in drm_self_refresh_helper_cleanup()
Message-Id: <20190619150339.GF25413@art_vandelay>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190619100141.GA28596@mwanda>
In-Reply-To: <20190619100141.GA28596@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>

On Wed, Jun 19, 2019 at 01:01:41PM +0300, Dan Carpenter wrote:
> This test is flipped around so it either leads to a memory leak or a
> NULL dereference.
> 
> Fixes: 1452c25b0e60 ("drm: Add helpers to kick off self refresh mode in drivers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the patch and your bug report! I've applied this to -misc-next and
will dig into the bug report shortly.

> ---
> I'm not totally sure what the prefered patch prefix for this code.  One
> thing that would help is when we're adding new files we should specify
> the prefix that they're going to use:
> 
> - drm: Add helpers to kick off self refresh mode in drivers
> + drm: refresh mode: Add helpers to kick off self refresh mode in drivers
> 
> It's a small thing and email always sounds whiny but I'm sending this
> suggestion to everyone today so...

There's no hard rule. For drivers we use drm/<driver>, and for core people
use drm or drm/<file>.

> 
>  drivers/gpu/drm/drm_self_refresh_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_self_refresh_helper.c b/drivers/gpu/drm/drm_self_refresh_helper.c
> index 2b3daaf77841..e0d2ad1f070c 100644
> --- a/drivers/gpu/drm/drm_self_refresh_helper.c
> +++ b/drivers/gpu/drm/drm_self_refresh_helper.c
> @@ -205,7 +205,7 @@ void drm_self_refresh_helper_cleanup(struct drm_crtc *crtc)
>  	struct drm_self_refresh_data *sr_data = crtc->self_refresh_data;
>  
>  	/* Helper is already uninitialized */
> -	if (sr_data)
> +	if (!sr_data)
>  		return;
>  
>  	crtc->self_refresh_data = NULL;
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Sean Paul, Software Engineer, Google / Chromium OS
