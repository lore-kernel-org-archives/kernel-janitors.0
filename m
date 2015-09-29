From: Joerg Roedel <joro@8bytes.org>
Date: Tue, 29 Sep 2015 13:41:19 +0000
Subject: Re: [PATCH 38/39] iommu/amd: drop null test before destroy functions
Message-Id: <20150929134119.GB7572@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
 <1442146532-9100-39-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-39-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org

On Sun, Sep 13, 2015 at 02:15:31PM +0200, Julia Lawall wrote:
> Remove unneeded NULL test.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@ expression x; @@
> -if (x != NULL) {
>   \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
>   x = NULL;
> -}
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/iommu/amd_iommu_init.c |    7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Applied, thanks.

