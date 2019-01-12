From: Balbir Singh <bsingharora@gmail.com>
Date: Sat, 12 Jan 2019 00:30:35 +0000
Subject: Re: [PATCH] powerpc/powernv/npu: Allocate enough memory in pnv_try_setup_npu_table_group()
Message-Id: <20190112003035.GA10427@350D>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190109102328.GB5476@kadam>
In-Reply-To: <20190109102328.GB5476@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Mark Hairgrove <mhairgrove@nvidia.com>, kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org

On Wed, Jan 09, 2019 at 01:23:29PM +0300, Dan Carpenter wrote:
> There is a typo so we accidentally allocate enough memory for a pointer
> when we wanted to allocate enough for a struct.
> 
> Fixes: 0bd971676e68 ("powerpc/powernv/npu: Add compound IOMMU groups")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  arch/powerpc/platforms/powernv/npu-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
> index d7f742ed48ba..3f58c7dbd581 100644
> --- a/arch/powerpc/platforms/powernv/npu-dma.c
> +++ b/arch/powerpc/platforms/powernv/npu-dma.c
> @@ -564,7 +564,7 @@ struct iommu_table_group *pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
>  		}
>  	} else {
>  		/* Create a group for 1 GPU and attached NPUs for POWER8 */
> -		pe->npucomp = kzalloc(sizeof(pe->npucomp), GFP_KERNEL);
> +		pe->npucomp = kzalloc(sizeof(*pe->npucomp), GFP_KERNEL);

To avoid these in the future, I wonder if instead of sizeof(pe->npucomp), we insist on
sizeof structure

pe->npucomp = kzalloc(sizeof(struct npucomp), GFP_KERNEL);

Acked-by: Balbir Singh <bsingharora@gmail.com>
