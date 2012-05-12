From: walter harms <wharms@bfs.de>
Date: Sat, 12 May 2012 12:36:42 +0000
Subject: Re: [patch] iommu: off by one in dmar_get_fault_reason()
Message-Id: <4FAE595A.6010605@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120512105935.GA19472@elgon.mountain>
In-Reply-To: <20120512105935.GA19472@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@elte.hu>, Joerg Roedel <joerg.roedel@amd.com>, Thomas Gleixner <tglx@linutronix.de>, Youquan Song <youquan.song@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 12.05.2012 12:59, schrieb Dan Carpenter:
> fault_reason = ARRAY_SIZE(irq_remap_fault_reasons) + 0x20 - 0x20 is one
> past the end of the array.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/iommu/dmar.c b/drivers/iommu/dmar.c
> index 5ef65cf..9390f3f 100644
> --- a/drivers/iommu/dmar.c
> +++ b/drivers/iommu/dmar.c
> @@ -1057,7 +1057,7 @@ static const char *irq_remap_fault_reasons[] >  
>  const char *dmar_get_fault_reason(u8 fault_reason, int *fault_type)
>  {
> -	if (fault_reason >= 0x20 && (fault_reason <= 0x20 +
> +	if (fault_reason >= 0x20 && (fault_reason < 0x20 +
>  				     ARRAY_SIZE(irq_remap_fault_reasons))) {
>  		*fault_type = INTR_REMAP;
>  		return irq_remap_fault_reasons[fault_reason - 0x20];

perhaps this is more readable:
if (fault_reason >= 0x20 && (fault_reason - 0x20 < ARRAY_SIZE(irq_remap_fault_reasons)))

re,
 wh
