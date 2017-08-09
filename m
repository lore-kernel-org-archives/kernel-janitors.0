From: Sean Paul <seanpaul@chromium.org>
Date: Wed, 09 Aug 2017 14:36:50 +0000
Subject: Re: [PATCH] drm: Shift wrap bug in create_in_format_blob()
Message-Id: <20170809143650.ql6juzihjfylebft@art_vandelay>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170809111906.4rv3hzritctfktv3@mwanda>
In-Reply-To: <20170809111906.4rv3hzritctfktv3@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ben Widawsky <ben@bwidawsk.net>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>

On Wed, Aug 09, 2017 at 02:19:06PM +0300, Dan Carpenter wrote:
> "plane->format_count" can go up to 64.  (It's capped in
> drm_universal_plane_init().)  So we should be using ULL type instead of
> int here to prevent shift wrapping.
> 
> Fixes: db1689aa61bd ("drm: Create a format/modifier blob")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for the fix, Dan.

I've applied it to drm-misc-next.

Sean

> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 5c14beee52ff..85ab1eec73e5 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -126,7 +126,7 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
>  							       plane->format_types[j],
>  							       plane->modifiers[i])) {
>  
> -				mod->formats |= 1 << j;
> +				mod->formats |= 1ULL << j;
>  			}
>  		}
>  

-- 
Sean Paul, Software Engineer, Google / Chromium OS
