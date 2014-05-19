From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Date: Mon, 19 May 2014 09:19:10 +0000
Subject: Re: [patch v2] usb: phy: msm: change devm_ioremap() to devm_ioremap_resource()
Message-Id: <1400491150.1464.19.camel@iivanov-dev>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140514135447.GA17540@mwanda>
In-Reply-To: <20140514135447.GA17540@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 2014-05-14 at 16:54 +0300, Dan Carpenter wrote:
> There are several issues here:
> 1) platform_get_resource() can return NULL and that wasn't handled.
> 2) We should request the memory before we remap it, and
>    devm_ioremap_resource() does that.
> 3) devm_ioremap() returns a NULL but we were checking for IS_ERR().
> 
> Fixes: 6b99c68ec1f9 ('usb: phy: msm: Migrate to Managed Device Resource allocation')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: the first version just swapped the IS_ERR() check for a NULL check
> 
> Thanks everyone for the review.  In the end, it was still a one line fix
> so I forgive you Ivan.
> 
> diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
> index c522c4f..4f88174 100644
> --- a/drivers/usb/phy/phy-msm-usb.c
> +++ b/drivers/usb/phy/phy-msm-usb.c
> @@ -1586,7 +1586,7 @@ static int msm_otg_probe(struct platform_device *pdev)
>  				      np ? "alt_core" : "usb_hs_core_clk");
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	motg->regs = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +	motg->regs = devm_ioremap_resource(&pdev->dev, res);


Thank you Dan, but this will not going to work. Address space is 
shared between this PHY driver and CI device controller driver.
First version plus adding required check for 'res' as suggested
by Sergei will fix this.

Regards,
Ivan


