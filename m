From: Mikko Perttunen <cyndis@kapsi.fi>
Date: Tue, 25 Sep 2018 07:29:37 +0000
Subject: Re: [PATCH -next] drm/tegra: Use PTR_ERR_OR_ZERO in tegra_gem_create()
Message-Id: <ad3ed7e3-17dd-a418-f951-3cae69b0ac32@kapsi.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537839351-104885-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1537839351-104885-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

I'm not the maintainer, but in line with previous similar patches..

NAK: this makes the code harder to read.

Thanks,
Mikko

On 25/09/2018 10.35, YueHaibing wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/gpu/drm/tegra/drm.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index e22352c..056f749 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -497,10 +497,7 @@ static int tegra_gem_create(struct drm_device *drm, void *data,
>   
>   	bo = tegra_bo_create_with_handle(file, drm, args->size, args->flags,
>   					 &args->handle);
> -	if (IS_ERR(bo))
> -		return PTR_ERR(bo);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(bo);
>   }
>   
>   static int tegra_gem_mmap(struct drm_device *drm, void *data,
> 
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
