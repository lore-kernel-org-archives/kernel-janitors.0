From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Date: Thu, 20 Sep 2018 15:41:37 +0000
Subject: Re: [PATCH] PCI: hv: Fix return value check in hv_pci_assign_slots()
Message-Id: <20180920154130.GA7693@e107981-ln.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537425631-28460-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1537425631-28460-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, Bjorn Helgaas <bhelgaas@google.com>, devel@linuxdriverproject.org, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, David Miller <davem@davemloft.net>, netdev@vger.kernel.org

[+DaveM, netdev]

Removed erroneously added disclaimer, apologies.

On Thu, Sep 20, 2018 at 06:40:31AM +0000, Wei Yongjun wrote:
> In case of error, the function pci_create_slot() returns ERR_PTR() and
> never returns NULL. The NULL test in the return value check should be
> replaced with IS_ERR().
> 
> Fixes: a15f2c08c708 ("PCI: hv: support reporting serial number as slot information")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/pci/controller/pci-hyperv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
> index ee80e79..9ba4d12 100644
> --- a/drivers/pci/controller/pci-hyperv.c
> +++ b/drivers/pci/controller/pci-hyperv.c
> @@ -1484,8 +1484,10 @@ static void hv_pci_assign_slots(struct hv_pcibus_device *hbus)
>  		snprintf(name, SLOT_NAME_SIZE, "%u", hpdev->desc.ser);
>  		hpdev->pci_slot = pci_create_slot(hbus->pci_bus, slot_nr,
>  					  name, NULL);
> -		if (!hpdev->pci_slot)
> +		if (IS_ERR(hpdev->pci_slot)) {
>  			pr_warn("pci_create slot %s failed\n", name);
> +			hpdev->pci_slot = NULL;
> +		}
>  	}
>  }

I am dropping this patch from the PCI queue since the original series
is now queued in net-next.

Lorenzo
