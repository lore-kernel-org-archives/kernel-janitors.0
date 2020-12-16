From: Dave Jiang <dave.jiang@intel.com>
Date: Wed, 16 Dec 2020 16:22:15 +0000
Subject: Re: [PATCH] dmaengine: idxd: off by one in cleanup code
Message-Id: <20201216092215.000061b6@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9nFeojulsNqUSnG@mwanda>
In-Reply-To: <X9nFeojulsNqUSnG@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 16 Dec 2020 11:29:46 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The clean up is off by one so this will start at "i" and it should
> start with "i - 1" and then it doesn't unregister the zeroeth
> elements in the array.
> 
> Fixes: c52ca478233c ("dmaengine: idxd: add configuration component of
> driver") Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Dave Jiang <dave.jiang@intel.com>

Thanks Dan!

> ---
>  drivers/dma/idxd/sysfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
> index 266423a2cabc..4dbb03c545e4 100644
> --- a/drivers/dma/idxd/sysfs.c
> +++ b/drivers/dma/idxd/sysfs.c
> @@ -434,7 +434,7 @@ int idxd_register_driver(void)
>  	return 0;
>  
>  drv_fail:
> -	for (; i > 0; i--)
> +	while (--i >= 0)
>  		driver_unregister(&idxd_drvs[i]->drv);
>  	return rc;
>  }
> @@ -1840,7 +1840,7 @@ int idxd_register_bus_type(void)
>  	return 0;
>  
>  bus_err:
> -	for (; i > 0; i--)
> +	while (--i >= 0)
>  		bus_unregister(idxd_bus_types[i]);
>  	return rc;
>  }
