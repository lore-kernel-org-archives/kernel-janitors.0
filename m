From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Date: Tue, 18 Dec 2018 10:57:42 +0000
Subject: Re: [PATCH] PCI: imx: Fix an IS_ERR() vs NULL bug
Message-Id: <20181218105742.GA22156@e107981-ln.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181218082329.GB440@kadam>
In-Reply-To: <20181218082329.GB440@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Leonard Crestez <leonard.crestez@nxp.com>, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>

On Tue, Dec 18, 2018 at 11:23:29AM +0300, Dan Carpenter wrote:
> The device_link_add() function doesn't return error pointers, it returns
> NULL if there is an error.
> 
> Fixes: 7a6991159bcd ("PCI: imx: Add multi-pd support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Thanks Dan, if you do not mind I will squash this in the initial
commit given that it is not upstream yet.

Lorenzo

> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index b54b4590ccf9..8e7956224a5f 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -326,9 +326,9 @@ static int imx6_pcie_attach_pd(struct device *dev)
>  			DL_FLAG_STATELESS |
>  			DL_FLAG_PM_RUNTIME |
>  			DL_FLAG_RPM_ACTIVE);
> -	if (IS_ERR(link)) {
> -		dev_err(dev, "Failed to add device_link to pcie pd: %ld\n", PTR_ERR(link));
> -		return PTR_ERR(link);
> +	if (!link) {
> +		dev_err(dev, "Failed to add device_link to pcie pd.\n");
> +		return -EINVAL;
>  	}
>  
>  	imx6_pcie->pd_pcie_phy = dev_pm_domain_attach_by_name(dev, "pcie_phy");
> -- 
> 2.17.1
> 
