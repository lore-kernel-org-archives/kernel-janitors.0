From: Yijing Wang <wangyijing@huawei.com>
Date: Thu, 26 Feb 2015 01:01:01 +0000
Subject: Re: [patch] PCI: cpcihp: missing curly braces in cpci_configure_slot()
Message-Id: <54EE704D.5060401@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150225132322.GJ19745@mwanda>
In-Reply-To: <20150225132322.GJ19745@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Scott Murray <scott@spiteful.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2015/2/25 21:23, Dan Carpenter wrote:
> I don't have this hardware but it looks like we weren't adding bridge
> devices as intended.  Maybe the bridge is always the last device?
> 
> Fixes: 05b125004815 ('PCI: cpcihp: Iterate over all devices in slot, not functions 0-7')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/pci/hotplug/cpci_hotplug_pci.c b/drivers/pci/hotplug/cpci_hotplug_pci.c
> index 7d48eca..788db48 100644
> --- a/drivers/pci/hotplug/cpci_hotplug_pci.c
> +++ b/drivers/pci/hotplug/cpci_hotplug_pci.c
> @@ -286,11 +286,12 @@ int cpci_configure_slot(struct slot *slot)
>  	}
>  	parent = slot->dev->bus;
>  
> -	list_for_each_entry(dev, &parent->devices, bus_list)
> +	list_for_each_entry(dev, &parent->devices, bus_list) {
>  		if (PCI_SLOT(dev->devfn) != PCI_SLOT(slot->devfn))
>  			continue;
>  		if (pci_is_bridge(dev))
>  			pci_hp_add_bridge(dev);
> +	}
>  

Good fix.

Acked-by: Yijing Wang <wangyijing@huawei.com>

Thanks!
Yijing.

>  
>  	pci_assign_unassigned_bridge_resources(parent->self);
> 
> 


-- 
Thanks!
Yijing

