From: Yuval Shaia <yuval.shaia@oracle.com>
Date: Wed, 05 Apr 2017 14:34:39 +0000
Subject: Re: [PATCH 1/5] IB/qib: Use kcalloc() in qib_init_iba7322_funcs()
Message-Id: <20170405143438.GC5006@yuval-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c16b18ac-287f-5faf-b79a-c86e2adfa22c@users.sourceforge.net>
 <5e5e00d3-b6a4-7371-65be-c5fe387d26b3@users.sourceforge.net>
In-Reply-To: <5e5e00d3-b6a4-7371-65be-c5fe387d26b3-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Marciniszyn <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Apr 05, 2017 at 03:51:52PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 5 Apr 2017 09:43:54 +0200
> 
> * A multiplication for the size determination of a memory allocation
>   indicated that an array data structure should be processed.
>   Thus use the corresponding function "kcalloc".
> 
>   This issue was detected by using the Coccinelle software.
> 
> * Replace the specification of a data structure by a pointer dereference
>   to make the corresponding size determination a bit safer according to
>   the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/infiniband/hw/qib/qib_iba7322.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/infiniband/hw/qib/qib_iba7322.c b/drivers/infiniband/hw/qib/qib_iba7322.c
> index af9f596bb68b..e4e4e675c89c 100644
> --- a/drivers/infiniband/hw/qib/qib_iba7322.c
> +++ b/drivers/infiniband/hw/qib/qib_iba7322.c
> @@ -7324,8 +7324,9 @@ struct qib_devdata *qib_init_iba7322_funcs(struct pci_dev *pdev,
>  		actual_cnt -= dd->num_pports;
>  
>  	tabsize = actual_cnt;
> -	dd->cspec->msix_entries = kzalloc(tabsize *
> -			sizeof(struct qib_msix_entry), GFP_KERNEL);
> +	dd->cspec->msix_entries = kcalloc(tabsize,
> +					  sizeof(*dd->cspec->msix_entries),
> +					  GFP_KERNEL);

Are we fine with loosing the zeroing of the entries?

>  	if (!dd->cspec->msix_entries)
>  		tabsize = 0;
>  
> -- 
> 2.12.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-rdma" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
