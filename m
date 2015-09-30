From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 30 Sep 2015 08:44:18 +0000
Subject: Re: [Intel-gfx] [PATCH 32/39] drm: i915: drop null test before destroy functions
Message-Id: <20150930084418.GC3383@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
 <1442146532-9100-33-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-33-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sergey.senozhatsky@gmail.com, Daniel Vetter <daniel.vetter@intel.com>

On Sun, Sep 13, 2015 at 02:15:25PM +0200, Julia Lawall wrote:
> Remove unneeded NULL test.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@ expression x; @@
> -if (x != NULL)
>   \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Queued for -next, thanks for the patch.
-Daniel

> 
> ---
>  drivers/gpu/drm/i915/i915_dma.c |   19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_dma.c b/drivers/gpu/drm/i915/i915_dma.c
> index ab37d11..1dc7c21 100644
> --- a/drivers/gpu/drm/i915/i915_dma.c
> +++ b/drivers/gpu/drm/i915/i915_dma.c
> @@ -1059,12 +1059,9 @@ out_freecsr:
>  put_bridge:
>  	pci_dev_put(dev_priv->bridge_dev);
>  free_priv:
> -	if (dev_priv->requests)
> -		kmem_cache_destroy(dev_priv->requests);
> -	if (dev_priv->vmas)
> -		kmem_cache_destroy(dev_priv->vmas);
> -	if (dev_priv->objects)
> -		kmem_cache_destroy(dev_priv->objects);
> +	kmem_cache_destroy(dev_priv->requests);
> +	kmem_cache_destroy(dev_priv->vmas);
> +	kmem_cache_destroy(dev_priv->objects);
>  	kfree(dev_priv);
>  	return ret;
>  }
> @@ -1150,13 +1147,9 @@ int i915_driver_unload(struct drm_device *dev)
>  	if (dev_priv->regs != NULL)
>  		pci_iounmap(dev->pdev, dev_priv->regs);
>  
> -	if (dev_priv->requests)
> -		kmem_cache_destroy(dev_priv->requests);
> -	if (dev_priv->vmas)
> -		kmem_cache_destroy(dev_priv->vmas);
> -	if (dev_priv->objects)
> -		kmem_cache_destroy(dev_priv->objects);
> -
> +	kmem_cache_destroy(dev_priv->requests);
> +	kmem_cache_destroy(dev_priv->vmas);
> +	kmem_cache_destroy(dev_priv->objects);
>  	pci_dev_put(dev_priv->bridge_dev);
>  	kfree(dev_priv);
>  
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
