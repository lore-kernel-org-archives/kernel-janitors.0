From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 27 Jul 2020 14:39:13 +0000
Subject: Re: [PATCH] qed: fix assignment of n_rq_elems to incorrect params field
Message-Id: <e41e4534-a621-53a0-f0e8-08ff8a3ade65@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727141712.112906-1-colin.king@canonical.com>
 <20200727143604.3835-1-alobakin@marvell.com>
In-Reply-To: <20200727143604.3835-1-alobakin@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Lobakin <alobakin@marvell.com>
Cc: Michal Kalderon <mkalderon@marvell.com>, Ariel Elior <aelior@marvell.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Igor Russkikh <irusskikh@marvell.com>, "David S. Miller" <davem@davemloft.net>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 27/07/2020 15:36, Alexander Lobakin wrote:
> Hi Colin,
> 
> From: Colin King <colin.king@canonical.com>
> Date: Mon, 27 Jul 2020 15:17:12 +0100
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently n_rq_elems is being assigned to params.elem_size instead of the
>> field params.num_elems.  Coverity is detecting this as a double assingment
>> to params.elem_size and reporting this as an usused value on the first
>> assignment.  Fix this.
>>
>> Addresses-Coverity: ("Unused value")
>> Fixes: b6db3f71c976 ("qed: simplify chain allocation with init params struct")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/infiniband/hw/qedr/verbs.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/infiniband/hw/qedr/verbs.c b/drivers/infiniband/hw/qedr/verbs.c
>> index 5a80471577a6..4ce4e2eef6cc 100644
>> --- a/drivers/infiniband/hw/qedr/verbs.c
>> +++ b/drivers/infiniband/hw/qedr/verbs.c
>> @@ -1930,7 +1930,7 @@ qedr_roce_create_kernel_qp(struct qedr_dev *dev,
>>  	in_params->sq_pbl_ptr = qed_chain_get_pbl_phys(&qp->sq.pbl);
>>  
>>  	params.intended_use = QED_CHAIN_USE_TO_CONSUME_PRODUCE;
>> -	params.elem_size = n_rq_elems;
>> +	params.num_elems = n_rq_elems;
> 
> Sorry for copy'n'paste braino. Thanks for catching.

Kudos goes to Coverity, it's good at finding these buglets. :-)

> 
>>  	params.elem_size = QEDR_RQE_ELEMENT_SIZE;
>>  
>>  	rc = dev->ops->common->chain_alloc(dev->cdev, &qp->rq.pbl, &params);
>> -- 
>> 2.27.0
> 
> Acked-by: Alexander Lobakin <alobakin@marvell.com>
> 
> Al
> 
