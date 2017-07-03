From: Bjorn Helgaas <helgaas@kernel.org>
Date: Mon, 03 Jul 2017 13:00:58 +0000
Subject: Re: [PATCH] PCI: fix pci_try_reset_function()
Message-Id: <20170703130058.GB13824@bhelgaas-glaptop.roam.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170701135323.x5vaj4e2wcs2mcro@mwanda>
In-Reply-To: <20170701135323.x5vaj4e2wcs2mcro@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Christoph Hellwig <hch@lst.de>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jul 03, 2017 at 02:09:19PM +0300, Dan Carpenter wrote:
> There is a reversed if condition so the function doesn't work.
> 
> Fixes: e94fae7aeef4 ("PCI: Protect pci_error_handlers->reset_notify() usage with device_lock()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Folded into pci/virtualization, thanks!

> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 5b49d662f996..3bf28bf04c3d 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4269,7 +4269,7 @@ int pci_try_reset_function(struct pci_dev *dev)
>  	if (rc)
>  		return rc;
>  
> -	if (pci_dev_trylock(dev))
> +	if (!pci_dev_trylock(dev))
>  		return -EAGAIN;
>  
>  	pci_dev_save_and_disable(dev);
