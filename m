From: "Milan P. Gandhi" <mgandhi@redhat.com>
Date: Fri, 02 Jun 2017 12:51:05 +0000
Subject: [PATCH RESEND] Eliminate extra 'out_free' label from fcoe_init function
Message-Id: <8e1e75c4-3a80-00c3-2697-37fb1c86f7a1@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Thumshirn <jth@kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Dan Carpenter <dan.carpenter@oracle.com>, Laurence Oberman <loberman@redhat.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

Simplify the check for return code of fcoe_if_init routine
in fcoe_init function such that we could eliminate need for
extra 'out_free' label and duplicate mutex_unlock statement.

Signed-off-by: Milan P. Gandhi <mgandhi@redhat.com>
---
 drivers/scsi/fcoe/fcoe.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/fcoe/fcoe.c b/drivers/scsi/fcoe/fcoe.c
index ea21e7b..a2cf3d0 100644
--- a/drivers/scsi/fcoe/fcoe.c
+++ b/drivers/scsi/fcoe/fcoe.c
@@ -2523,14 +2523,13 @@ static int __init fcoe_init(void)
 	fcoe_dev_setup();
 
 	rc = fcoe_if_init();
+	mutex_unlock(&fcoe_config_mutex);
+
 	if (rc)
-		goto out_free;
+		goto out_destroy;
 
-	mutex_unlock(&fcoe_config_mutex);
 	return 0;
 
-out_free:
-	mutex_unlock(&fcoe_config_mutex);
 out_destroy:
 	destroy_workqueue(fcoe_wq);
 	return rc;
