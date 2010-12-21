From: Ben Skeggs <bskeggs@redhat.com>
Date: Tue, 21 Dec 2010 01:12:33 +0000
Subject: Re: [patch -next] nouveua: sizeof() vs ARRAY_SIZE()
Message-Id: <1292893956.2214.14.camel@nisroch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101220092626.GT1936@bicker>
In-Reply-To: <20101220092626.GT1936@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Mon, 2010-12-20 at 12:26 +0300, Dan Carpenter wrote:
> ARRAY_SIZE() was intended here, sizeof() is too large.
Thanks, I've queued this patch.

Ben.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/gpu/drm/nouveau/nv50_vram.c b/drivers/gpu/drm/nouveau/nv50_vram.c
> index 47489ed..58e98ad 100644
> --- a/drivers/gpu/drm/nouveau/nv50_vram.c
> +++ b/drivers/gpu/drm/nouveau/nv50_vram.c
> @@ -42,7 +42,7 @@ nv50_vram_flags_valid(struct drm_device *dev, u32 tile_flags)
>  {
>  	int type = (tile_flags & NOUVEAU_GEM_TILE_LAYOUT_MASK) >> 8;
>  
> -	if (likely(type < sizeof(types) && types[type]))
> +	if (likely(type < ARRAY_SIZE(types) && types[type]))
>  		return true;
>  	return false;
>  }


