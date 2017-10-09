From: haver <haver@linux.vnet.ibm.com>
Date: Mon, 09 Oct 2017 07:08:59 +0000
Subject: Re: [PATCH 2/6] GenWQE: constify pci_error_handlers structures
Message-Id: <5e23b4b0a5cd36df134d97c61cecb24b@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502516674-8918-1-git-send-email-Julia.Lawall@lip6.fr>
 <1502516674-8918-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502516674-8918-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org

On 2017-08-12 07:44, Julia Lawall wrote:
> These pci_error_handlers structures are only stored in the err_handler
> field of a pci_driver structure, and this field is declared as const.  
> Thus
> the pci_error_handlers structures can be const too.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/misc/genwqe/card_base.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/genwqe/card_base.c 
> b/drivers/misc/genwqe/card_base.c
> index 4fd21e8..8650046 100644
> --- a/drivers/misc/genwqe/card_base.c
> +++ b/drivers/misc/genwqe/card_base.c
> @@ -1333,7 +1333,7 @@ static int genwqe_sriov_configure(struct pci_dev
> *dev, int numvfs)
>  	return 0;
>  }
> 
> -static struct pci_error_handlers genwqe_err_handler = {
> +static const struct pci_error_handlers genwqe_err_handler = {
>  	.error_detected = genwqe_err_error_detected,
>  	.mmio_enabled	= genwqe_err_result_none,
>  	.slot_reset	= genwqe_err_slot_reset,

Fine with me. Thanks for the contribution.

Acked-by: Frank Haverkamp <haver@linux.vnet.ibm.com>

