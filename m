From: Lucas Stach <l.stach@pengutronix.de>
Date: Mon, 02 Sep 2019 10:50:44 +0000
Subject: Re: [PATCH -next] drm/etnaviv: fix missing unlock on error in etnaviv_iommuv1_context_alloc()
Message-Id: <76f25b70dd874c49c861a812384391c87240f5e7.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190819061733.50023-1-weiyongjun1@huawei.com>
In-Reply-To: <20190819061733.50023-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: kernel-janitors@vger.kernel.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

On Mo, 2019-08-19 at 06:17 +0000, Wei Yongjun wrote:
> Add the missing unlock before return from function
> etnaviv_iommuv1_context_alloc()
> in the error handling case.
> 
> Fixes: 27b67278e007 ("drm/etnaviv: rework MMU handling")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks, applied.

For my education, can you tell me which tool you did use to catch this
issue?

Regards,
Lucas

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_iommu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
> b/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
> index aac8dbf3ea56..1a7c89a67bea 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
> @@ -140,8 +140,10 @@ etnaviv_iommuv1_context_alloc(struct
> etnaviv_iommu_global *global)
>  	}
>  
>  	v1_context = kzalloc(sizeof(*v1_context), GFP_KERNEL);
> -	if (!v1_context)
> +	if (!v1_context) {
> +		mutex_unlock(&global->lock);
>  		return NULL;
> +	}
>  
>  	v1_context->pgtable_cpu = dma_alloc_wc(global->dev, PT_SIZE,
>  					       &v1_context-
> >pgtable_dma,
> 
> 
> 
