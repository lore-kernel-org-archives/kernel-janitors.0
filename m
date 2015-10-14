From: Sudeep Dutt <sudeep.dutt@intel.com>
Date: Wed, 14 Oct 2015 03:21:24 +0000
Subject: Re: [patch 2/2] misc: mic/scif: fix wrap around tests
Message-Id: <1444792884.93285.276.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151009064021.GA7540@mwanda>
In-Reply-To: <20151009064021.GA7540@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>, Nikhil Rao <nikhil.rao@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2015-10-09 at 09:40 +0300, Dan Carpenter wrote:
> Signed integer overflow is undefined.  Also I added a check for
> "(offset < 0)" in scif_unregister() because that makes it match the
> other conditions and because I didn't want to subtract a negative.
> 
> Fixes: ba612aa8b487 ('misc: mic: SCIF memory registration and unregistration')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> 
> Imagine you are on 64 bit and len is larger than INT_MAX << 12, it means
> that we truncate it because scif_get_window_offset() takes an integer
> argument.  I don't know if this is an issue.  Maybe I should use
> INT_MAX instead of LONG_MAX?  I am working on a static checker warning
> for these types of issues:
> drivers/misc/mic/scif/scif_rma.c:1631 scif_register() warn: truncating user data 'len >> 12' '0-4503599627370495'
> drivers/misc/mic/scif/scif_rma.c:1643 scif_register() warn: truncating user data 'len >> 12' '0-4503599627370495'
> 
> The other static warnings here are:
> 
> drivers/misc/mic/scif/scif_rma.c:745 scif_unregister_window() warn: inconsistent returns 'mutex:&ep->rma_info.rma_lock'.
>   Locked on:   line 745
>   Unlocked on: line 687
> drivers/misc/mic/scif/scif_rma.c:1463 scif_unpin_pages() warn: passing __func__ while the format string already contains the name of the function 'scif_unpin_pages'
> 
> diff --git a/drivers/misc/mic/scif/scif_rma.c b/drivers/misc/mic/scif/scif_rma.c
> index bc2dccb..fea7d2c 100644
> --- a/drivers/misc/mic/scif/scif_rma.c
> +++ b/drivers/misc/mic/scif/scif_rma.c
> @@ -1510,7 +1510,7 @@ off_t scif_register_pinned_pages(scif_epd_t epd,
>  	if ((map_flags & SCIF_MAP_FIXED) &&
>  	    ((ALIGN(offset, PAGE_SIZE) != offset) ||
>  	    (offset < 0) ||
> -	    (offset + (off_t)len < offset)))
> +	    (len > LONG_MAX - offset)))
>  		return -EINVAL;
>  
>  	might_sleep();
> @@ -1613,7 +1613,7 @@ off_t scif_register(scif_epd_t epd, void *addr, size_t len, off_t offset,
>  	if ((map_flags & SCIF_MAP_FIXED) &&
>  	    ((ALIGN(offset, PAGE_SIZE) != offset) ||
>  	    (offset < 0) ||
> -	    (offset + (off_t)len < offset)))
> +	    (len < LONG_MAX - offset)))

Hi Dan,
Should this be > instead of < like the others?
Thanks,
Sudeep Dutt

>  		return -EINVAL;
>  
>  	/* Unsupported protection requested */
> @@ -1731,7 +1731,8 @@ scif_unregister(scif_epd_t epd, off_t offset, size_t len)
>  
>  	/* Offset is not page aligned or offset+len wraps around */
>  	if ((ALIGN(offset, PAGE_SIZE) != offset) ||
> -	    (offset + (off_t)len < offset))
> +	    (offset < 0) ||
> +	    (len > LONG_MAX - offset))
>  		return -EINVAL;
>  
>  	err = scif_verify_epd(ep);


