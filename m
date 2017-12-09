From: Colin King <colin.king@canonical.com>
Date: Sat, 09 Dec 2017 00:34:14 +0000
Subject: [PATCH][next] scsi: arcmsr: remove redundant check for secs < 0
Message-Id: <20171209003414.17332-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Ching Huang <ching2048@areca.com.tw>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check for secs being less than zero is redundant for two reasons.
Firstly, secs is unsigned so the check is always going to be false.
Secondly, if secs was signed the proceeding calculation of secs is
never going to be negative.  Hence we can remove this redundant check
and day and secs re-adjustment.

Detected by static analysis with smatch:
arcmsr_set_iop_datetime() warn: unsigned 'secs' is never less than zero.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/arcmsr/arcmsr_hba.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/scsi/arcmsr/arcmsr_hba.c b/drivers/scsi/arcmsr/arcmsr_hba.c
index 0707a60bf5c0..e4258b69f4be 100644
--- a/drivers/scsi/arcmsr/arcmsr_hba.c
+++ b/drivers/scsi/arcmsr/arcmsr_hba.c
@@ -3679,10 +3679,6 @@ static void arcmsr_set_iop_datetime(struct timer_list *t)
 	secs = (u32)(tv.tv_sec - (sys_tz.tz_minuteswest * 60));
 	days = secs / 86400;
 	secs = secs - 86400 * days;
-	if (secs < 0) {
-		days = days - 1;
-		secs = secs + 86400;
-	}
 	j = days / 146097;
 	i = days - 146097 * j;
 	a = i + 719468;
-- 
2.14.1

