From: Jake Oshins <jakeo@microsoft.com>
Date: Mon, 29 Feb 2016 17:21:18 +0000
Subject: RE: [patch] PCI: hv: potential use after free
Message-Id: <DM2PR0301MB1232C919B7845FAEC0B36BF3ABBA0@DM2PR0301MB1232.namprd03.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160227104357.GA14086@mwanda>
In-Reply-To: <20160227104357.GA14086@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, KY Srinivasan <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>, Bjorn Helgaas <bhelgaas@google.com>, "devel@linuxdriverproject.org" <devel@linuxdriverproject.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Saturday, February 27, 2016 2:44 AM
> To: KY Srinivasan <kys@microsoft.com>; Jake Oshins
> <jakeo@microsoft.com>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>; Bjorn Helgaas
> <bhelgaas@google.com>; devel@linuxdriverproject.org; linux-
> pci@vger.kernel.org; linux-kernel@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [patch] PCI: hv: potential use after free
> 
> If we throw away the very last item on the list, then we could end up
> with a use after free of "dr".
> 
> Fixes: 15ca17645f19 ('PCI: hv: Add paravirtual PCI front-end for Microsoft
> Hyper-V VMs')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/pci/host/pci-hyperv.c b/drivers/pci/host/pci-hyperv.c
> index 9391dee..9b66ffe 100644
> --- a/drivers/pci/host/pci-hyperv.c
> +++ b/drivers/pci/host/pci-hyperv.c
> @@ -1397,6 +1397,7 @@ static void pci_devices_present_work(struct
> work_struct *work)
>  		/* Throw this away if the list still has stuff in it. */
>  		if (!list_empty(&hbus->dr_list)) {
>  			kfree(dr);
> +			dr = NULL;
>  			continue;
>  		}
>  	}

Thanks for looking at this.  I do truly appreciate it.  But the code here removes dr from the list and then, before freeing it, checks to see that it was not the last entry in the list.   The list lock is still held and the list is not empty even after removing dr from it.

(I suspect that you're going to tell me that I'm missing something here.  Please do.  I'll appreciate it even more.)

Thanks,
Jake
