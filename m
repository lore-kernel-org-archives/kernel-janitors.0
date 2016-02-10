From: walter harms <wharms@bfs.de>
Date: Wed, 10 Feb 2016 09:41:21 +0000
Subject: Re: [patch] staging: wilc1000: fix mgmt_tx()
Message-Id: <56BB05C1.7060703@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160210090540.GA1253@mwanda>
In-Reply-To: <20160210090540.GA1253@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 10.02.2016 10:05, schrieb Dan Carpenter:
> There was a missing curly brace so this function returns failure instead
> of succeeding.
> 
> Fixes: 06fb9336acdc ('staging: wilc1000: wilc_wfi_cfgoperations.c: replaces PRINT_ER with netdev_err')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c b/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
> index bf264d3..97d1b80 100644
> --- a/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
> +++ b/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
> @@ -1832,9 +1832,10 @@ static int mgmt_tx(struct wiphy *wiphy,
>  			return -EFAULT;
>  
>  		mgmt_tx->buff = kmalloc(buf_len, GFP_KERNEL);
> -		if (!mgmt_tx->buff)
> +		if (!mgmt_tx->buff) {
>  			kfree(mgmt_tx);
> -			return -EFAULT;
> +			return -ENOMEM;
> +		}
>  
>  		memcpy(mgmt_tx->buff, buf, len);
>  		mgmt_tx->size = len;


perhaps this is a case for kmemdup() ?

mgmt_tx->buff = kmemdup(buf, buf_len or len ?, GFP_KERNEL);

sorry, i can not see what len from this patch.

re,
 wh
