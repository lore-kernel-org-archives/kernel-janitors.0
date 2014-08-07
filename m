From: Jeff Moyer <jmoyer@redhat.com>
Date: Thu, 07 Aug 2014 21:50:08 +0000
Subject: Re: [PATCH 4/4] usb: gadget: fix error return code
Message-Id: <x49oavw9dgv.fsf@segfault.boston.devel.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407445067-4044-1-git-send-email-Julia.Lawall@lip6.fr>
	<1407445067-4044-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407445067-4044-5-git-send-email-Julia.Lawall@lip6.fr> (Julia
	Lawall's message of "Thu, 7 Aug 2014 22:57:47 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Felipe Balbi <balbi@ti.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Julia Lawall <Julia.Lawall@lip6.fr> writes:

> diff --git a/drivers/usb/gadget/udc/fusb300_udc.c b/drivers/usb/gadget/udc/fusb300_udc.c
> index d40255f..5c5d1ad 100644
> --- a/drivers/usb/gadget/udc/fusb300_udc.c
> +++ b/drivers/usb/gadget/udc/fusb300_udc.c
> @@ -1398,13 +1398,17 @@ static int fusb300_probe(struct platform_device *pdev)
>  
>  	/* initialize udc */
>  	fusb300 = kzalloc(sizeof(struct fusb300), GFP_KERNEL);
> -	if (fusb300 = NULL)
> +	if (fusb300 = NULL) {
> +		ret = -ENOMEM;
>  		goto clean_up;
> +	}
>  
>  	for (i = 0; i < FUSB300_MAX_NUM_EP; i++) {
>  		_ep[i] = kzalloc(sizeof(struct fusb300_ep), GFP_KERNEL);
> -		if (_ep[i] = NULL)
> +		if (_ep[i] = NULL) {
> +			ret = -ENOMEM;
>  			goto clean_up;
> +		}
>  		fusb300->ep[i] = _ep[i];
>  	}

Reviewed-by: Jeff Moyer <jmoyer@redhat.com>
