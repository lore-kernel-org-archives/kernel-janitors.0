From: Doug Ledford <dledford@redhat.com>
Date: Fri, 04 Aug 2017 19:11:15 +0000
Subject: Re: [PATCH] IB/hns: checking for IS_ERR() instead of NULL
Message-Id: <1501873875.79618.11.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170804081208.qkkj3yons7ljccjp@mwanda>
In-Reply-To: <20170804081208.qkkj3yons7ljccjp@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Lijun Ou <oulijun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Shaobo Xu <xushaobo2-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: "Wei Hu(Xavier)" <xavier.huwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, 2017-08-04 at 11:12 +0300, Dan Carpenter wrote:
> The hns_roce_v1_create_lp_qp() returns NULL on error, not error
> pointers.
> 
> Fixes: bfcc681bd09d ("IB/hns: Fix the bug when free mr")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
> b/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
> index 38f5c77baabf..747efd1ae5a6 100644
> --- a/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
> +++ b/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
> @@ -733,7 +733,7 @@ static int hns_roce_v1_rsv_lp_qp(struct
> hns_roce_dev *hr_dev)
>  			continue;
>  
>  		free_mr->mr_free_qp[i] > hns_roce_v1_create_lp_qp(hr_dev, pd);
> -		if (IS_ERR(free_mr->mr_free_qp[i])) {
> +		if (!free_mr->mr_free_qp[i]) {
>  			dev_err(dev, "Create loop qp failed!\n");
>  			goto create_lp_qp_failed;
>  		}

Thanks, applied.

-- 
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint = AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD

