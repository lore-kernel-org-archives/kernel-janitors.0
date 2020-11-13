From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri, 13 Nov 2020 10:43:17 +0000
Subject: Re: [PATCH] drm/udl: Fix missing error code in udl_handle_damage()
Message-Id: <3c055831-29e4-e03e-c7cc-3acb791688c7@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201113101502.GD168908@mwanda>
In-Reply-To: <20201113101502.GD168908@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Dave Airlie <airlied@redhat.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <sean@poorly.run>, Emil Velikov <emil.velikov@collabora.com>

Hi

Am 13.11.20 um 11:15 schrieb Dan Carpenter:
> If udl_get_urb() fails then this should return a negative error code
> but currently it returns success.
> 
> Fixes: 798ce3fe1c3a ("drm/udl: Begin/end access to imported buffers in damage-handler")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for the patch. As it has a Fixes tag, it's probably worth taking
for silencing compiler warnings alone. I'll add it to the tree.

In practice, it doesn't really matter. udl_handle_damage() is running
during the DRM commit phase and it's too late to handle errors. We could
as well convert the the function to void.

Best regards
Thomas

> ---
>  drivers/gpu/drm/udl/udl_modeset.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
> index 42eeba1dfdbf..9d34ec9d03f6 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -305,8 +305,10 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
>  	vaddr = map.vaddr; /* TODO: Use mapping abstraction properly */
>  
>  	urb = udl_get_urb(dev);
> -	if (!urb)
> +	if (!urb) {
> +		ret = -ENOMEM;
>  		goto out_drm_gem_shmem_vunmap;
> +	}
>  	cmd = urb->transfer_buffer;
>  
>  	for (i = clip.y1; i < clip.y2; i++) {
> 

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
