From: Ben Hutchings <bhutchings@solarflare.com>
Date: Wed, 04 Sep 2013 15:51:07 +0000
Subject: Re: [patch v2] sfc: check for allocation failure
Message-Id: <1378309867.3133.10.camel@bwh-desktop.uk.level5networks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130904150727.GA32327@elgon.mountain>
In-Reply-To: <20130904150727.GA32327@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Solarflare linux maintainers <linux-net-drivers@solarflare.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2013-09-04 at 18:07 +0300, Dan Carpenter wrote:
> It upsets static analyzers when we don't check for allocation failure.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Ben Hutchings <bhutchings@solarflare.com>

> ---
> v2: rebased on latest linux-next
> 
> diff --git a/drivers/net/ethernet/sfc/falcon.c b/drivers/net/ethernet/sfc/falcon.c
> index 38d179c..75799f8 100644
> --- a/drivers/net/ethernet/sfc/falcon.c
> +++ b/drivers/net/ethernet/sfc/falcon.c
> @@ -894,6 +894,8 @@ static int falcon_mtd_probe(struct efx_nic *efx)
>  
>  	/* Allocate space for maximum number of partitions */
>  	parts = kcalloc(2, sizeof(*parts), GFP_KERNEL);
> +	if (!parts)
> +		return -ENOMEM;
>  	n_parts = 0;
>  
>  	spi = &nic_data->spi_flash;

-- 
Ben Hutchings, Staff Engineer, Solarflare
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.

