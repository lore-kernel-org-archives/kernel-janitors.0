From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 18 Jul 2019 09:27:10 +0000
Subject: [PATCH] RDMA/siw: fix error return code in siw_init_module()
Message-Id: <20190718092710.85709-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Metzler <bmt@zurich.ibm.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: bdcf26bf9b3a ("rdma/siw: network and RDMA core interface")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/infiniband/sw/siw/siw_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/infiniband/sw/siw/siw_main.c b/drivers/infiniband/sw/siw/siw_main.c
index fd2552a9091d..9040692f83d7 100644
--- a/drivers/infiniband/sw/siw/siw_main.c
+++ b/drivers/infiniband/sw/siw/siw_main.c
@@ -614,6 +614,7 @@ static __init int siw_init_module(void)
 
 	if (!siw_create_tx_threads()) {
 		pr_info("siw: Could not start any TX thread\n");
+		rv = -ENOMEM;
 		goto out_error;
 	}
 	/*
