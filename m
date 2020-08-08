From: Jiri Slaby <jirislaby@kernel.org>
Date: Sat, 08 Aug 2020 07:03:59 +0000
Subject: Re: [PATCH] tty: synclink_gt: switch from 'pci_' to 'dma_' API
Message-Id: <56a97781-7312-605a-02a0-37bc03366c94@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200806054404.728854-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200806054404.728854-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 06. 08. 20, 7:44, Christophe JAILLET wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'alloc_desc()' and 'alloc_bufs()', GFP_KERNEL
> can be used because it is only called from a probe function and no lock is
> acquired.
> The call chain is:
>    init_one                    (the probe function)
>       --> device_init
>          --> alloc_dma_bufs
>             --> alloc_desc
>             --> alloc_bufs

Right.

...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

> ---
> If needed, see post from Christoph Hellwig on the kernel-janitors ML:
>    https://marc.info/?l=kernel-janitors&m8745678307186&w=4
> ---
>  drivers/tty/synclink_gt.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/tty/synclink_gt.c b/drivers/tty/synclink_gt.c
> index b794177ccfb9..1edf06653148 100644
> --- a/drivers/tty/synclink_gt.c
> +++ b/drivers/tty/synclink_gt.c
> @@ -3341,8 +3341,8 @@ static int alloc_desc(struct slgt_info *info)
>  	unsigned int pbufs;
>  
>  	/* allocate memory to hold descriptor lists */
> -	info->bufs = pci_zalloc_consistent(info->pdev, DESC_LIST_SIZE,
> -					   &info->bufs_dma_addr);
> +	info->bufs = dma_alloc_coherent(&info->pdev->dev, DESC_LIST_SIZE,
> +					&info->bufs_dma_addr, GFP_KERNEL);
>  	if (info->bufs = NULL)
>  		return -ENOMEM;
>  
> @@ -3384,7 +3384,8 @@ static int alloc_desc(struct slgt_info *info)
>  static void free_desc(struct slgt_info *info)
>  {
>  	if (info->bufs != NULL) {
> -		pci_free_consistent(info->pdev, DESC_LIST_SIZE, info->bufs, info->bufs_dma_addr);
> +		dma_free_coherent(&info->pdev->dev, DESC_LIST_SIZE,
> +				  info->bufs, info->bufs_dma_addr);
>  		info->bufs  = NULL;
>  		info->rbufs = NULL;
>  		info->tbufs = NULL;
> @@ -3395,7 +3396,9 @@ static int alloc_bufs(struct slgt_info *info, struct slgt_desc *bufs, int count)
>  {
>  	int i;
>  	for (i=0; i < count; i++) {
> -		if ((bufs[i].buf = pci_alloc_consistent(info->pdev, DMABUFSIZE, &bufs[i].buf_dma_addr)) = NULL)
> +		bufs[i].buf = dma_alloc_coherent(&info->pdev->dev, DMABUFSIZE,
> +						 &bufs[i].buf_dma_addr, GFP_KERNEL);
> +		if (!bufs[i].buf)
>  			return -ENOMEM;
>  		bufs[i].pbuf  = cpu_to_le32((unsigned int)bufs[i].buf_dma_addr);
>  	}
> @@ -3408,7 +3411,8 @@ static void free_bufs(struct slgt_info *info, struct slgt_desc *bufs, int count)
>  	for (i=0; i < count; i++) {
>  		if (bufs[i].buf = NULL)
>  			continue;
> -		pci_free_consistent(info->pdev, DMABUFSIZE, bufs[i].buf, bufs[i].buf_dma_addr);
> +		dma_free_coherent(&info->pdev->dev, DMABUFSIZE, bufs[i].buf,
> +				  bufs[i].buf_dma_addr);
>  		bufs[i].buf = NULL;
>  	}
>  }
> 

thanks,
-- 
js
