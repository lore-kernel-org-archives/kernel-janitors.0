From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 02 Jun 2020 06:16:35 +0000
Subject: [PATCH -next] IB/hfi1: Use free_netdev() in hfi1_netdev_free()
Message-Id: <20200602061635.31224-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200601135644.GD4872@ziepe.ca>
In-Reply-To: <20200601135644.GD4872@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mike.marciniszyn@intel.com, dennis.dalessandro@intel.com, dledford@redhat.com, jgg@ziepe.ca, sadanand.warrier@intel.com, grzegorz.andrejczuk@intel.com, yuehaibing@huawei.com
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, dan.carpenter@oracle.com, kernel-janitors@vger.kernel.org

dummy_netdev shold be freed by free_netdev() instead of
kfree(). Also remove unneeded variable 'priv'

Fixes: 4730f4a6c6b2 ("IB/hfi1: Activate the dummy netdev")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/infiniband/hw/hfi1/netdev_rx.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/infiniband/hw/hfi1/netdev_rx.c b/drivers/infiniband/hw/hfi1/netdev_rx.c
index 58af6a454761..63688e85e8da 100644
--- a/drivers/infiniband/hw/hfi1/netdev_rx.c
+++ b/drivers/infiniband/hw/hfi1/netdev_rx.c
@@ -371,12 +371,9 @@ int hfi1_netdev_alloc(struct hfi1_devdata *dd)
 
 void hfi1_netdev_free(struct hfi1_devdata *dd)
 {
-	struct hfi1_netdev_priv *priv;
-
 	if (dd->dummy_netdev) {
-		priv = hfi1_netdev_priv(dd->dummy_netdev);
 		dd_dev_info(dd, "hfi1 netdev freed\n");
-		kfree(dd->dummy_netdev);
+		free_netdev(dd->dummy_netdev);
 		dd->dummy_netdev = NULL;
 	}
 }
-- 
2.17.1
