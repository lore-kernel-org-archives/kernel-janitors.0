From: "Milan P. Gandhi" <mgandhi@redhat.com>
Date: Thu, 01 Jun 2017 12:23:06 +0000
Subject: [PATCH] Eliminate extra 'out_free' label from fcoe_init function
Message-Id: <a1ea0104-83ed-2249-3450-dc5c31517558@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>, Laurence Oberman <loberman@redhat.com>

Simplify the check for return code of fcoe_if_init routine
in fcoe_init function such that we could eliminate need for
extra 'out_free' label.

Signed-off-by: Milan P. Gandhi <mgandhi@redhat.com>
---
 drivers/scsi/fcoe/fcoe.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/fcoe/fcoe.c b/drivers/scsi/fcoe/fcoe.c
index ea21e7b..fb2a4c9 100644
--- a/drivers/scsi/fcoe/fcoe.c
+++ b/drivers/scsi/fcoe/fcoe.c
@@ -2523,13 +2523,11 @@ static int __init fcoe_init(void)
 	fcoe_dev_setup();
 
 	rc = fcoe_if_init();
-	if (rc)
-		goto out_free;
-
-	mutex_unlock(&fcoe_config_mutex);
-	return 0;
+	if (rc = 0) {
+		mutex_unlock(&fcoe_config_mutex);
+		return 0;
+	}
 
-out_free:
 	mutex_unlock(&fcoe_config_mutex);
 out_destroy:
 	destroy_workqueue(fcoe_wq);
