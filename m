From: Yuval Shaia <yuval.shaia@oracle.com>
Date: Thu, 17 Nov 2016 16:38:47 +0000
Subject: Re: [patch] IB/rxe: Remove unneeded cast in rxe_srq_from_attr()
Message-Id: <20161117163846.GA6436@yuval-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161117110005.GB32143@mwanda>
 <20161117121554.GA4292@yuval-lap.uk.oracle.com>
In-Reply-To: <20161117121554.GA4292-Hxa29pjIrETlQW142y8m19+IiqhCXseY@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Moni Shoua <monis-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Besides the soft-aggressive commit message -:)
Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>
 
On Thu, Nov 17, 2016 at 02:00:05PM +0300, Dan Carpenter wrote:
> It makes me nervous when we cast pointer parameters.  I would estimate
> that around 50% of the time, it indicates a bug.  Here the cast is not
> needed becaue u32 and and unsigned int are the same thing.  Removing the
> cast makes the code more robust and future proof in case any of the
> types change.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/infiniband/sw/rxe/rxe_srq.c b/drivers/infiniband/sw/rxe/rxe_srq.c
> index 2a6e3cd..efc832a 100644
> --- a/drivers/infiniband/sw/rxe/rxe_srq.c
> +++ b/drivers/infiniband/sw/rxe/rxe_srq.c
> @@ -169,7 +169,7 @@ int rxe_srq_from_attr(struct rxe_dev *rxe, struct rxe_srq *srq,
>  			}
>  		}
>  
> -		err = rxe_queue_resize(q, (unsigned int *)&attr->max_wr,
> +		err = rxe_queue_resize(q, &attr->max_wr,
>  				       rcv_wqe_size(srq->rq.max_sge),
>  				       srq->rq.queue->ip ?
>  						srq->rq.queue->ip->context :
> --
> To unsubscribe from this list: send the line "unsubscribe linux-rdma" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
