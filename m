From: "Bernard Metzler" <BMT@zurich.ibm.com>
Date: Thu, 18 Jul 2019 10:41:44 +0000
Subject: Re: [PATCH] RDMA/siw: fix error return code in siw_init_module()
Message-Id: <OF35A9F852.4EA5883B-ON0025843B.0035B005-0025843B.003AC0D0@notes.na.collabserv.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190718092710.85709-1-weiyongjun1@huawei.com>
In-Reply-To: <20190718092710.85709-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

-----"Wei Yongjun" <weiyongjun1@huawei.com> wrote: -----

>To: "Bernard Metzler" <bmt@zurich.ibm.com>, "Doug Ledford"
><dledford@redhat.com>, "Jason Gunthorpe" <jgg@ziepe.ca>
>From: "Wei Yongjun" <weiyongjun1@huawei.com>
>Date: 07/18/2019 11:21AM
>Cc: "Wei Yongjun" <weiyongjun1@huawei.com>,
><linux-rdma@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
>Subject: [EXTERNAL] [PATCH] RDMA/siw: fix error return code in
>siw_init_module()
>
>Fix to return a negative error code from the error handling
>case instead of 0, as done elsewhere in this function.
>
>Fixes: bdcf26bf9b3a ("rdma/siw: network and RDMA core interface")
>Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>---
> drivers/infiniband/sw/siw/siw_main.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/infiniband/sw/siw/siw_main.c
>b/drivers/infiniband/sw/siw/siw_main.c
>index fd2552a9091d..9040692f83d7 100644
>--- a/drivers/infiniband/sw/siw/siw_main.c
>+++ b/drivers/infiniband/sw/siw/siw_main.c
>@@ -614,6 +614,7 @@ static __init int siw_init_module(void)
> 
> 	if (!siw_create_tx_threads()) {
> 		pr_info("siw: Could not start any TX thread\n");
>+		rv = -ENOMEM;
> 		goto out_error;
> 	}
> 	/*
>
>
>
>
Yes, thanks Wei!

Bernard.
