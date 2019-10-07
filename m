From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Oct 2019 12:18:22 +0000
Subject: Re: [PATCH] RDMA/hns: prevent undefined behavior in hns_roce_set_user_sq_size()
Message-Id: <20191007121821.GI21515@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190608092514.GC28890@mwanda>
In-Reply-To: <20190608092514.GC28890@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lijun Ou <oulijun@huawei.com>
Cc: "Wei Hu(Xavier)" <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

This one still needs to be applied.

regards,
dan carpenter

On Sat, Jun 08, 2019 at 12:25:14PM +0300, Dan Carpenter wrote:
> The "ucmd->log_sq_bb_count" variable is a user controlled variable in
> the 0-255 range.  If we shift more than then number of bits in an int
> then it's undefined behavior (it shift wraps).  It turns out this
> doesn't cause any real issues at runtime, but it's good to check anyway.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_qp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/hw/hns/hns_roce_qp.c b/drivers/infiniband/hw/hns/hns_roce_qp.c
> index 8db2817a249e..006b3e7f4ed5 100644
> --- a/drivers/infiniband/hw/hns/hns_roce_qp.c
> +++ b/drivers/infiniband/hw/hns/hns_roce_qp.c
> @@ -342,7 +342,8 @@ static int hns_roce_set_user_sq_size(struct hns_roce_dev *hr_dev,
>  	u32 max_cnt;
>  
>  	/* Sanity check SQ size before proceeding */
> -	if ((u32)(1 << ucmd->log_sq_bb_count) > hr_dev->caps.max_wqes ||
> +	if (ucmd->log_sq_bb_count > 31 ||
> +	    (u32)(1 << ucmd->log_sq_bb_count) > hr_dev->caps.max_wqes ||
>  	     ucmd->log_sq_stride > max_sq_stride ||
>  	     ucmd->log_sq_stride < HNS_ROCE_IB_MIN_SQ_STRIDE) {
>  		dev_err(hr_dev->dev, "check SQ size error!\n");
> -- 
> 2.20.1
