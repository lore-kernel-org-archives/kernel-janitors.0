From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Date: Thu, 22 May 2014 05:53:18 +0000
Subject: Re: [patch] usb: gadget: return -ENOMEM on allocation failure
Message-Id: <537D90CE.7090009@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140521122602.GA23396@mwanda>
In-Reply-To: <20140521122602.GA23396@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

W dniu 21.05.2014 14:26, Dan Carpenter pisze:
> The error handling is confusing in this function, but if you look
> closely it is returning success after the allocation fails.  I have
> changed it to return -ENOMEM and re-written it to be more clear.
>
> Fixes: 37a3a533429e ('usb: gadget: OS Feature Descriptors support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>

>
> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> index 042c66b..8e70057 100644
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -1924,24 +1924,19 @@ fail:
>   int composite_os_desc_req_prepare(struct usb_composite_dev *cdev,
>   				  struct usb_ep *ep0)
>   {
> -	int ret = 0;
> -
>   	cdev->os_desc_req = usb_ep_alloc_request(ep0, GFP_KERNEL);
> -	if (!cdev->os_desc_req) {
> -		ret = PTR_ERR(cdev->os_desc_req);
> -		goto end;
> -	}
> +	if (!cdev->os_desc_req)
> +		return -ENOMEM;
>
>   	/* OS feature descriptor length <= 4kB */
>   	cdev->os_desc_req->buf = kmalloc(4096, GFP_KERNEL);
>   	if (!cdev->os_desc_req->buf) {
> -		ret = PTR_ERR(cdev->os_desc_req->buf);
>   		kfree(cdev->os_desc_req);
> -		goto end;
> +		return -ENOMEM;
>   	}
>   	cdev->os_desc_req->complete = composite_setup_complete;
> -end:
> -	return ret;
> +
> +	return 0;
>   }
>
>   void composite_dev_cleanup(struct usb_composite_dev *cdev)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

