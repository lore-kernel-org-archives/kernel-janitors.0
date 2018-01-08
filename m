From: haver <haver@linux.vnet.ibm.com>
Date: Mon, 08 Jan 2018 12:50:55 +0000
Subject: Re: [PATCH 3/3] GenWQE: Adjust 12 checks for null pointers
Message-Id: <f0998daeca45411ab0b161464ac2931d@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e1b73b1a-ae0a-b76b-33d7-4dc5af8e39b5@users.sourceforge.net>
 <49115f17-73f9-de03-d0cd-7a76c3c43dcc@users.sourceforge.net>
In-Reply-To: <49115f17-73f9-de03-d0cd-7a76c3c43dcc@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?J=C3=B6rg-Stephan_Vogt?= <jsvogt@de.ibm.com>, Michael Jung <MIJUNG@de.ibm.com>, =?UTF-8?Q?Michael_R=C3=BCttger?= <michael@ibmra.de>

Hi Markus,

On 2018-01-08 10:43, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 8 Jan 2018 10:21:25 +0100
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> The script “checkpatch.pl” pointed information out like the 
> following.
> 
> Comparison to NULL could be written …
> 
> Thus fix the affected source code places.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/misc/genwqe/card_utils.c | 29 +++++++++++++----------------
>  1 file changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/misc/genwqe/card_utils.c 
> b/drivers/misc/genwqe/card_utils.c
> index 0b466664c908..84408dc69020 100644
> --- a/drivers/misc/genwqe/card_utils.c
> +++ b/drivers/misc/genwqe/card_utils.c
> @@ -58,7 +58,7 @@ int __genwqe_writeq(struct genwqe_dev *cd, u64
> byte_offs, u64 val)
>  	if (cd->err_inject & GENWQE_INJECT_HARDWARE_FAILURE)
>  		return -EIO;
> 
> -	if (cd->mmio = NULL)
> +	if (!cd->mmio)
>  		return -EIO;
> 
>  	if (pci_channel_offline(pci_dev))
> @@ -88,7 +88,7 @@ u64 __genwqe_readq(struct genwqe_dev *cd, u64 
> byte_offs)
>  	    (byte_offs = IO_SLC_CFGREG_GFIR))
>  		return 0x00000000ffff0000ull;
> 
> -	if (cd->mmio = NULL)
> +	if (!cd->mmio)
>  		return 0xffffffffffffffffull;
> 
>  	return be64_to_cpu((__force __be64)__raw_readq(cd->mmio + 
> byte_offs));
> @@ -109,7 +109,7 @@ int __genwqe_writel(struct genwqe_dev *cd, u64
> byte_offs, u32 val)
>  	if (cd->err_inject & GENWQE_INJECT_HARDWARE_FAILURE)
>  		return -EIO;
> 
> -	if (cd->mmio = NULL)
> +	if (!cd->mmio)
>  		return -EIO;
> 
>  	if (pci_channel_offline(pci_dev))
> @@ -131,7 +131,7 @@ u32 __genwqe_readl(struct genwqe_dev *cd, u64 
> byte_offs)
>  	if (cd->err_inject & GENWQE_INJECT_HARDWARE_FAILURE)
>  		return 0xffffffff;
> 
> -	if (cd->mmio = NULL)
> +	if (!cd->mmio)
>  		return 0xffffffff;
> 
>  	return be32_to_cpu((__force __be32)__raw_readl(cd->mmio + 
> byte_offs));
> @@ -227,7 +227,7 @@ void *__genwqe_alloc_consistent(struct genwqe_dev
> *cd, size_t size,
>  void __genwqe_free_consistent(struct genwqe_dev *cd, size_t size,
>  			     void *vaddr, dma_addr_t dma_handle)
>  {
> -	if (vaddr = NULL)
> +	if (!vaddr)
>  		return;
> 
>  	dma_free_coherent(&cd->pci_dev->dev, size, vaddr, dma_handle);
> @@ -323,7 +323,7 @@ int genwqe_alloc_sync_sgl(struct genwqe_dev *cd,
> struct genwqe_sgl *sgl,
> 
>  	sgl->sgl = __genwqe_alloc_consistent(cd, sgl->sgl_size,
>  					     &sgl->sgl_dma_addr);
> -	if (sgl->sgl = NULL) {
> +	if (!sgl->sgl) {
>  		dev_err(&pci_dev->dev,
>  			"[%s] err: no memory available!\n", __func__);
>  		return -ENOMEM;
> @@ -333,7 +333,7 @@ int genwqe_alloc_sync_sgl(struct genwqe_dev *cd,
> struct genwqe_sgl *sgl,
>  	if ((sgl->fpage_size != 0) && (sgl->fpage_size != PAGE_SIZE)) {
>  		sgl->fpage = __genwqe_alloc_consistent(cd, PAGE_SIZE,
>  						       &sgl->fpage_dma_addr);
> -		if (sgl->fpage = NULL)
> +		if (!sgl->fpage)
>  			goto err_out;
> 
>  		/* Sync with user memory */
> @@ -346,7 +346,7 @@ int genwqe_alloc_sync_sgl(struct genwqe_dev *cd,
> struct genwqe_sgl *sgl,
>  	if (sgl->lpage_size != 0) {
>  		sgl->lpage = __genwqe_alloc_consistent(cd, PAGE_SIZE,
>  						       &sgl->lpage_dma_addr);
> -		if (sgl->lpage = NULL)
> +		if (!sgl->lpage)
>  			goto err_out1;
> 
>  		/* Sync with user memory */
> @@ -406,15 +406,12 @@ int genwqe_setup_sgl(struct genwqe_dev *cd,
> struct genwqe_sgl *sgl,
>  			/* DMA mapping for requested page, offs, size */
>  			size_to_map = min(size, PAGE_SIZE - map_offs);
> 
> -			if ((p = 0) && (sgl->fpage != NULL)) {
> +			if (p = 0 && sgl->fpage)
>  				daddr = sgl->fpage_dma_addr + map_offs;
> -
> -			} else if ((p = sgl->nr_pages - 1) &&
> -				   (sgl->lpage != NULL)) {
> +			else if ((p = sgl->nr_pages - 1) && sgl->lpage)
>  				daddr = sgl->lpage_dma_addr;
> -			} else {
> +			else
>  				daddr = dma_list[p] + map_offs;
> -			}
> 
>  			size -= size_to_map;
>  			map_offs = 0;
> @@ -538,7 +535,7 @@ static int genwqe_free_user_pages(struct page 
> **page_list,
>  	unsigned int i;
> 
>  	for (i = 0; i < nr_pages; i++) {
> -		if (page_list[i] != NULL) {
> +		if (page_list[i]) {
>  			if (dirty)
>  				set_page_dirty_lock(page_list[i]);
>  			put_page(page_list[i]);
> @@ -577,7 +574,7 @@ int genwqe_user_vmap(struct genwqe_dev *cd, struct
> dma_mapping *m, void *uaddr,
>  	unsigned long data, offs;
>  	struct pci_dev *pci_dev = cd->pci_dev;
> 
> -	if ((uaddr = NULL) || (size = 0)) {
> +	if (!uaddr || size = 0) {
>  		m->size = 0;	/* mark unused and not added */
>  		return -EINVAL;
>  	}

I personally like the explicit compare (ptr != NULL) more than the !ptr 
notation.
When was the checkpatch.pl script modified to suggest the latter 
notation?
Is there any advantage other than the shorter notation?

Regards

Frank

