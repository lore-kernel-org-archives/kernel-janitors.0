From: Roland Scheidegger <sroland@vmware.com>
Date: Tue, 14 Jul 2020 01:16:10 +0000
Subject: Re: [PATCH] drm/vmwgfx: Use correct vmw_legacy_display_unit pointer
Message-Id: <359c2028-7768-5a7b-b319-48da111d4f77@vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200626103437.GB314359@mwanda>
In-Reply-To: <20200626103437.GB314359@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: David Airlie <airlied@linux.ie>, Dave Airlie <airlied@redhat.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Sorry for the delay, finally got time to look at this, seems all correct
to me, thanks. Applied to our vmvgfx-next tree. (I do wonder how this
somehow was supposed to work for all this time...)

Roland

Am 26.06.20 um 12:34 schrieb Dan Carpenter:
> The "entry" pointer is an offset from the list head and it doesn't
> point to a valid vmw_legacy_display_unit struct.  Presumably the
> intent was to point to the last entry.
> 
> Also the "i++" wasn't used so I have removed that as well.
> 
> Fixes: d7e1958dbe4a ("drm/vmwgfx: Support older hardware.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis.  Not tested.  This bug celebrated its tenth
> birthday last month.  :)
> 
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
> index 16dafff5cab1..009f1742bed5 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
> @@ -81,7 +81,7 @@ static int vmw_ldu_commit_list(struct vmw_private *dev_priv)
>  	struct vmw_legacy_display_unit *entry;
>  	struct drm_framebuffer *fb = NULL;
>  	struct drm_crtc *crtc = NULL;
> -	int i = 0;
> +	int i;
>  
>  	/* If there is no display topology the host just assumes
>  	 * that the guest will set the same layout as the host.
> @@ -92,12 +92,11 @@ static int vmw_ldu_commit_list(struct vmw_private *dev_priv)
>  			crtc = &entry->base.crtc;
>  			w = max(w, crtc->x + crtc->mode.hdisplay);
>  			h = max(h, crtc->y + crtc->mode.vdisplay);
> -			i++;
>  		}
>  
>  		if (crtc = NULL)
>  			return 0;
> -		fb = entry->base.crtc.primary->state->fb;
> +		fb = crtc->primary->state->fb;
>  
>  		return vmw_kms_write_svga(dev_priv, w, h, fb->pitches[0],
>  					  fb->format->cpp[0] * 8,
> 
