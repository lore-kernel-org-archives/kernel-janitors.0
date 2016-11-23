From: Bjorn Helgaas <helgaas@kernel.org>
Date: Wed, 23 Nov 2016 22:58:51 +0000
Subject: Re: [PATCH] PCI Hotplug: cpqphp: Add missing call to pci_disable_device
Message-Id: <20161123225851.GJ16033@bhelgaas-glaptop.roam.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161119174148.20187-1-lambert.quentin@gmail.com>
In-Reply-To: <20161119174148.20187-1-lambert.quentin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Nov 19, 2016 at 06:41:48PM +0100, Quentin Lambert wrote:
> Most error branches following the call to pci_enable_device contain
> a call to pci_disable_device. This patch add these calls where they are
> missing.
> 
> This issue was found with Hector.
> 
> Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>

Applied to pci/hotplug for v4.10, thanks, Quentin!

> ---
>  drivers/pci/hotplug/cpqphp_core.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> --- a/drivers/pci/hotplug/cpqphp_core.c
> +++ b/drivers/pci/hotplug/cpqphp_core.c
> @@ -867,7 +867,8 @@ static int cpqhpc_probe(struct pci_dev *
>  	 */
>  	if ((pdev->revision <= 2) && (vendor_id != PCI_VENDOR_ID_INTEL)) {
>  		err(msg_HPC_not_supported);
> -		return -ENODEV;
> +		rc = -ENODEV;
> +		goto err_disable_device;
>  	}
>  
>  	/* TODO: This code can be made to support non-Compaq or Intel
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
