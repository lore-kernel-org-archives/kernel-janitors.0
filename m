From: Steven Price <steven.price@arm.com>
Date: Fri, 16 Aug 2019 08:31:19 +0000
Subject: Re: [PATCH -next] drm/panfrost: Fix missing unlock on error in panfrost_mmu_map_fault_addr()
Message-Id: <ee7063ab-6dd9-0854-3b25-0617d194bfec@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190814044814.102294-1-weiyongjun1@huawei.com>
In-Reply-To: <20190814044814.102294-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On 14/08/2019 05:48, Wei Yongjun wrote:
> Add the missing unlock before return from function panfrost_mmu_map_fault_addr()
> in the error handling case.
> 
> Fixes: 187d2929206e ("drm/panfrost: Add support for GPU heap allocations")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Well spotted.

Reviewed-by: Steven Price <steven.price@arm.com>

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 2ed411f09d80..06f1a563e940 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -327,14 +327,17 @@ int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as, u64 addr)
>  	if (!bo->base.pages) {
>  		bo->sgts = kvmalloc_array(bo->base.base.size / SZ_2M,
>  				     sizeof(struct sg_table), GFP_KERNEL | __GFP_ZERO);
> -		if (!bo->sgts)
> +		if (!bo->sgts) {
> +			mutex_unlock(&bo->base.pages_lock);
>  			return -ENOMEM;
> +		}
>  
>  		pages = kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
>  				       sizeof(struct page *), GFP_KERNEL | __GFP_ZERO);
>  		if (!pages) {
>  			kfree(bo->sgts);
>  			bo->sgts = NULL;
> +			mutex_unlock(&bo->base.pages_lock);
>  			return -ENOMEM;
>  		}
>  		bo->base.pages = pages;
> 
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
