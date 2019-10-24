From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Thu, 24 Oct 2019 16:37:49 +0000
Subject: Re: [PATCH] RDMA/hns: prevent undefined behavior in hns_roce_set_user_sq_size()
Message-Id: <20191024163749.GX23952@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190608092514.GC28890@mwanda>
 <20191007121821.GI21515@kadam>
In-Reply-To: <20191007121821.GI21515@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lijun Ou <oulijun@huawei.com>, "Wei Hu(Xavier)" <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Oct 07, 2019 at 03:18:22PM +0300, Dan Carpenter wrote:
> This one still needs to be applied.
> 
> regards,
> dan carpenter

Weird, it is marked changes requested in patchworks. An email must
have been lost??

I think I probably wanted to say that:

> >  	/* Sanity check SQ size before proceeding */
> > -	if ((u32)(1 << ucmd->log_sq_bb_count) > hr_dev->caps.max_wqes ||
> > +	if (ucmd->log_sq_bb_count > 31 ||
> > +	    (u32)(1 << ucmd->log_sq_bb_count) > hr_dev->caps.max_wqes
> > ||

Overall should probably be coded using check_shl_overflow(), as this
later shift:

	hr_qp->sq.wqe_cnt = 1 << ucmd->log_sq_bb_count;

Is storing it into an int and hardwring '31' because it magically
matches that lower shift is pretty fragile.

More like this?

diff --git a/drivers/infiniband/hw/hns/hns_roce_qp.c b/drivers/infiniband/hw/hns/hns_roce_qp.c
index bec48f2593f405..6aa27d6ea3a600 100644
--- a/drivers/infiniband/hw/hns/hns_roce_qp.c
+++ b/drivers/infiniband/hw/hns/hns_roce_qp.c
@@ -332,9 +332,8 @@ static int check_sq_size_with_integrity(struct hns_roce_dev *hr_dev,
 	u8 max_sq_stride = ilog2(roundup_sq_stride);
 
 	/* Sanity check SQ size before proceeding */
-	if ((u32)(1 << ucmd->log_sq_bb_count) > hr_dev->caps.max_wqes ||
-	     ucmd->log_sq_stride > max_sq_stride ||
-	     ucmd->log_sq_stride < HNS_ROCE_IB_MIN_SQ_STRIDE) {
+	if (ucmd->log_sq_stride > max_sq_stride ||
+	    ucmd->log_sq_stride < HNS_ROCE_IB_MIN_SQ_STRIDE) {
 		ibdev_err(&hr_dev->ib_dev, "check SQ size error!\n");
 		return -EINVAL;
 	}
@@ -358,13 +357,16 @@ static int hns_roce_set_user_sq_size(struct hns_roce_dev *hr_dev,
 	u32 max_cnt;
 	int ret;
 
+	if (check_shl_overflow(1, ucmd->log_sq_bb_count, &hr_qp->sq.wqe_cnt) ||
+	    hr_qp->sq.wqe_cnt > hr_dev->caps.max_wqes)
+		return -EINVAL;
+
 	ret = check_sq_size_with_integrity(hr_dev, cap, ucmd);
 	if (ret) {
 		ibdev_err(&hr_dev->ib_dev, "Sanity check sq size failed\n");
 		return ret;
 	}
 
-	hr_qp->sq.wqe_cnt = 1 << ucmd->log_sq_bb_count;
 	hr_qp->sq.wqe_shift = ucmd->log_sq_stride;
 
 	max_cnt = max(1U, cap->max_send_sge);
