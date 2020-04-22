From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Apr 2020 09:22:11 +0000
Subject: [PATCH] i40iw: Fix error handling in i40iw_manage_arp_cache()
Message-Id: <20200422092211.GA195357@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Faisal Latif <faisal.latif@intel.com>
Cc: Shiraz Saleem <shiraz.saleem@intel.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Shannon Nelson <shannon.nelson@intel.com>, Anjali Singhai Jain <anjali.singhai@intel.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The i40iw_arp_table() function can return -EOVERFLOW if
i40iw_alloc_resource() fails so we can't just test for "= -1".

Fixes: 4e9042e647ff ("i40iw: add hw and utils files")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/hw/i40iw/i40iw_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/i40iw/i40iw_hw.c b/drivers/infiniband/hw/i40iw/i40iw_hw.c
index 55a1fbf0e670..ae8b97c30665 100644
--- a/drivers/infiniband/hw/i40iw/i40iw_hw.c
+++ b/drivers/infiniband/hw/i40iw/i40iw_hw.c
@@ -534,7 +534,7 @@ void i40iw_manage_arp_cache(struct i40iw_device *iwdev,
 	int arp_index;
 
 	arp_index = i40iw_arp_table(iwdev, ip_addr, ipv4, mac_addr, action);
-	if (arp_index = -1)
+	if (arp_index < 0)
 		return;
 	cqp_request = i40iw_get_cqp_request(&iwdev->cqp, false);
 	if (!cqp_request)
-- 
2.25.1
