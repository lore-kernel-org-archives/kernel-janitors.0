From: Kishon Vijay Abraham I <kishon@ti.com>
Date: Wed, 23 Oct 2019 05:37:12 +0000
Subject: Re: [PATCH] phy-mvebu-a3700-utmi: Use devm_platform_ioremap_resource() in mvebu_a3700_utmi_phy_probe
Message-Id: <5e5cfafa-ade8-6f26-9989-d949c6d5c388@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5403540b-d3de-4a29-ec84-7ce5bb8d6d9f@web.de>
In-Reply-To: <5403540b-d3de-4a29-ec84-7ce5bb8d6d9f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org, Igal Liberman <igall@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: LKML <linux-kernel@vger.kernel.org>


On 26/09/19 9:50 PM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 26 Sep 2019 18:15:23 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

merged, thanks!

-Kishon

> ---
>  drivers/phy/marvell/phy-mvebu-a3700-utmi.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/marvell/phy-mvebu-a3700-utmi.c b/drivers/phy/marvell/phy-mvebu-a3700-utmi.c
> index ded900b06f5a..23bc3bf5c4c0 100644
> --- a/drivers/phy/marvell/phy-mvebu-a3700-utmi.c
> +++ b/drivers/phy/marvell/phy-mvebu-a3700-utmi.c
> @@ -216,20 +216,13 @@ static int mvebu_a3700_utmi_phy_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct mvebu_a3700_utmi *utmi;
>  	struct phy_provider *provider;
> -	struct resource *res;
> 
>  	utmi = devm_kzalloc(dev, sizeof(*utmi), GFP_KERNEL);
>  	if (!utmi)
>  		return -ENOMEM;
> 
>  	/* Get UTMI memory region */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		dev_err(dev, "Missing UTMI PHY memory resource\n");
> -		return -ENODEV;
> -	}
> -
> -	utmi->regs = devm_ioremap_resource(dev, res);
> +	utmi->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(utmi->regs))
>  		return PTR_ERR(utmi->regs);
> 
> --
> 2.23.0
> 
