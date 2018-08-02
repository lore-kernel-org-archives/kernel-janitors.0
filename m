From: Raju Rangoju <rajur@chelsio.com>
Date: Thu, 02 Aug 2018 12:23:38 +0000
Subject: Re: [PATCH] rdma/cxgb4: fix some info leaks
Message-Id: <20180802121117.GA3244@chelsio.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180802075613.4zu6m6rv2dcumr5l@kili.mountain>
In-Reply-To: <20180802075613.4zu6m6rv2dcumr5l@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thursday, August 08/02/18, 2018 at 10:56:13 +0300, Dan Carpenter wrote:
> In c4iw_create_qp() there are several struct members which potentially
> aren't inintialized like uresp.rq_key.  I've fixed this code before in
> in commit ae1fe07f3f42 ("RDMA/cxgb4: Fix stack info leak in
> c4iw_create_qp()") so this time I'm just going to take a big hammer
> approach and memset the whole struct to zero.  Hopefully, it will stay
> fixed this time.
> 
> In c4iw_create_srq() we don't clear uresp.reserved.
> 
> Fixes: 6a0b6174d35a ("rdma/cxgb4: Add support for kernel mode SRQ's")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> These bugs are detected with Smatch btw if you want to go back to fixing
> them yourselves in a more delicate way.
> 
> diff --git a/drivers/infiniband/hw/cxgb4/qp.c b/drivers/infiniband/hw/cxgb4/qp.c
> index 62e2c0d899f5..ba08e0839033 100644
> --- a/drivers/infiniband/hw/cxgb4/qp.c
> +++ b/drivers/infiniband/hw/cxgb4/qp.c
> @@ -2088,6 +2088,7 @@ struct ib_qp *c4iw_create_qp(struct ib_pd *pd, struct ib_qp_init_attr *attrs,
>  				goto err_free_sq_db_key;
>  			}
>  		}
> +		memset(&uresp, 0, sizeof(uresp));
>  		if (t4_sq_onchip(&qhp->wq.sq)) {
>  			ma_sync_key_mm = kmalloc(sizeof(*ma_sync_key_mm),
>  						 GFP_KERNEL);
> @@ -2096,8 +2097,7 @@ struct ib_qp *c4iw_create_qp(struct ib_pd *pd, struct ib_qp_init_attr *attrs,
>  				goto err_free_rq_db_key;
>  			}
>  			uresp.flags = C4IW_QPF_ONCHIP;
> -		} else
> -			uresp.flags = 0;
> +		}
>  		uresp.qid_mask = rhp->rdev.qpmask;
>  		uresp.sqid = qhp->wq.sq.qid;
>  		uresp.sq_size = qhp->wq.sq.size;
> @@ -2111,8 +2111,6 @@ struct ib_qp *c4iw_create_qp(struct ib_pd *pd, struct ib_qp_init_attr *attrs,
>  		if (ma_sync_key_mm) {
>  			uresp.ma_sync_key = ucontext->key;
>  			ucontext->key += PAGE_SIZE;
> -		} else {
> -			uresp.ma_sync_key =  0;
>  		}
>  		uresp.sq_key = ucontext->key;
>  		ucontext->key += PAGE_SIZE;
> @@ -2601,6 +2599,7 @@ struct ib_srq *c4iw_create_srq(struct ib_pd *pd, struct ib_srq_init_attr *attrs,
>  			ret = -ENOMEM;
>  			goto err_free_srq_key_mm;
>  		}
> +		memset(&uresp, 0, sizeof(uresp));
>  		uresp.flags = srq->flags;
>  		uresp.qid_mask = rhp->rdev.qpmask;
>  		uresp.srqid = srq->wq.qid;

Thanks Dan.

Acked-by: Raju Rangoju <rajur@chelsio.com>
