From: "Bernard Metzler" <BMT@zurich.ibm.com>
Date: Fri, 09 Aug 2019 11:44:45 +0000
Subject: Re: [PATCH] RDMA/siw: Fix a memory leak in siw_init_cpulist()
Message-Id: <OF1431A46D.4DAAB987-ON00258451.003E917F-00258451.0040859B@notes.na.collabserv.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190809101619.GB17867@mwanda>
In-Reply-To: <20190809101619.GB17867@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

-----"Dan Carpenter" <dan.carpenter@oracle.com> wrote: -----

>To: "Bernard Metzler" <bmt@zurich.ibm.com>
>From: "Dan Carpenter" <dan.carpenter@oracle.com>
>Date: 08/09/2019 12:16PM
>Cc: "Doug Ledford" <dledford@redhat.com>, "Jason Gunthorpe"
><jgg@ziepe.ca>, linux-rdma@vger.kernel.org,
>kernel-janitors@vger.kernel.org
>Subject: [EXTERNAL] [PATCH] RDMA/siw: Fix a memory leak in
>siw_init_cpulist()
>
>The error handling code doesn't free siw_cpu_info.tx_valid_cpus[0].
>The
>first iteration through the loop is a no-op so this is sort of an off
>by
>one bug.
>
>Fixes: bdcf26bf9b3a ("rdma/siw: network and RDMA core interface")
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>---
> drivers/infiniband/sw/siw/siw_main.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/infiniband/sw/siw/siw_main.c
>b/drivers/infiniband/sw/siw/siw_main.c
>index d0f140daf659..95ace3967391 100644
>--- a/drivers/infiniband/sw/siw/siw_main.c
>+++ b/drivers/infiniband/sw/siw/siw_main.c
>@@ -160,9 +160,9 @@ static int siw_init_cpulist(void)
> 
> out_err:
> 	siw_cpu_info.num_nodes = 0;
>-	while (i) {
>+	while (--i >= 0) {
> 		kfree(siw_cpu_info.tx_valid_cpus[i]);
>-		siw_cpu_info.tx_valid_cpus[i--] = NULL;
>+		siw_cpu_info.tx_valid_cpus[i] = NULL;
> 	}
> 	kfree(siw_cpu_info.tx_valid_cpus);
> 	siw_cpu_info.tx_valid_cpus = NULL;
>-- 
>2.20.1
>
>
Dan, many thanks for catching this one!

I suggest you provide an even simpler fix, taking the 
chance to remove the redundant
"siw_cpu_info.tx_valid_cpus[i] = NULL;" line (since
the whole structure gets kfree'd a line further
down...).
This shall be suffcient:

-	while (i) {
+	while (--i >= 0)
 		kfree(siw_cpu_info.tx_valid_cpus[i]);
-		siw_cpu_info.tx_valid_cpus[i--] = NULL;
-	}
+


Reviewed-by: Bernard Metzler <bmt@zurich.ibm.com>
