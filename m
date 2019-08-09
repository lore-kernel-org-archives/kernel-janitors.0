From: "Bernard Metzler" <BMT@zurich.ibm.com>
Date: Fri, 09 Aug 2019 14:28:50 +0000
Subject: Re: [PATCH v2] RDMA/siw: Fix a memory leak in siw_init_cpulist()
Message-Id: <OFD09B6B8D.A208B8E7-ON00258451.004F8BA4-00258451.004F8BAA@notes.na.collabserv.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190809140904.GB3552@mwanda>
In-Reply-To: <20190809140904.GB3552@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

-----"Dan Carpenter" <dan.carpenter@oracle.com> wrote: -----

>To: "Bernard Metzler" <bmt@zurich.ibm.com>
>From: "Dan Carpenter" <dan.carpenter@oracle.com>
>Date: 08/09/2019 04:09PM
>Cc: "Doug Ledford" <dledford@redhat.com>, "Jason Gunthorpe"
><jgg@ziepe.ca>, linux-rdma@vger.kernel.org,
>kernel-janitors@vger.kernel.org
>Subject: [EXTERNAL] [PATCH v2] RDMA/siw: Fix a memory leak in
>siw_init_cpulist()
>
>The error handling code doesn't free siw_cpu_info.tx_valid_cpus[0].
>The
>first iteration through the loop is a no-op so this is sort of an off
>by one bug.  Also Bernard pointed out that we can remove the NULL
>assignment and simplify the code a bit.
>
>Fixes: bdcf26bf9b3a ("rdma/siw: network and RDMA core interface")
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>Reviewed-by: Bernard Metzler <bmt@zurich.ibm.com>
>---
>v2:  Remove the NULL assignment like Bernard Metzler pointed out.
>
> drivers/infiniband/sw/siw/siw_main.c | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>
>diff --git a/drivers/infiniband/sw/siw/siw_main.c
>b/drivers/infiniband/sw/siw/siw_main.c
>index d0f140daf659..05a92f997f60 100644
>--- a/drivers/infiniband/sw/siw/siw_main.c
>+++ b/drivers/infiniband/sw/siw/siw_main.c
>@@ -160,10 +160,8 @@ static int siw_init_cpulist(void)
> 
> out_err:
> 	siw_cpu_info.num_nodes = 0;
>-	while (i) {
>+	while (--i >= 0)
> 		kfree(siw_cpu_info.tx_valid_cpus[i]);
>-		siw_cpu_info.tx_valid_cpus[i--] = NULL;
>-	}
> 	kfree(siw_cpu_info.tx_valid_cpus);
> 	siw_cpu_info.tx_valid_cpus = NULL;
> 
>-- 
>2.20.1
>
>

Dan, many thanks for finding and fixing this!


Reviewed-by: Bernard Metzler <bmt@zurich.ibm.com>
