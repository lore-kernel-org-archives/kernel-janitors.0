From: Alex Williamson <alex.williamson@redhat.com>
Date: Thu, 19 Nov 2015 23:55:25 +0000
Subject: Re: [PATCH 9/9] vfio-pci: constify pci_error_handlers structures
Message-Id: <1447977325.4697.212.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1447495621-9161-1-git-send-email-Julia.Lawall@lip6.fr>
	 <1447495621-9161-10-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1447495621-9161-10-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 2015-11-14 at 11:07 +0100, Julia Lawall wrote:
> This pci_error_handlers structure is never modified, like all the other
> pci_error_handlers structures, so declare it as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> There are no dependencies between these patches.
> 
>  drivers/vfio/pci/vfio_pci.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
> index 32b88bd..2760a7b 100644
> --- a/drivers/vfio/pci/vfio_pci.c
> +++ b/drivers/vfio/pci/vfio_pci.c
> @@ -1035,7 +1035,7 @@ static pci_ers_result_t vfio_pci_aer_err_detected(struct pci_dev *pdev,
>  	return PCI_ERS_RESULT_CAN_RECOVER;
>  }
>  
> -static struct pci_error_handlers vfio_err_handlers = {
> +static const struct pci_error_handlers vfio_err_handlers = {
>  	.error_detected = vfio_pci_aer_err_detected,
>  };
>  
> 

Thank you!  I'll queue this one in my tree.

Alex

