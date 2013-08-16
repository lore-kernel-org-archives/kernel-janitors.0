From: Peter Chen <peter.chen@freescale.com>
Date: Fri, 16 Aug 2013 09:32:14 +0000
Subject: Re: [patch] usb: chipidea: fix a NULL dereference on error
Message-Id: <20130816093212.GA4390@shlinux1.ap.freescale.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130816073410.GB9881@elgon.mountain>
In-Reply-To: <20130816073410.GB9881@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 16, 2013 at 10:34:10AM +0300, Dan Carpenter wrote:
> The regulator_disable() function can't accept NULL pointers so we need
> to add a check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> index 6f96795..abfb1cc 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -88,7 +88,8 @@ static int host_start(struct ci_hdrc *ci)
>  	return ret;
>  
>  disable_reg:
> -	regulator_disable(ci->platdata->reg_vbus);
> +	if (ci->platdata->reg_vbus)
> +		regulator_disable(ci->platdata->reg_vbus);
>  
>  put_hcd:
>  	usb_put_hcd(hcd);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Acked-by: Peter Chen <peter.chen@freescale.com>

-- 

Best Regards,
Peter Chen

