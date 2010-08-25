From: stephane duverger <stephane.duverger@gmail.com>
Date: Wed, 25 Aug 2010 11:57:53 +0000
Subject: Re: [patch] dbgp: cleanup: remove unneeded check
Message-Id: <20100825135753.7fab4ba5@riot.ssi.corp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100812074030.GG645@bicker>
In-Reply-To: <20100812074030.GG645@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Acked-by: Stephane duverger <stephane.duverger@gmail.com>

> len is always greater than or equal to zero here.  First of all, it's
> type is unsigned and also we only assign it numbers which are greater
> than or equal to zero.
> 
> Removing the check lets us pull everything in an indent level.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/usb/gadget/dbgp.c b/drivers/usb/gadget/dbgp.c
> index 0ed50a2..abe4a2e 100644
> --- a/drivers/usb/gadget/dbgp.c
> +++ b/drivers/usb/gadget/dbgp.c
> @@ -386,15 +386,13 @@ static int dbgp_setup(struct usb_gadget *gadget,
>  	} else
>  		goto fail;
>  
> -	if (len >= 0) {
> -		req->length = min(length, len);
> -		req->zero = len < req->length;
> -		if (data && req->length)
> -			memcpy(req->buf, data, req->length);
> -
> -		req->complete = dbgp_setup_complete;
> -		return usb_ep_queue(gadget->ep0, req, GFP_ATOMIC);
> -	}
> +	req->length = min(length, len);
> +	req->zero = len < req->length;
> +	if (data && req->length)
> +		memcpy(req->buf, data, req->length);
> +
> +	req->complete = dbgp_setup_complete;
> +	return usb_ep_queue(gadget->ep0, req, GFP_ATOMIC);
>  
>  fail:
>  	dev_dbg(&dbgp.gadget->dev,
