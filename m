From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 May 2020 10:03:02 +0000
Subject: [PATCH] IB/hfi1: Fix an error code in hfi1_vnic_init()
Message-Id: <20200529100302.GC1304852@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marciniszyn <mike.marciniszyn@intel.com>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>
Cc: Dennis Dalessandro <dennis.dalessandro@intel.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ira Weiny <ira.weiny@intel.com>, "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>, Andrzej Kacprowski <andrzej.kacprowski@intel.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

We should preserve the error code from hfi1_netdev_rx_init() but
currently the function returns success instead.

Fixes: 2280740f01ae ("IB/hfi1: Virtual Network Interface Controller (VNIC) HW support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/hw/hfi1/vnic_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hfi1/vnic_main.c b/drivers/infiniband/hw/hfi1/vnic_main.c
index b183c56b7b6a4..f89d0cb1c7204 100644
--- a/drivers/infiniband/hw/hfi1/vnic_main.c
+++ b/drivers/infiniband/hw/hfi1/vnic_main.c
@@ -512,7 +512,8 @@ static int hfi1_vnic_init(struct hfi1_vnic_vport_info *vinfo)
 			goto txreq_fail;
 	}
 
-	if (hfi1_netdev_rx_init(dd)) {
+	rc = hfi1_netdev_rx_init(dd);
+	if (rc) {
 		dd_dev_err(dd, "Unable to initialize netdev contexts\n");
 		goto alloc_fail;
 	}
-- 
2.26.2
