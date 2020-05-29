From: oulijun <oulijun@huawei.com>
Date: Fri, 29 May 2020 07:26:30 +0000
Subject: Re: [PATCH][next] RDMA/hns: remove duplicate assignment to pointer raq
Message-Id: <7a803901-5405-4837-3fa8-d81e8bdfc067@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200528150427.420624-1-colin.king@canonical.com>
In-Reply-To: <20200528150427.420624-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>, Wei Hu <huwei87@hisilicon.com>, Weihang Li <liweihang@huawei.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



在 2020/5/28 23:04, Colin King 写道:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer raq is being assigned twice. Fix this by removing
> one of the redundant assignments.
> 
> Fixes: 14ba87304bf9 ("RDMA/hns: Remove redundant type cast for general pointers")
> Addressses-Coverity: ("Evaluation order violation")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/infiniband/hw/hns/hns_roce_hw_v1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/hw/hns/hns_roce_hw_v1.c b/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
> index 8ff6b922b4d7..d02207cd30df 100644
> --- a/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
> +++ b/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
> @@ -1146,7 +1146,7 @@ static void hns_roce_db_free(struct hns_roce_dev *hr_dev)
>   static int hns_roce_raq_init(struct hns_roce_dev *hr_dev)
>   {
>   	struct hns_roce_v1_priv *priv = hr_dev->priv;
> -	struct hns_roce_raq_table *raq = raq = &priv->raq_table;
> +	struct hns_roce_raq_table *raq = &priv->raq_table;
>   	struct device *dev = &hr_dev->pdev->dev;
>   	int raq_shift = 0;
>   	dma_addr_t addr;
> 
thanks
