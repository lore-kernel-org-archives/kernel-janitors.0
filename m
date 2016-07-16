From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 16 Jul 2016 10:07:55 +0000
Subject: [patch] staging: wilc1000: NULL dereference on error
Message-Id: <20160716100755.GA3346@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We can't pass NULL pointers to destroy_workqueue().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/wilc1000/host_interface.c b/drivers/staging/wilc1000/host_interface.c
index 0b1760c..78f524f 100644
--- a/drivers/staging/wilc1000/host_interface.c
+++ b/drivers/staging/wilc1000/host_interface.c
@@ -3363,7 +3363,7 @@ int wilc_init(struct net_device *dev, struct host_if_drv **hif_drv_handler)
 		if (!hif_workqueue) {
 			netdev_err(vif->ndev, "Failed to create workqueue\n");
 			result = -ENOMEM;
-			goto _fail_mq_;
+			goto _fail_;
 		}
 
 		setup_timer(&periodic_rssi, GetPeriodicRSSI,
@@ -3391,7 +3391,6 @@ int wilc_init(struct net_device *dev, struct host_if_drv **hif_drv_handler)
 
 	clients_count++;
 
-_fail_mq_:
 	destroy_workqueue(hif_workqueue);
 _fail_:
 	return result;
