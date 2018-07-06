From: Matthew Wilcox <willy@infradead.org>
Date: Fri, 06 Jul 2018 17:51:30 +0000
Subject: Re: [PATCH] xarray: unlock on error in xa_alloc()
Message-Id: <20180706175130.GA7259@bombadil.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180706172101.vvp3fv3l244y2p7w@kili.mountain>
In-Reply-To: <20180706172101.vvp3fv3l244y2p7w@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jul 06, 2018 at 08:21:01PM +0300, Dan Carpenter wrote:
> We need to unlock on this error path.
> 
> Fixes: 29a6bfc32eb2 ("xarray: Track free entries in an XArray")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> 
> There "UINT_MAX + 1" is an integer overflow and is equal to zero but I
> don't know what was intended there.

Ah.  I didn't realise UINT_MAX was defined as ~0U.  I had intended
UINT_MAX + 1UL.  ie 0x10000000UL on 64-bit and 0 on 32-bit.

> diff --git a/lib/xarray.c b/lib/xarray.c
> index be10039caaed..a27fdb381f64 100644
> --- a/lib/xarray.c
> +++ b/lib/xarray.c
> @@ -1474,8 +1474,10 @@ int xa_alloc(struct xarray *xa, u32 *id, void *entry, gfp_t gfp)
>  		xas.xa_index = 0;
>  		xas_lock(&xas);
>  		xas_find_tagged(&xas, UINT_MAX, XA_FREE_TAG);
> -		if (xas.xa_node = XAS_BOUNDS && xas.xa_index = UINT_MAX + 1)
> +		if (xas.xa_node = XAS_BOUNDS && xas.xa_index = UINT_MAX + 1) {
> +			xas_unlock(&xas);
>  			return -ENOSPC;
> +		}
>  		*id = xas.xa_index;
>  		xas_store(&xas, entry);
>  		xas_clear_tag(&xas, XA_FREE_TAG);
