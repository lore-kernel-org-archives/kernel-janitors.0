From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 17 Dec 2018 09:47:06 +0000
Subject: Re: [PATCH] drm/ati_pcigart: Fix error code in drm_ati_pcigart_init()
Message-Id: <20181217094706.GA21184@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181217070344.GC12159@kadam>
In-Reply-To: <20181217070344.GC12159@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>

On Mon, Dec 17, 2018 at 10:03:44AM +0300, Dan Carpenter wrote:
> The drm_ati_pcigart_init() function was originally suppose to return one
> on success and zero on failure, but these days it returns a mix of
> zero, one and -ENOMEM on failure.
> 
> This patch cleans it up and modifies the caller so now the function
> returns zero on success and negative error codes on failure.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Queued for 4.22, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/ati_pcigart.c   | 7 ++++---
>  drivers/gpu/drm/r128/r128_cce.c | 5 +++--
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ati_pcigart.c b/drivers/gpu/drm/ati_pcigart.c
> index 6c4d4b6eba80..2362f07fe1fc 100644
> --- a/drivers/gpu/drm/ati_pcigart.c
> +++ b/drivers/gpu/drm/ati_pcigart.c
> @@ -103,7 +103,7 @@ int drm_ati_pcigart_init(struct drm_device *dev, struct drm_ati_pcigart_info *ga
>  	unsigned long pages;
>  	u32 *pci_gart = NULL, page_base, gart_idx;
>  	dma_addr_t bus_address = 0;
> -	int i, j, ret = 0;
> +	int i, j, ret = -ENOMEM;
>  	int max_ati_pages, max_real_pages;
>  
>  	if (!entry) {
> @@ -117,7 +117,7 @@ int drm_ati_pcigart_init(struct drm_device *dev, struct drm_ati_pcigart_info *ga
>  		if (pci_set_dma_mask(dev->pdev, gart_info->table_mask)) {
>  			DRM_ERROR("fail to set dma mask to 0x%Lx\n",
>  				  (unsigned long long)gart_info->table_mask);
> -			ret = 1;
> +			ret = -EFAULT;
>  			goto done;
>  		}
>  
> @@ -160,6 +160,7 @@ int drm_ati_pcigart_init(struct drm_device *dev, struct drm_ati_pcigart_info *ga
>  			drm_ati_pcigart_cleanup(dev, gart_info);
>  			address = NULL;
>  			bus_address = 0;
> +			ret = -ENOMEM;
>  			goto done;
>  		}
>  		page_base = (u32) entry->busaddr[i];
> @@ -188,7 +189,7 @@ int drm_ati_pcigart_init(struct drm_device *dev, struct drm_ati_pcigart_info *ga
>  			page_base += ATI_PCIGART_PAGE_SIZE;
>  		}
>  	}
> -	ret = 1;
> +	ret = 0;
>  
>  #if defined(__i386__) || defined(__x86_64__)
>  	wbinvd();
> diff --git a/drivers/gpu/drm/r128/r128_cce.c b/drivers/gpu/drm/r128/r128_cce.c
> index c9890afe69d6..b91af1bf531b 100644
> --- a/drivers/gpu/drm/r128/r128_cce.c
> +++ b/drivers/gpu/drm/r128/r128_cce.c
> @@ -560,11 +560,12 @@ static int r128_do_init_cce(struct drm_device *dev, drm_r128_init_t *init)
>  		dev_priv->gart_info.addr = NULL;
>  		dev_priv->gart_info.bus_addr = 0;
>  		dev_priv->gart_info.gart_reg_if = DRM_ATI_GART_PCI;
> -		if (!drm_ati_pcigart_init(dev, &dev_priv->gart_info)) {
> +		rc = drm_ati_pcigart_init(dev, &dev_priv->gart_info);
> +		if (rc) {
>  			DRM_ERROR("failed to init PCI GART!\n");
>  			dev->dev_private = (void *)dev_priv;
>  			r128_do_cleanup_cce(dev);
> -			return -ENOMEM;
> +			return rc;
>  		}
>  		R128_WRITE(R128_PCI_GART_PAGE, dev_priv->gart_info.bus_addr);
>  #if IS_ENABLED(CONFIG_AGP)
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
