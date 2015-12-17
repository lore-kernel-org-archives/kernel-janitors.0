From: Eric Auger <eric.auger@linaro.org>
Date: Thu, 17 Dec 2015 12:45:52 +0000
Subject: Re: [patch] VFIO: platform: reset: fix a warning message condition
Message-Id: <5672AE80.3010806@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151217122707.GA4267@mwanda>
In-Reply-To: <20151217122707.GA4267@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Baptiste Reynal <b.reynal@virtualopensystems.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org, "Lendacky, Thomas" <Thomas.Lendacky@amd.com>

Hi Dan,

thanks for pointing this out.

Reviewed-by: Eric Auger <eric.auger@linaro.org>

I add Thomas in CC since the bug also exists in the native driver I
think (drivers/net/ethernet/amd/xgbe/drivers/net/ethernet/amd/xgbe
/xgbe-dev.c, xgbe_exit function).

Best Regards

Eric

On 12/17/2015 01:27 PM, Dan Carpenter wrote:
> This loop ends with count set to -1 and not zero so the warning message
> isn't printed when it should be.  I've fixed this by change the postop
> to a preop.
> 
> Fixes: 0990822c9866 ('VFIO: platform: reset: AMD xgbe reset module')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/vfio/platform/reset/vfio_platform_amdxgbe.c b/drivers/vfio/platform/reset/vfio_platform_amdxgbe.c
> index da5356f..d4030d0 100644
> --- a/drivers/vfio/platform/reset/vfio_platform_amdxgbe.c
> +++ b/drivers/vfio/platform/reset/vfio_platform_amdxgbe.c
> @@ -110,7 +110,7 @@ int vfio_platform_amdxgbe_reset(struct vfio_platform_device *vdev)
>  	usleep_range(10, 15);
>  
>  	count = 2000;
> -	while (count-- && (ioread32(xgmac_regs->ioaddr + DMA_MR) & 1))
> +	while (--count && (ioread32(xgmac_regs->ioaddr + DMA_MR) & 1))
>  		usleep_range(500, 600);
>  
>  	if (!count)
> 

