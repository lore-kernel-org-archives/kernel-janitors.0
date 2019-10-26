From: oulijun <oulijun@huawei.com>
Date: Sat, 26 Oct 2019 03:17:51 +0000
Subject: Re: [PATCH][next] RDMA/hns: fix memory leak on 'context' on error return path
Message-Id: <d3fefb17-e16f-bfe2-d244-d5a25309321f@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191024131034.19989-1-colin.king@canonical.com>
In-Reply-To: <20191024131034.19989-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>, Wei Hu <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Tao Tian <tiantao6@huawei.com>, Leon Romanovsky <leon@kernel.org>, Yangyang Li <liyangyang20@huawei.com>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

在 2019/10/24 21:10, Colin King 写道:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently, the error return path when the call to function
> dev->dfx->query_cqc_info fails will leak object 'context'. Fix this
> by making the error return path via 'err' return return codes rather
> than -EMSGSIZE, set ret appropriately for all error return paths and
> for the memory leak now return via 'err' with -EINVAL rather than
> just returning without freeing context.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: e1c9a0dc2939 ("RDMA/hns: Dump detailed driver-specific CQ")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_restrack.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/infiniband/hw/hns/hns_roce_restrack.c b/drivers/infiniband/hw/hns/hns_roce_restrack.c
> index a0d608ec81c1..7e4a91dd7329 100644
> --- a/drivers/infiniband/hw/hns/hns_roce_restrack.c
> +++ b/drivers/infiniband/hw/hns/hns_roce_restrack.c
> @@ -94,15 +94,21 @@ static int hns_roce_fill_res_cq_entry(struct sk_buff *msg,
>  		return -ENOMEM;
>  
>  	ret = hr_dev->dfx->query_cqc_info(hr_dev, hr_cq->cqn, (int *)context);
> -	if (ret)
> -		return -EINVAL;
> +	if (ret) {
> +		ret = -EINVAL;
> +		goto err;
Why not remove ret = -EINVAL?
> +	}
>  
>  	table_attr = nla_nest_start(msg, RDMA_NLDEV_ATTR_DRIVER);
> -	if (!table_attr)
> +	if (!table_attr) {
> +		ret = -EMSGSIZE;
>  		goto err;
> +	}
>  
> -	if (hns_roce_fill_cq(msg, context))
> +	if (hns_roce_fill_cq(msg, context)) {
> +		ret = -EMSGSIZE;
>  		goto err_cancel_table;
> +	}
>  
>  	nla_nest_end(msg, table_attr);
>  	kfree(context);
> @@ -113,7 +119,7 @@ static int hns_roce_fill_res_cq_entry(struct sk_buff *msg,
>  	nla_nest_cancel(msg, table_attr);
>  err:
>  	kfree(context);
> -	return -EMSGSIZE;
> +	return ret;
>  }
>  
>  int hns_roce_fill_res_entry(struct sk_buff *msg,
