From: Mukesh Ojha <mojha@codeaurora.org>
Date: Wed, 27 Mar 2019 14:11:33 +0000
Subject: Re: [PATCH -next] drm/vmwgfx: Remove set but not used variable 'fb_offset, fb_depth'
Message-Id: <171dc8ca-00ff-da5c-c607-89f25dcd0a06@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190323024606.163683-1-yuehaibing@huawei.com>
In-Reply-To: <20190323024606.163683-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, VMware Graphics <linux-graphics-maintainer@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On 3/23/2019 8:16 AM, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/vmwgfx/vmwgfx_fb.c: In function 'vmw_fb_init':
> drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:645:29: warning:
>   variable 'fb_offset' set but not used [-Wunused-but-set-variable]
>
> drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:645:19: warning:
>   variable 'fb_depth' set but not used [-Wunused-but-set-variable]
>
> They're not used any more, so can be removed.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>


Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

-Mukesh

> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_fb.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
> index 2a9112515f46..86efb91f5034 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
> @@ -642,12 +642,11 @@ int vmw_fb_init(struct vmw_private *vmw_priv)
>   	struct vmw_fb_par *par;
>   	struct fb_info *info;
>   	unsigned fb_width, fb_height;
> -	unsigned fb_bpp, fb_depth, fb_offset, fb_pitch, fb_size;
> +	unsigned fb_bpp, fb_pitch, fb_size;
>   	struct drm_display_mode *init_mode;
>   	int ret;
>   
>   	fb_bpp = 32;
> -	fb_depth = 24;
>   
>   	/* XXX As shouldn't these be as well. */
>   	fb_width = min(vmw_priv->fb_max_width, (unsigned)2048);
> @@ -655,7 +654,6 @@ int vmw_fb_init(struct vmw_private *vmw_priv)
>   
>   	fb_pitch = fb_width * fb_bpp / 8;
>   	fb_size = fb_pitch * fb_height;
> -	fb_offset = vmw_read(vmw_priv, SVGA_REG_FB_OFFSET);
>   
>   	info = framebuffer_alloc(sizeof(*par), device);
>   	if (!info)
>
>
>
