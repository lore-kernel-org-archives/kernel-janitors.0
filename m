From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 28 May 2016 05:01:20 +0000
Subject: [patch] IB/hfi1: fix some indenting
Message-Id: <20160528050120.GB4107@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marciniszyn <mike.marciniszyn@intel.com>
Cc: Dennis Dalessandro <dennis.dalessandro@intel.com>, Doug Ledford <dledford@redhat.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

That extra tabs are misleading.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/hfi1/init.c b/drivers/infiniband/hw/hfi1/init.c
index 5cc492e..0d28a5a 100644
--- a/drivers/infiniband/hw/hfi1/init.c
+++ b/drivers/infiniband/hw/hfi1/init.c
@@ -1337,7 +1337,7 @@ static void cleanup_device_data(struct hfi1_devdata *dd)
 		dma_free_coherent(&dd->pcidev->dev, sizeof(u64),
 				  (void *)dd->rcvhdrtail_dummy_kvaddr,
 				  dd->rcvhdrtail_dummy_physaddr);
-				  dd->rcvhdrtail_dummy_kvaddr = NULL;
+		dd->rcvhdrtail_dummy_kvaddr = NULL;
 	}
 
 	for (ctxt = 0; tmp && ctxt < dd->num_rcv_contexts; ctxt++) {
