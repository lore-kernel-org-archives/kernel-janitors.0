From: Yuval Shaia <yuval.shaia@oracle.com>
Date: Thu, 09 Mar 2017 12:03:15 +0000
Subject: Re: [PATCH 19/26] IB/ocrdma: Improve another size determination in ocrdma_alloc_mr()
Message-Id: <20170309120314.GK3307@yuval-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc421509-4069-da8a-b308-60b49ea91ada@users.sourceforge.net>
 <efefdc96-2db5-dd80-3cc4-e88537fe2d49@users.sourceforge.net>
In-Reply-To: <efefdc96-2db5-dd80-3cc4-e88537fe2d49-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devesh Sharma <devesh.sharma-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Selvin Xavier <selvin.xavier-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Mar 08, 2017 at 02:20:42PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 8 Mar 2017 09:54:42 +0100
> 
> Replace the specification of a data type by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/infiniband/hw/ocrdma/ocrdma_verbs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
> index 330617e1ef75..05d55d361cfe 100644
> --- a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
> +++ b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
> @@ -3030,7 +3030,7 @@ struct ib_mr *ocrdma_alloc_mr(struct ib_pd *ibpd,
>  	if (!mr)
>  		return ERR_PTR(-ENOMEM);
>  
> -	mr->pages = kcalloc(max_num_sg, sizeof(u64), GFP_KERNEL);
> +	mr->pages = kcalloc(max_num_sg, sizeof(*mr->pages), GFP_KERNEL);

Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>

>  	if (!mr->pages) {
>  		status = -ENOMEM;
>  		goto pl_err;
> -- 
> 2.12.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-rdma" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
