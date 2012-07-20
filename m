From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Jul 2012 07:07:34 +0000
Subject: [patch] target: NULL dereference on error path
Message-Id: <20120720070733.GD11710@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

We called destroy_workqueue(dev->tmr_wq) before ->tmr_wq was allocated
which leads to an oops.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
index 7647eca..0eaae23 100644
--- a/drivers/target/target_core_transport.c
+++ b/drivers/target/target_core_transport.c
@@ -1098,7 +1098,7 @@ struct se_device *transport_add_device_to_core_hba(
 	 * Setup the Asymmetric Logical Unit Assignment for struct se_device
 	 */
 	if (core_setup_alua(dev, force_pt) < 0)
-		goto out;
+		goto err_dev_list;
 
 	/*
 	 * Startup the struct se_device processing thread
@@ -1108,7 +1108,7 @@ struct se_device *transport_add_device_to_core_hba(
 	if (!dev->tmr_wq) {
 		pr_err("Unable to create tmr workqueue for %s\n",
 			dev->transport->name);
-		goto out;
+		goto err_dev_list;
 	}
 	/*
 	 * Setup work_queue for QUEUE_FULL
@@ -1126,7 +1126,7 @@ struct se_device *transport_add_device_to_core_hba(
 		if (!inquiry_prod || !inquiry_rev) {
 			pr_err("All non TCM/pSCSI plugins require"
 				" INQUIRY consts\n");
-			goto out;
+			goto err_wq;
 		}
 
 		strncpy(&dev->se_sub_dev->t10_wwn.vendor[0], "LIO-ORG", 8);
@@ -1136,9 +1136,10 @@ struct se_device *transport_add_device_to_core_hba(
 	scsi_dump_inquiry(dev);
 
 	return dev;
-out:
-	destroy_workqueue(dev->tmr_wq);
 
+err_wq:
+	destroy_workqueue(dev->tmr_wq);
+err_dev_list:
 	spin_lock(&hba->device_lock);
 	list_del(&dev->dev_list);
 	hba->dev_count--;
