From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Sat, 16 Jul 2016 12:36:21 +0000
Subject: Re: [PATCH] usb: gadget: uvc: Fix return value in case of error
Message-Id: <4105543.bTmzcC8hNY@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1468652680-15781-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1468652680-15781-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

Thank you for the patch.

On Saturday 16 Jul 2016 09:04:40 Christophe JAILLET wrote:
> If this memory allocation fail, we will return 0, which means success.
> Return -ENOMEM instead.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/usb/gadget/function/uvc_configfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c
> b/drivers/usb/gadget/function/uvc_configfs.c index 66753ba..31125a4 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -2023,7 +2023,7 @@ static int uvcg_streaming_class_allow_link(struct
> config_item *src, if (!data) {
>  		kfree(*class_array);
>  		*class_array = NULL;
> -		ret = PTR_ERR(data);
> +		ret = -ENOMEM;
>  		goto unlock;
>  	}
>  	cl_arr = *class_array;

-- 
Regards,

Laurent Pinchart

