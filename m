From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Mon, 09 Apr 2012 06:23:19 +0000
Subject: [PATCH 2/2] qlcnic: Remove redundant NULL check on kfree().
Message-Id: <1333951879-3230-1-git-send-email-santoshprasadnayak@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: anirban.chakraborty@qlogic.com, rajesh.borundia@qlogic.com
Cc: sony.chacko@qlogic.com, linux-driver@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Santosh Nayak <santoshprasadnayak@gmail.com>

From: Santosh Nayak <santoshprasadnayak@gmail.com>

kfree() checks for NULL before freeing the memory.
Remove redundant NULL check.
This is just a clean up and also looks good from performance point of view.

Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
---
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c |   14 ++++----------
 1 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
index d30b9b8..75b202d 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
@@ -160,9 +160,7 @@ qlcnic_alloc_sds_rings(struct qlcnic_recv_context *recv_ctx, int count)
 static void
 qlcnic_free_sds_rings(struct qlcnic_recv_context *recv_ctx)
 {
-	if (recv_ctx->sds_rings != NULL)
-		kfree(recv_ctx->sds_rings);
-
+	kfree(recv_ctx->sds_rings);
 	recv_ctx->sds_rings = NULL;
 }
 
@@ -1714,10 +1712,8 @@ static void __devexit qlcnic_remove(struct pci_dev *pdev)
 
 	qlcnic_detach(adapter);
 
-	if (adapter->npars != NULL)
-		kfree(adapter->npars);
-	if (adapter->eswitch != NULL)
-		kfree(adapter->eswitch);
+	kfree(adapter->npars);
+	kfree(adapter->eswitch);
 
 	qlcnic_clr_all_drv_state(adapter, 0);
 
@@ -1887,9 +1883,7 @@ void qlcnic_alloc_lb_filters_mem(struct qlcnic_adapter *adapter)
 
 static void qlcnic_free_lb_filters_mem(struct qlcnic_adapter *adapter)
 {
-	if (adapter->fhash.fmax && adapter->fhash.fhead)
-		kfree(adapter->fhash.fhead);
-
+	kfree(adapter->fhash.fhead);
 	adapter->fhash.fhead = NULL;
 	adapter->fhash.fmax = 0;
 }
-- 
1.7.4.4

