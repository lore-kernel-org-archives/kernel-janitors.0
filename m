From: Ryan Mallon <rmallon@gmail.com>
Date: Fri, 05 Jul 2013 23:26:27 +0000
Subject: Re: [patch v2] rapidio: use after free in unregister function
Message-Id: <51D75623.2010507@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130705203908.GA7594@elgon.mountain>
In-Reply-To: <20130705203908.GA7594@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Matt Porter <mporter@kernel.crashing.org>, Alexandre Bounine <alexandre.bounine@idt.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 06/07/13 06:39, Dan Carpenter wrote:

> We're freeing the list iterator so we can't move to the next entry.
> Since there is only one matching mport_id, we can just break after
> finding it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: cleaner fix than v1
> 
> diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
> index f4f30af..2e8a20c 100644
> --- a/drivers/rapidio/rio.c
> +++ b/drivers/rapidio/rio.c
> @@ -1715,11 +1715,13 @@ int rio_unregister_scan(int mport_id, struct rio_scan *scan_ops)
>  		    (mport_id = RIO_MPORT_ANY && port->nscan = scan_ops))
>  			port->nscan = NULL;
>  
> -	list_for_each_entry(scan, &rio_scans, node)
> +	list_for_each_entry(scan, &rio_scans, node) {
>  		if (scan->mport_id = mport_id) {
>  			list_del(&scan->node);
>  			kfree(scan);
> +			break;
>  		}
> +	}
>  
>  	mutex_unlock(&rio_mport_list_lock);
>  


Reviewed-by: Ryan Mallon <rmallon@gmail.com>

