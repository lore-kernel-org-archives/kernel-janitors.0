From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 28 Jun 2017 17:18:05 +0000
Subject: Re: [PATCH] drm/gma500: remove an unneeded NULL check
Message-Id: <20170628171805.hz5y72x2m7fxy7ix@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170628124100.3pw2gyitsfopaib5@mwanda>
In-Reply-To: <20170628124100.3pw2gyitsfopaib5@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, Jun 28, 2017 at 03:41:01PM +0300, Dan Carpenter wrote:
> "connector" is the list iterator and it can't be NULL.  It causes a
> static checker warning because we dereference the iterator to get the
> next item in the list.  Let's remove this check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

gma500 is always good for some surprises. Pushed to drm-misc-next for
4.14, thanks.
-Daniel

> 
> diff --git a/drivers/gpu/drm/gma500/mdfld_intel_display.c b/drivers/gpu/drm/gma500/mdfld_intel_display.c
> index 63c6e08600ae..531e4450c000 100644
> --- a/drivers/gpu/drm/gma500/mdfld_intel_display.c
> +++ b/drivers/gpu/drm/gma500/mdfld_intel_display.c
> @@ -737,11 +737,7 @@ static int mdfld_crtc_mode_set(struct drm_crtc *crtc,
>  					sizeof(struct drm_display_mode));
>  
>  	list_for_each_entry(connector, &mode_config->connector_list, head) {
> -		if (!connector)
> -			continue;
> -
>  		encoder = connector->encoder;
> -
>  		if (!encoder)
>  			continue;
>  
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
