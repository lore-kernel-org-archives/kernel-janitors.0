From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 30 May 2020 14:02:24 +0000
Subject: [PATCH v2] IB/hfi1: Fix hfi1_netdev_rx_init() error handling
Message-Id: <20200530140224.GA1330098@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <BY5PR11MB3958CF61BB1F59A6F6B5234D868F0@BY5PR11MB3958.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marciniszyn <mike.marciniszyn@intel.com>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>
Cc: Dennis Dalessandro <dennis.dalessandro@intel.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The hfi1_vnic_up() function doesn't check whether hfi1_netdev_rx_init()
returns errors.  In hfi1_vnic_init() we need to change the code to
preserve the error code instead of returning success.

Fixes: 2280740f01ae ("IB/hfi1: Virtual Network Interface Controller (VNIC) HW support")
Fixes: 4730f4a6c6b2 ("IB/hfi1: Activate the dummy netdev")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Add error handling in hfi1_vnic_up() and add second fixes tag

 drivers/infiniband/hw/hfi1/vnic_main.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/hfi1/vnic_main.c b/drivers/infiniband/hw/hfi1/vnic_main.c
index b183c56b7b6a4..03f8be8e9488e 100644
--- a/drivers/infiniband/hw/hfi1/vnic_main.c
+++ b/drivers/infiniband/hw/hfi1/vnic_main.c
@@ -457,13 +457,19 @@ static int hfi1_vnic_up(struct hfi1_vnic_vport_info *vinfo)
 	if (rc < 0)
 		return rc;
 
-	hfi1_netdev_rx_init(dd);
+	rc = hfi1_netdev_rx_init(dd);
+	if (rc < 0)
+		goto err_remove;
 
 	netif_carrier_on(netdev);
 	netif_tx_start_all_queues(netdev);
 	set_bit(HFI1_VNIC_UP, &vinfo->flags);
 
 	return 0;
+
+err_remove:
+	hfi1_netdev_remove_data(dd, VNIC_ID(vinfo->vesw_id));
+	return rc;
 }
 
 static void hfi1_vnic_down(struct hfi1_vnic_vport_info *vinfo)
@@ -512,7 +518,8 @@ static int hfi1_vnic_init(struct hfi1_vnic_vport_info *vinfo)
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
