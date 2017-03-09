From: Yuval Shaia <yuval.shaia@oracle.com>
Date: Thu, 09 Mar 2017 12:01:39 +0000
Subject: Re: [PATCH 22/26] IB/ocrdma: Returning only value constants in ocrdma_resize_cq()
Message-Id: <20170309120139.GJ3307@yuval-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc421509-4069-da8a-b308-60b49ea91ada@users.sourceforge.net>
 <dd638070-d1d6-44e8-6c10-16919b59482c@users.sourceforge.net>
In-Reply-To: <dd638070-d1d6-44e8-6c10-16919b59482c-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devesh Sharma <devesh.sharma-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Selvin Xavier <selvin.xavier-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Mar 08, 2017 at 02:26:16PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 8 Mar 2017 10:48:24 +0100
> 
> Return constant integer values without storing them in the local
> variable "status".
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/infiniband/hw/ocrdma/ocrdma_verbs.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
> index bedc229be89d..1d25512416f5 100644
> --- a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
> +++ b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
> @@ -1123,15 +1123,12 @@ struct ib_cq *ocrdma_create_cq(struct ib_device *ibdev,
>  int ocrdma_resize_cq(struct ib_cq *ibcq, int new_cnt,
>  		     struct ib_udata *udata)
>  {
> -	int status = 0;
>  	struct ocrdma_cq *cq = get_ocrdma_cq(ibcq);
>  
> -	if (new_cnt < 1 || new_cnt > cq->max_hw_cqe) {
> -		status = -EINVAL;
> -		return status;
> -	}
> +	if (new_cnt < 1 || new_cnt > cq->max_hw_cqe)
> +		return -EINVAL;
>  	ibcq->cqe = new_cnt;
> -	return status;
> +	return 0;

Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>

>  }
>  
>  static void ocrdma_flush_cq(struct ocrdma_cq *cq)
> -- 
> 2.12.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-rdma" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
