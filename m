From: haver <haver@linux.vnet.ibm.com>
Date: Mon, 08 Jan 2018 12:45:02 +0000
Subject: Re: [PATCH 1/3] GenWQE: Delete an error message for a failed memory allocation in genwqe_user_vmap()
Message-Id: <127e28a8a4d9081eb323e3c7ab93dad0@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e1b73b1a-ae0a-b76b-33d7-4dc5af8e39b5@users.sourceforge.net>
 <b77e137c-6fb2-e5fa-3e18-9d611dd4f0c1@users.sourceforge.net>
In-Reply-To: <b77e137c-6fb2-e5fa-3e18-9d611dd4f0c1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?J=C3=B6rg-Stephan_Vogt?= <jsvogt@de.ibm.com>, Michael Jung <MIJUNG@de.ibm.com>, =?UTF-8?Q?Michael_R=C3=BCttger?= <michael@ibmra.de>

Hi Markus,

On 2018-01-08 10:41, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 8 Jan 2018 09:37:23 +0100
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/misc/genwqe/card_utils.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/misc/genwqe/card_utils.c 
> b/drivers/misc/genwqe/card_utils.c
> index 8f2e6442d88b..55c389a9e7d7 100644
> --- a/drivers/misc/genwqe/card_utils.c
> +++ b/drivers/misc/genwqe/card_utils.c
> @@ -593,7 +593,6 @@ int genwqe_user_vmap(struct genwqe_dev *cd, struct
> dma_mapping *m, void *uaddr,
>  			       sizeof(struct page *) + sizeof(dma_addr_t),
>  			       GFP_KERNEL);
>  	if (!m->page_list) {
> -		dev_err(&pci_dev->dev, "err: alloc page_list failed\n");

Are there different printouts which cover this? I mean the debug 
printout is not
appearing all the time, it must be enabled, if I remember correctly. So 
why do
you suggest to remove it?

>  		m->nr_pages = 0;
>  		m->u_vaddr = NULL;
>  		m->size = 0;	/* mark unused and not added */

Regards

Frank

