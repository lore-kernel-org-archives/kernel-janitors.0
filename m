From: Sudeep Dutt <sudeep.dutt@intel.com>
Date: Sun, 11 Oct 2015 09:14:19 +0000
Subject: Re: [patch 1/2] misc: mic/scif: fix error code in scif_create_remote_lookup()
Message-Id: <1444554859.93285.232.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151009064122.GC7540@mwanda>
In-Reply-To: <20151009064122.GC7540@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>, Nikhil Rao <nikhil.rao@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2015-10-09 at 09:41 +0300, Dan Carpenter wrote:
> We should be returning -ENOMEM here instead of success.
> 

Reviewed-by: Sudeep Dutt <sudeep.dutt@intel.com>

Thanks for the fix!

> Fixes: ba612aa8b487 ('misc: mic: SCIF memory registration and unregistration')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/misc/mic/scif/scif_rma.c b/drivers/misc/mic/scif/scif_rma.c
> index e288996..bc2dccb 100644
> --- a/drivers/misc/mic/scif/scif_rma.c
> +++ b/drivers/misc/mic/scif/scif_rma.c
> @@ -386,16 +386,20 @@ static int scif_create_remote_lookup(struct scif_dev *remote_dev,
>  				    remote_dev, window->nr_lookup *
>  				    sizeof(*window->dma_addr_lookup.lookup),
>  				    GFP_KERNEL | __GFP_ZERO);
> -	if (!window->dma_addr_lookup.lookup)
> +	if (!window->dma_addr_lookup.lookup) {
> +		err = -ENOMEM;
>  		goto error_window;
> +	}
>  
>  	window->num_pages_lookup.lookup >  		scif_alloc_coherent(&window->num_pages_lookup.offset,
>  				    remote_dev, window->nr_lookup *
>  				    sizeof(*window->num_pages_lookup.lookup),
>  				    GFP_KERNEL | __GFP_ZERO);
> -	if (!window->num_pages_lookup.lookup)
> +	if (!window->num_pages_lookup.lookup) {
> +		err = -ENOMEM;
>  		goto error_window;
> +	}
>  
>  	vmalloc_dma_phys = is_vmalloc_addr(&window->dma_addr[0]);
>  	vmalloc_num_pages = is_vmalloc_addr(&window->num_pages[0]);


