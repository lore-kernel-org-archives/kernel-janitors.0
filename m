From: Inki Dae <inki.dae@samsung.com>
Date: Wed, 18 Jun 2014 05:06:59 +0000
Subject: Re: [patch] drm/exynos: change zero to NULL for sparse
Message-Id: <53A11E73.3070208@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140611063623.GA16247@mwanda>
In-Reply-To: <20140611063623.GA16247@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2014년 06월 11일 15:36, Dan Carpenter wrote:
> We recently changed this function to return a pointer instead of an int
> so we need to change this zero to a NULL or Sparse complains:
> 
> 	drivers/gpu/drm/exynos/exynos_drm_drv.h:346:47:
> 	warning: Using plain integer as NULL pointer

Applied.

Thanks,
Inki Dae

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> index 36535f3..06cde45 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -343,7 +343,7 @@ struct exynos_drm_display * exynos_dpi_probe(struct device *dev);
>  int exynos_dpi_remove(struct device *dev);
>  #else
>  static inline struct exynos_drm_display *
> -exynos_dpi_probe(struct device *dev) { return 0; }
> +exynos_dpi_probe(struct device *dev) { return NULL; }
>  static inline int exynos_dpi_remove(struct device *dev) { return 0; }
>  #endif
>  
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

