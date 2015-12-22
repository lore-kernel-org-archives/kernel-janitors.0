From: Alex Williamson <alex.williamson@redhat.com>
Date: Tue, 22 Dec 2015 20:09:00 +0000
Subject: Re: [patch]  VFIO: platform: reset: fix a warning message condition
Message-Id: <1450814940.2950.3.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151217122707.GA4267@mwanda>
In-Reply-To: <20151217122707.GA4267@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Baptiste Reynal <b.reynal@virtualopensystems.com>, Eric Auger <eric.auger@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2015-12-17 at 15:27 +0300, Dan Carpenter wrote:
> This loop ends with count set to -1 and not zero so the warning
> message
> isn't printed when it should be.  I've fixed this by change the
> postop
> to a preop.
> 
> Fixes: 0990822c9866 ('VFIO: platform: reset: AMD xgbe reset module')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to next for v4.5 with Eric's Reviewed-by.  Thanks!

Alex

> diff --git a/drivers/vfio/platform/reset/vfio_platform_amdxgbe.c
> b/drivers/vfio/platform/reset/vfio_platform_amdxgbe.c
> index da5356f..d4030d0 100644
> --- a/drivers/vfio/platform/reset/vfio_platform_amdxgbe.c
> +++ b/drivers/vfio/platform/reset/vfio_platform_amdxgbe.c
> @@ -110,7 +110,7 @@ int vfio_platform_amdxgbe_reset(struct
> vfio_platform_device *vdev)
>  	usleep_range(10, 15);
>  
>  	count = 2000;
> -	while (count-- && (ioread32(xgmac_regs->ioaddr + DMA_MR) &
> 1))
> +	while (--count && (ioread32(xgmac_regs->ioaddr + DMA_MR) &
> 1))
>  		usleep_range(500, 600);
>  
>  	if (!count)

