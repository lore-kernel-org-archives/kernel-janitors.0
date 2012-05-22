From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Date: Tue, 22 May 2012 20:49:53 +0000
Subject: Re: [patch] USB: Checking the wrong variable in usb_disable_lpm()
Message-Id: <20120522204953.GF5662@xanatos>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120522175434.GA29755@elgon.mountain>
In-Reply-To: <20120522175434.GA29755@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, May 22, 2012 at 08:54:34PM +0300, Dan Carpenter wrote:
> We check "u1_params" instead of checking "u2_params".

Thanks for finding this, Dan.  Your patch looks correct.  I'll send it
off to Greg (along with a fix for the signed-ness issue) soon.

I suspect the pull will be put off a week or so, since the merge window
is coming, and Greg's traveling starting today.

Sarah Sharp

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static checker stuff, not tested.
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 04fb834..25a7422 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -3379,7 +3379,7 @@ int usb_disable_lpm(struct usb_device *udev)
>  		return 0;
>  
>  	udev->lpm_disable_count++;
> -	if ((udev->u1_params.timeout = 0 && udev->u1_params.timeout = 0))
> +	if ((udev->u1_params.timeout = 0 && udev->u2_params.timeout = 0))
>  		return 0;
>  
>  	/* If LPM is enabled, attempt to disable it. */
