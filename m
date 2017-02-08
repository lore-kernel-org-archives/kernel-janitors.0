From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Date: Wed, 08 Feb 2017 00:43:58 +0000
Subject: Re: [patch] drm/radeon: remove some dead code
Message-Id: <579e36be-400f-19b0-9cb6-3de0af62b447@daenzer.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207131604.GA27416@mwanda>
In-Reply-To: <20170207131604.GA27416@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

On 07/02/17 10:16 PM, Dan Carpenter wrote:
> If "rdev->bios" is NULL then we don't need to free it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
> index 00cfb5d2875f..04c0ed41374f 100644
> --- a/drivers/gpu/drm/radeon/radeon_bios.c
> +++ b/drivers/gpu/drm/radeon/radeon_bios.c
> @@ -638,10 +638,8 @@ static bool radeon_acpi_vfct_bios(struct radeon_device *rdev)
>  					     vhdr->ImageLength,
>  					     GFP_KERNEL);
>  
> -			if (!rdev->bios) {
> -				kfree(rdev->bios);
> +			if (!rdev->bios)
>  				return false;
> -			}
>  			return true;

Could be simplified further to

			return rdev->bios != NULL;

or maybe

			return !!rdev->bios;

Either way,

Reviewed-by: Michel Dänzer <michel.daenzer@amd.com>


-- 
Earthling Michel Dänzer               |               http://www.amd.com
Libre software enthusiast             |             Mesa and X developer
