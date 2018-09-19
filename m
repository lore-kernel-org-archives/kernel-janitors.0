From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Date: Wed, 19 Sep 2018 10:42:37 +0000
Subject: Re: [PATCH] PCI: cadence: check the correct variable
Message-Id: <20180919104237.GB15014@e107981-ln.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180919103411.GA9238@mwanda>
In-Reply-To: <20180919103411.GA9238@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alan Douglas <adouglas@cadence.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Sep 19, 2018 at 01:34:11PM +0300, Dan Carpenter wrote:
> We should be checking "phy[i]" instead of "phy".
> 
> Fixes: dfb80534692d ("PCI: cadence: Add generic PHY support to host and EP drivers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/pci/controller/pcie-cadence.c b/drivers/pci/controller/pcie-cadence.c
> index 86f1b002c846..5e369dd183c8 100644
> --- a/drivers/pci/controller/pcie-cadence.c
> +++ b/drivers/pci/controller/pcie-cadence.c
> @@ -191,8 +191,8 @@ int cdns_pcie_init_phy(struct device *dev, struct cdns_pcie *pcie)
>  	for (i = 0; i < phy_count; i++) {
>  		of_property_read_string_index(np, "phy-names", i, &name);
>  		phy[i] = devm_phy_optional_get(dev, name);
> -		if (IS_ERR(phy))
> -			return PTR_ERR(phy);
> +		if (IS_ERR(phy[i]))
> +			return PTR_ERR(phy[i]);
>  
>  		link[i] = device_link_add(dev, &phy[i]->dev, DL_FLAG_STATELESS);
>  		if (!link[i]) {

Alan,

technically, patch (that I already queued):

https://patchwork.ozlabs.org/patch/966547/

fixes this issue; in theory we should split it in two patches to
first do what this patch does and then update the _get() API but I
think it is overkill. Do you want me to squash this patch log into
the patch above log for completeness ?

Thanks,
Lorenzo
