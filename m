From: "Amrani, Ram" <Ram.Amrani@cavium.com>
Date: Tue, 15 Nov 2016 10:28:46 +0000
Subject: RE: [patch] qedr: Unlock on error in qedr_post_send()
Message-Id: <DM3PR07MB220156E77D0C7992E1D88678F8BF0@DM3PR07MB2201.namprd07.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161115095059.GB15424@mwanda>
In-Reply-To: <20161115095059.GB15424@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Borundia, Rajesh" <Rajesh.Borundia-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wei Yongjun <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

> If "wr" is NULL then we return without unlocking.  I added an unlock
> label and changed the direct returns to gotos.
> 
> Fixes: afa0e13be754 ("qedr: Add support for data path")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/infiniband/hw/qedr/verbs.c
> b/drivers/infiniband/hw/qedr/verbs.c
> index a615142..01d05b0 100644
> --- a/drivers/infiniband/hw/qedr/verbs.c
> +++ b/drivers/infiniband/hw/qedr/verbs.c
> @@ -2973,17 +2973,18 @@ int qedr_post_send(struct ib_qp *ibqp, struct
> ib_send_wr *wr,
> 
>  	if ((qp->state == QED_ROCE_QP_STATE_RESET) ||
>  	    (qp->state == QED_ROCE_QP_STATE_ERR)) {
> -		spin_unlock_irqrestore(&qp->q_lock, flags);
>  		*bad_wr = wr;
>  		DP_DEBUG(dev, QEDR_MSG_CQ,
>  			 "QP in wrong state! QP icid=0x%x state %d\n",
>  			 qp->icid, qp->state);
> -		return -EINVAL;
> +		rc = -EINVAL;
> +		goto unlock;
>  	}
> 
>  	if (!wr) {
>  		DP_ERR(dev, "Got an empty post send.\n");
> -		return -EINVAL;
> +		rc = -EINVAL;
> +		goto unlock;
>  	}
> 
>  	while (wr) {
> @@ -3012,6 +3013,7 @@ int qedr_post_send(struct ib_qp *ibqp, struct
> ib_send_wr *wr,
>  	/* Make sure write sticks */
>  	mmiowb();
> 
> +unlock:
>  	spin_unlock_irqrestore(&qp->q_lock, flags);
> 
>  	return rc;

Thanks for catching this. However this was already taken care of by Wei Yongjun in a different manner.
See: https://patchwork.kernel.org/patch/9409053/ 

Thanks,
Ram

