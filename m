From: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
Date: Fri, 15 Mar 2013 18:18:29 +0000
Subject: RE: [patch] Staging: dwc2: remove a kfree(NULL)
Message-Id: <A2CA0424C0A6F04399FB9E1CD98E030458D8F436@US01WEMBX2.internal.synopsys.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130315060330.GA3793@longonot.mountain>
In-Reply-To: <20130315060330.GA3793@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Thursday, March 14, 2013 11:04 PM
> 
> dwc2_hcd_release() calls dwc2_hcd_free() which frees ->core_params
> and sets it to NULL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/staging/dwc2/hcd.c b/drivers/staging/dwc2/hcd.c
> index cdb142d..e123f1e 100644
> --- a/drivers/staging/dwc2/hcd.c
> +++ b/drivers/staging/dwc2/hcd.c
> @@ -2939,7 +2939,6 @@ void dwc2_hcd_remove(struct device *dev, struct dwc2_hsotg *hsotg)
>  	usb_remove_hcd(hcd);
>  	hsotg->priv = NULL;
>  	dwc2_hcd_release(hsotg);
> -	kfree(hsotg->core_params);
> 
>  #ifdef CONFIG_USB_DWC2_TRACK_MISSED_SOFS
>  	kfree(hsotg->last_frame_num_array);

Acked-by: Paul Zimmerman <paulz@synopsys.com>

