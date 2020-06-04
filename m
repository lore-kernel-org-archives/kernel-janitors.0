From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Date: Thu, 04 Jun 2020 09:07:17 +0000
Subject: Re: [PATCH] PCI: uniphier: Fix some error handling in uniphier_pcie_ep_probe()
Message-Id: <20200604090717.GA28503@e121166-lin.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200603175207.GB18931@mwanda>
In-Reply-To: <20200603175207.GB18931@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 03, 2020 at 08:52:07PM +0300, Dan Carpenter wrote:
> This code is checking the wrong variable.  It should be checking
> "clk_gio" instead of "clk".  The "priv->clk" pointer is NULL at this
> point so the condition is false.
> 
> Fixes: 006564dee8253 ("PCI: uniphier: Add Socionext UniPhier Pro5 PCIe endpoint controller driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Squashed in the commit it is fixing, thanks !

Lorenzo

> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> index 0f36aa33d2e50..1483559600610 100644
> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> @@ -324,8 +324,8 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
>  		return PTR_ERR(priv->base);
>  
>  	priv->clk_gio = devm_clk_get(dev, "gio");
> -	if (IS_ERR(priv->clk))
> -		return PTR_ERR(priv->clk);
> +	if (IS_ERR(priv->clk_gio))
> +		return PTR_ERR(priv->clk_gio);
>  
>  	priv->rst_gio = devm_reset_control_get_shared(dev, "gio");
>  	if (IS_ERR(priv->rst_gio))
> -- 
> 2.26.2
> 
