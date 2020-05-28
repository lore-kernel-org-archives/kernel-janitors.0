From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 28 May 2020 07:59:46 +0000
Subject: [PATCH -next] IB/hfi1: Remove set but not used variable 'priv'
Message-Id: <20200528075946.123480-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marciniszyn <mike.marciniszyn@intel.com>, Dennis Dalessandro <dennis.dalessandro@intel.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

drivers/infiniband/hw/hfi1/netdev_rx.c: In function 'hfi1_netdev_free':
drivers/infiniband/hw/hfi1/netdev_rx.c:374:27: warning:
 variable 'priv' set but not used [-Wunused-but-set-variable]

It is never used, so can be removed, then null check before
kfree is unneeded.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/infiniband/hw/hfi1/netdev_rx.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/infiniband/hw/hfi1/netdev_rx.c b/drivers/infiniband/hw/hfi1/netdev_rx.c
index 58af6a454761..bd6546b52159 100644
--- a/drivers/infiniband/hw/hfi1/netdev_rx.c
+++ b/drivers/infiniband/hw/hfi1/netdev_rx.c
@@ -371,14 +371,9 @@ int hfi1_netdev_alloc(struct hfi1_devdata *dd)
 
 void hfi1_netdev_free(struct hfi1_devdata *dd)
 {
-	struct hfi1_netdev_priv *priv;
-
-	if (dd->dummy_netdev) {
-		priv = hfi1_netdev_priv(dd->dummy_netdev);
-		dd_dev_info(dd, "hfi1 netdev freed\n");
-		kfree(dd->dummy_netdev);
-		dd->dummy_netdev = NULL;
-	}
+	dd_dev_info(dd, "hfi1 netdev freed\n");
+	kfree(dd->dummy_netdev);
+	dd->dummy_netdev = NULL;
 }
 
 /**
