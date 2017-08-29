From: Doug Ledford <dledford@redhat.com>
Date: Tue, 29 Aug 2017 00:36:12 +0000
Subject: Re: [PATCH] RDMA/qedr: Missing error code in qedr_init_user_queue()
Message-Id: <1503966972.52034.21.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170825081839.5ahvp6pehrhyyf2z@mwanda>
In-Reply-To: <20170825081839.5ahvp6pehrhyyf2z@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Ram Amrani <Ram.Amrani-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Michal <Michal.Kalderon-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Cc: Ariel Elior <Ariel.Elior-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, 2017-08-25 at 11:18 +0300, Dan Carpenter wrote:
> We should return -ENOMEM if the kzalloc() fails.  We currently return
> success.
> 
> Fixes: 69ad0e7fe845 ("RDMA/qedr: Add support for iWARP in user
> space")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied on top of my k.o/net-next-based branch.

> 
> diff --git a/drivers/infiniband/hw/qedr/verbs.c
> b/drivers/infiniband/hw/qedr/verbs.c
> index 4e14a558734b..bce4f79370e6 100644
> --- a/drivers/infiniband/hw/qedr/verbs.c
> +++ b/drivers/infiniband/hw/qedr/verbs.c
> @@ -821,8 +821,10 @@ static inline int qedr_init_user_queue(struct
> ib_ucontext *ib_ctx,
>  				   FW_PAGE_SHIFT);
>  	} else {
>  		q->pbl_tbl = kzalloc(sizeof(*q->pbl_tbl),
> GFP_KERNEL);
> -		if (!q->pbl_tbl)
> +		if (!q->pbl_tbl) {
> +			rc = -ENOMEM;
>  			goto err0;
> +		}
>  	}
>  
>  	return 0;
-- 
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint = AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD

