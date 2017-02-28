From: Colin King <colin.king@canonical.com>
Date: Tue, 28 Feb 2017 12:05:48 +0000
Subject: [PATCH] staging: wilc1000: remove redundant result < 0 check
Message-Id: <20170228120548.20734-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aditya Shankar <aditya.shankar@microchip.com>, Ganesh Krishna <ganesh.krishna@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check for result < 0 is redundant because at that point result
is always zero, hence we can remove this check and the netdev_err
message.

Detected by CoverityScan, CID#1357147 ("Logically Dead Code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/wilc1000/host_interface.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/wilc1000/host_interface.c b/drivers/staging/wilc1000/host_interface.c
index e83fa21..f848bb8 100644
--- a/drivers/staging/wilc1000/host_interface.c
+++ b/drivers/staging/wilc1000/host_interface.c
@@ -3350,10 +3350,6 @@ int wilc_init(struct net_device *dev, struct host_if_drv **hif_drv_handler)
 	init_completion(&hif_drv->comp_inactive_time);
 
 	if (clients_count = 0)	{
-		if (result < 0) {
-			netdev_err(vif->ndev, "Failed to creat MQ\n");
-			goto _fail_;
-		}
 		hif_workqueue = create_singlethread_workqueue("WILC_wq");
 		if (!hif_workqueue) {
 			netdev_err(vif->ndev, "Failed to create workqueue\n");
-- 
2.10.2

