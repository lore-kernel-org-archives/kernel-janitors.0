From: David Miller <davem@davemloft.net>
Date: Wed, 06 Jan 2016 20:27:38 +0000
Subject: Re: [patch -next] fsl/fman: use the ALIGN() macro
Message-Id: <20160106.152738.341986591893293965.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160106100308.GE23185@mwanda>
In-Reply-To: <20160106100308.GE23185@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: igal.liberman@freescale.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 6 Jan 2016 13:03:08 +0300

> diff --git a/drivers/net/ethernet/freescale/fman/fman_sp.c b/drivers/net/ethernet/freescale/fman/fman_sp.c
> index f9e7aa3..b527da1 100644
> --- a/drivers/net/ethernet/freescale/fman/fman_sp.c
> +++ b/drivers/net/ethernet/freescale/fman/fman_sp.c
> @@ -92,11 +92,8 @@ int fman_sp_build_buffer_struct(struct fman_sp_int_context_data_copy *
>  	u32 tmp;
>  
>  	/* Align start of internal context data to 16 byte */
> -	int_context_data_copy->ext_buf_offset = (u16)
> -		((buffer_prefix_content->priv_data_size & (OFFSET_UNITS - 1)) ?
> -		((buffer_prefix_content->priv_data_size + OFFSET_UNITS) &
> -			~(u16)(OFFSET_UNITS - 1)) :
> -		buffer_prefix_content->priv_data_size);
> +	int_context_data_copy->ext_buf_offset > +		(u16)ALIGN(buffer_prefix_content->priv_data_size, 16);

Why are you using '16' instead of OFFSET_UNITS?

Unless you can come up with a good reason, please use OFFSET_UNITS instead
of a magic constant.

Thanks!
