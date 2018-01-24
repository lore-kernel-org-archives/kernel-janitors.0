From: Mikko Perttunen <cyndis@kapsi.fi>
Date: Wed, 24 Jan 2018 07:09:22 +0000
Subject: Re: [PATCH-next] drm/tegra: gem: Use PTR_ERR_OR_ZERO
Message-Id: <d6a4a713-4d3c-0dd7-4ddc-3fd96040a1f0@kapsi.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180123202922.14334-1-chrisadr@gentoo.org>
In-Reply-To: <20180123202922.14334-1-chrisadr@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Christopher_D=c3=adaz_Riveros?= <chrisadr@gentoo.org>, thierry.reding@gmail.com, airlied@linux.ie, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This nas been NAK'd before as harder to read than the current way.

Thanks,
Mikko

On 01/23/2018 10:29 PM, Christopher Díaz Riveros wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Christopher Díaz Riveros <chrisadr@gentoo.org>
> ---
>   drivers/gpu/drm/tegra/gem.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 49b9bf28f872..36c4ecc33e1a 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -416,10 +416,7 @@ int tegra_bo_dumb_create(struct drm_file *file, struct drm_device *drm,
>   
>   	bo = tegra_bo_create_with_handle(file, drm, args->size, 0,
>   					 &args->handle);
> -	if (IS_ERR(bo))
> -		return PTR_ERR(bo);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(bo);
>   }
>   
>   static int tegra_bo_fault(struct vm_fault *vmf)
> 
