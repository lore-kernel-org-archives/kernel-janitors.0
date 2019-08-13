From: Colin King <colin.king@canonical.com>
Date: Tue, 13 Aug 2019 13:23:49 +0000
Subject: [PATCH] scsi: fnic: remove redundant assignment of variable rc
Message-Id: <20190813132349.8720-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Satish Kharat <satishkh@cisco.com>, Sesidhar Baddela <sebaddel@cisco.com>, Karan Tilak Kumar <kartilak@cisco.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable ret is initialized to a value that is never read and it is
re-assigned later and immediatetly returns. Clean up the code by
removing rc and just returning 0.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/fnic/fnic_debugfs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/scsi/fnic/fnic_debugfs.c b/drivers/scsi/fnic/fnic_debugfs.c
index 21991c99db7c..13f7d88d6e57 100644
--- a/drivers/scsi/fnic/fnic_debugfs.c
+++ b/drivers/scsi/fnic/fnic_debugfs.c
@@ -52,7 +52,6 @@ static struct fc_trace_flag_type *fc_trc_flag;
  */
 int fnic_debugfs_init(void)
 {
-	int rc = -1;
 	fnic_trace_debugfs_root = debugfs_create_dir("fnic", NULL);
 
 	fnic_stats_debugfs_root = debugfs_create_dir("statistics",
@@ -70,8 +69,7 @@ int fnic_debugfs_init(void)
 		fc_trc_flag->fc_clear = 4;
 	}
 
-	rc = 0;
-	return rc;
+	return 0;
 }
 
 /*
-- 
2.20.1
