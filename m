From: Colin King <colin.king@canonical.com>
Date: Wed, 28 Mar 2018 10:01:37 +0000
Subject: [PATCH] scsi: fnic: fix spelling mistake: "abord" -> "abort"
Message-Id: <20180328100137.13009-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Satish Kharat <satishkh@cisco.com>, Sesidhar Baddela <sebaddel@cisco.com>, Karan Tilak Kumar <kartilak@cisco.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/fnic/fnic_trace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/fnic/fnic_trace.c b/drivers/scsi/fnic/fnic_trace.c
index abddde11982b..98597b59c12a 100644
--- a/drivers/scsi/fnic/fnic_trace.c
+++ b/drivers/scsi/fnic/fnic_trace.c
@@ -296,7 +296,7 @@ int fnic_get_stats_data(struct stats_debug_info *debug,
 		  "Number of Abort FW Timeouts: %lld\n"
 		  "Number of Abort IO NOT Found: %lld\n"
 
-		  "Abord issued times: \n"
+		  "Abort issued times: \n"
 		  "            < 6 sec : %lld\n"
 		  "     6 sec - 20 sec : %lld\n"
 		  "    20 sec - 30 sec : %lld\n"
-- 
2.15.1

