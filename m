From: Bjorn Helgaas <helgaas@kernel.org>
Date: Fri, 28 Sep 2018 17:29:08 +0000
Subject: Re: [PATCH -next] PCI: hotplug: Use kmemdup rather than duplicating its implementation in pnv_php_ad
Message-Id: <20180928172908.GC18434@bhelgaas-glaptop.roam.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538031141-138417-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538031141-138417-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Sep 27, 2018 at 06:52:21AM +0000, YueHaibing wrote:
> Use kmemdup rather than duplicating its implementation
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied with Michael's ack to pci/hotplug for v4.20, thanks!

> ---
>  drivers/pci/hotplug/pnv_php.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
> index 5070620..ee54f5b 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -275,14 +275,13 @@ static int pnv_php_add_devtree(struct pnv_php_slot *php_slot)
>  		goto free_fdt1;
>  	}
>  
> -	fdt = kzalloc(fdt_totalsize(fdt1), GFP_KERNEL);
> +	fdt = kmemdup(fdt1, fdt_totalsize(fdt1), GFP_KERNEL);
>  	if (!fdt) {
>  		ret = -ENOMEM;
>  		goto free_fdt1;
>  	}
>  
>  	/* Unflatten device tree blob */
> -	memcpy(fdt, fdt1, fdt_totalsize(fdt1));
>  	dt = of_fdt_unflatten_tree(fdt, php_slot->dn, NULL);
>  	if (!dt) {
>  		ret = -EINVAL;
> 
> 
> 
