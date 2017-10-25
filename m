From: Alex Williamson <alex.williamson@redhat.com>
Date: Wed, 25 Oct 2017 21:54:46 +0000
Subject: Re: [PATCH] iommu/amd: remove unused variable flush_addr
Message-Id: <20171025235446.3ab07cfb@t450s.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171022114945.1479-1-colin.king@canonical.com>
In-Reply-To: <20171022114945.1479-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Sun, 22 Oct 2017 13:49:45 +0200
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable flush_addr is being assigned but is never read; it
> is redundant and can be removed. Cleans up the clang warning:
> 
> drivers/iommu/amd_iommu.c:2388:2: warning: Value stored to 'flush_addr'
> is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/iommu/amd_iommu.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
> index 5a72f40d6532..a99d41fc3a1d 100644
> --- a/drivers/iommu/amd_iommu.c
> +++ b/drivers/iommu/amd_iommu.c
> @@ -2382,11 +2382,9 @@ static void __unmap_single(struct dma_ops_domain *dma_dom,
>  			   size_t size,
>  			   int dir)
>  {
> -	dma_addr_t flush_addr;
>  	dma_addr_t i, start;
>  	unsigned int pages;
>  
> -	flush_addr = dma_addr;
>  	pages = iommu_num_pages(dma_addr, size, PAGE_SIZE);
>  	dma_addr &= PAGE_MASK;
>  	start = dma_addr;

Applied to iommu/updates for v4.15, thanks,

Alex
