From: Borislav Petkov <bp@amd64.org>
Date: Fri, 16 Mar 2012 11:23:01 +0000
Subject: Re: [PATCH] drivers/edac/amd8131_edac.c: add missing pci_dev_put
Message-Id: <20120316112301.GB8577@aftab>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331893626-5368-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1331893626-5368-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org, Cao Qingtao <qingtao.cao@windriver.com>, Benjamin Walsh <benjamin.walsh@windriver.com>, Hu Yongqi <yongqi.hu@windriver.com>

On Fri, Mar 16, 2012 at 11:27:06AM +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Add a call to pci_dev_put in each error case.  This is motivated by the
> associated remove function, which always calls pci_dev_put.
> 
> Shift the error-handling code to the end of the function.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Let's see whether someone at Wind River actually still maintains that,
added to CC.

> 
> ---
>  drivers/edac/amd8131_edac.c |   20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/edac/amd8131_edac.c b/drivers/edac/amd8131_edac.c
> index a5c6805..dcfd53b 100644
> --- a/drivers/edac/amd8131_edac.c
> +++ b/drivers/edac/amd8131_edac.c
> @@ -249,6 +249,7 @@ static struct amd8131_info amd8131_chipset = {
>  static int amd8131_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  {
>  	struct amd8131_dev_info *dev_info;
> +	int ret;
>  
>  	for (dev_info = amd8131_chipset.devices; dev_info->inst != NO_BRIDGE;
>  		dev_info++)
> @@ -265,12 +266,12 @@ static int amd8131_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	dev_info->dev = pci_dev_get(dev);
>  
>  	if (pci_enable_device(dev_info->dev)) {
> -		pci_dev_put(dev_info->dev);
>  		printk(KERN_ERR "failed to enable:"
>  			"vendor %x, device %x, devfn %x, name %s\n",
>  			PCI_VENDOR_ID_AMD, amd8131_chipset.err_dev,
>  			dev_info->devfn, dev_info->ctl_name);
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto error;
>  	}
>  
>  	/*
> @@ -280,8 +281,10 @@ static int amd8131_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	 */
>  	dev_info->edac_idx = edac_pci_alloc_index();
>  	dev_info->edac_dev = edac_pci_alloc_ctl_info(0, dev_info->ctl_name);
> -	if (!dev_info->edac_dev)
> -		return -ENOMEM;
> +	if (!dev_info->edac_dev) {
> +		ret = -ENOMEM;
> +		goto error;
> +	}
>  
>  	dev_info->edac_dev->pvt_info = dev_info;
>  	dev_info->edac_dev->dev = &dev_info->dev->dev;
> @@ -298,8 +301,8 @@ static int amd8131_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	if (edac_pci_add_device(dev_info->edac_dev, dev_info->edac_idx) > 0) {
>  		printk(KERN_ERR "failed edac_pci_add_device() for %s\n",
>  			dev_info->ctl_name);
> -		edac_pci_free_ctl_info(dev_info->edac_dev);
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto error_info;
>  	}
>  
>  	printk(KERN_INFO "added one device on AMD8131 "
> @@ -308,6 +311,11 @@ static int amd8131_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  		dev_info->devfn, dev_info->ctl_name);
>  
>  	return 0;
> +error_info:
> +	edac_pci_free_ctl_info(dev_info->edac_dev);
> +error:
> +	pci_dev_put(dev_info->dev);
> +	return ret;
>  }
>  
>  static void amd8131_remove(struct pci_dev *dev)
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-edac" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
GM: Alberto Bozzo
Reg: Dornach, Landkreis Muenchen
HRB Nr. 43632 WEEE Registernr: 129 19551
