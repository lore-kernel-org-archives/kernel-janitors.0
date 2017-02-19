From: "Amrani, Ram" <Ram.Amrani@cavium.com>
Date: Sun, 19 Feb 2017 11:46:34 +0000
Subject: RE: [PATCH] RDMA/qedr: Fix some error handling
Message-Id: <SN1PR07MB220717357BB9DABB438CFD94F85F0@SN1PR07MB2207.namprd07.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170218112815.9329-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170218112815.9329-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "dledford@redhat.com" <dledford@redhat.com>, "sean.hefty@intel.com" <sean.hefty@intel.com>, "hal.rosenstock@gmail.com" <hal.rosenstock@gmail.com>, "Kalderon, Michal" <Michal.Kalderon@cavium.com>, "Borundia, Rajesh" <Rajesh.Borundia@cavium.com>, "weiyongjun1@huawei.com" <weiyongjun1@huawei.com>
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> 'qedr_alloc_pbl_tbl()' can not return NULL.
> 
> In qedr_init_user_queue():
>  - simplify the test for the return value, no need to test for NULL
>  - propagate the error pointer if needed, otherwise 0 (success) is returned.
>    This is spurious.
> 
> In init_mr_info():
>  - test the return value with IS_ERR
>  - propagate the error pointer if needed instead of an exlictit -ENOMEM.
>    This is a no-op as the only error pointer that we can have here is
>    already -ENOMEM
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/infiniband/hw/qedr/verbs.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/infiniband/hw/qedr/verbs.c b/drivers/infiniband/hw/qedr/verbs.c
> index ef83a3f322d6..0c51657af151 100644
> --- a/drivers/infiniband/hw/qedr/verbs.c
> +++ b/drivers/infiniband/hw/qedr/verbs.c
> @@ -771,8 +771,10 @@ static inline int qedr_init_user_queue(struct ib_ucontext *ib_ctx,
>  		goto err0;
> 
>  	q->pbl_tbl = qedr_alloc_pbl_tbl(dev, &q->pbl_info, GFP_KERNEL);
> -	if (IS_ERR_OR_NULL(q->pbl_tbl))
> +	if (IS_ERR(q->pbl_tbl)) {
> +		rc = PTR_ERR(q->pbl_tbl);
>  		goto err0;
> +	}
> 
>  	qedr_populate_pbls(dev, q->umem, q->pbl_tbl, &q->pbl_info);
> 
> @@ -2105,8 +2107,8 @@ static int init_mr_info(struct qedr_dev *dev, struct mr_info *info,
>  		goto done;
> 
>  	info->pbl_table = qedr_alloc_pbl_tbl(dev, &info->pbl_info, GFP_KERNEL);
> -	if (!info->pbl_table) {
> -		rc = -ENOMEM;
> +	if (IS_ERR(info->pbl_table)) {
> +		rc = PTR_ERR(info->pbl_table);
>  		goto done;
>  	}
> 
> @@ -2117,7 +2119,7 @@ static int init_mr_info(struct qedr_dev *dev, struct mr_info *info,
>  	 * list and allocating another one
>  	 */
>  	tmp = qedr_alloc_pbl_tbl(dev, &info->pbl_info, GFP_KERNEL);
> -	if (!tmp) {
> +	if (IS_ERR(tmp)) {
>  		DP_DEBUG(dev, QEDR_MSG_MR, "Extra PBL is not allocated\n");
>  		goto done;
>  	}
> --
> 2.9.3


Acked-by: Ram Amrani <Ram.Amrani@cavium.com>

Merci

