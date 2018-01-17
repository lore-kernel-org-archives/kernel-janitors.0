From: Lucas Stach <l.stach@pengutronix.de>
Date: Wed, 17 Jan 2018 16:47:55 +0000
Subject: Re: [PATCH -next] drm/etnaviv: make local symbols static
Message-Id: <1516207675.2735.23.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1515670499-132320-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1515670499-132320-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@linux.ie>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Am Donnerstag, den 11.01.2018, 11:34 +0000 schrieb Wei Yongjun:
> Fixes the following sparse warnings:
> 
> drivers/gpu/drm/etnaviv/etnaviv_iommu.c:161:39: warning:
>  symbol 'etnaviv_iommuv1_ops' was not declared. Should it be static?
> drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c:239:39: warning:
>  symbol 'etnaviv_iommuv2_ops' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks, applied to etnaviv/next.

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_iommu.c | 2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c | 2 +-
>  2 file changed, 2 insertion(+), 2 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
> b/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
> index 7a8c947..4b9b11c 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
> @@ -158,7 +158,7 @@ void etnaviv_iommuv1_restore(struct etnaviv_gpu
> *gpu)
>  	gpu_write(gpu, VIVS_MC_MMU_RA_PAGE_TABLE, pgtable);
>  }
>  
> -const struct etnaviv_iommu_domain_ops etnaviv_iommuv1_ops = {
> +static const struct etnaviv_iommu_domain_ops etnaviv_iommuv1_ops = {
>  	.free = etnaviv_iommuv1_domain_free,
>  	.map = etnaviv_iommuv1_map,
>  	.unmap = etnaviv_iommuv1_unmap,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
> b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
> index 1e956e2..6e7c892 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
> @@ -236,7 +236,7 @@ void etnaviv_iommuv2_restore(struct etnaviv_gpu
> *gpu)
>  	gpu_write(gpu, VIVS_MMUv2_CONTROL,
> VIVS_MMUv2_CONTROL_ENABLE);
>  }
>  
> -const struct etnaviv_iommu_domain_ops etnaviv_iommuv2_ops = {
> +static const struct etnaviv_iommu_domain_ops etnaviv_iommuv2_ops = {
>  	.free = etnaviv_iommuv2_domain_free,
>  	.map = etnaviv_iommuv2_map,
>  	.unmap = etnaviv_iommuv2_unmap,
> 
