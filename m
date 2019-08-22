From: Colin King <colin.king@canonical.com>
Date: Thu, 22 Aug 2019 21:56:51 +0000
Subject: [PATCH] scsi: qla2xxx: fix spelling mistake "initializatin" -> "initialization"
Message-Id: <20190822215651.5403-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: qla2xxx-upstream@qlogic.com, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a ql_log message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/qla2xxx/qla_nx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/qla2xxx/qla_nx.c b/drivers/scsi/qla2xxx/qla_nx.c
index 372355bfcbb6..65a675906188 100644
--- a/drivers/scsi/qla2xxx/qla_nx.c
+++ b/drivers/scsi/qla2xxx/qla_nx.c
@@ -1977,7 +1977,7 @@ qla82xx_check_rcvpeg_state(struct qla_hw_data *ha)
 	} while (--retries);
 
 	ql_log(ql_log_fatal, vha, 0x00ac,
-	    "Rcv Peg initializatin failed: 0x%x.\n", val);
+	    "Rcv Peg initialization failed: 0x%x.\n", val);
 	read_lock(&ha->hw_lock);
 	qla82xx_wr_32(ha, CRB_RCVPEG_STATE, PHAN_INITIALIZE_FAILED);
 	read_unlock(&ha->hw_lock);
-- 
2.20.1
