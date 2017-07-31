From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Mon, 31 Jul 2017 04:37:52 +0000
Subject: Re: [greybus-dev] [PATCH 10/11] greybus: usb: constify hc_driver structures
Message-Id: <20170731042552.GC5804@vireshk-i7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501274518-25170-1-git-send-email-Julia.Lawall@lip6.fr>
 <1501274518-25170-11-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501274518-25170-11-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Johan Hovold <johan@kernel.org>, devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org

On 28-07-17, 22:41, Julia Lawall wrote:
> The hc_driver structure is only passed as the first argument to
> usb_create_hcd, which is declared as const.  Thus the hc_driver structure
> itself can be const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/staging/greybus/usb.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
> index ccadda0..f93a76d 100644
> --- a/drivers/staging/greybus/usb.c
> +++ b/drivers/staging/greybus/usb.c
> @@ -139,7 +139,7 @@ static int hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
>  	return ret;
>  }
>  
> -static struct hc_driver usb_gb_hc_driver = {
> +static const struct hc_driver usb_gb_hc_driver = {
>  	.description = "greybus-hcd",
>  	.product_desc = "Greybus USB Host Controller",
>  	.hcd_priv_size = sizeof(struct gb_usb_device),

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
