From: Yuval Shaia <yuval.shaia@oracle.com>
Date: Thu, 09 Mar 2017 11:42:14 +0000
Subject: Re: [PATCH 16/26] IB/ocrdma: Adjust a null pointer check in ocrdma_alloc_resources()
Message-Id: <20170309114213.GC3307@yuval-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc421509-4069-da8a-b308-60b49ea91ada@users.sourceforge.net>
 <54750756-91cd-b508-109a-83b7b2375193@users.sourceforge.net>
In-Reply-To: <54750756-91cd-b508-109a-83b7b2375193-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devesh Sharma <devesh.sharma-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Selvin Xavier <selvin.xavier-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Mar 08, 2017 at 02:15:34PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 7 Mar 2017 22:34:33 +0100
> 
> The script "checkpatch.pl" pointed information out like the following.
> 
> Comparison to NULL could be written "!dev->stag_arr".
> 
> Thus fix the affected source code place.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/infiniband/hw/ocrdma/ocrdma_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_main.c b/drivers/infiniband/hw/ocrdma/ocrdma_main.c
> index 93113feeb2d5..fbf672c79d5f 100644
> --- a/drivers/infiniband/hw/ocrdma/ocrdma_main.c
> +++ b/drivers/infiniband/hw/ocrdma/ocrdma_main.c
> @@ -238,7 +238,7 @@ static int ocrdma_alloc_resources(struct ocrdma_dev *dev)
>  
>  	dev->stag_arr = kcalloc(OCRDMA_MAX_STAG, sizeof(*dev->stag_arr),
>  				GFP_KERNEL);
> -	if (dev->stag_arr = NULL)
> +	if (!dev->stag_arr)
>  		goto alloc_err;

Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>

>  
>  	ocrdma_alloc_pd_pool(dev);
> -- 
> 2.12.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-rdma" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
