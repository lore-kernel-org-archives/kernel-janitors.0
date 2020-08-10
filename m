From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Aug 2020 08:07:45 +0000
Subject: [PATCH] scsi: snic: fix spelling mistakes of "Queueing"
Message-Id: <20200810080745.47314-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karan Tilak Kumar <kartilak@cisco.com>, Sesidhar Baddela <sebaddel@cisco.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two different spelling mistakes of "Queueing" in
error and debug messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/snic/snic_scsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/snic/snic_scsi.c b/drivers/scsi/snic/snic_scsi.c
index b3650c989ed4..a8a48b106062 100644
--- a/drivers/scsi/snic/snic_scsi.c
+++ b/drivers/scsi/snic/snic_scsi.c
@@ -1395,11 +1395,11 @@ snic_issue_tm_req(struct snic *snic,
 tmreq_err:
 	if (ret) {
 		SNIC_HOST_ERR(snic->shost,
-			      "issu_tmreq: Queing ITMF(%d) Req, sc %p rqi %p req_id %d tag %x fails err = %d\n",
+			      "issu_tmreq: Queueing ITMF(%d) Req, sc %p rqi %p req_id %d tag %x fails err = %d\n",
 			      tmf, sc, rqi, req_id, tag, ret);
 	} else {
 		SNIC_SCSI_DBG(snic->shost,
-			      "issu_tmreq: Queuing ITMF(%d) Req, sc %p, rqi %p, req_id %d tag %x - Success.\n",
+			      "issu_tmreq: Queueing ITMF(%d) Req, sc %p, rqi %p, req_id %d tag %x - Success.\n",
 			      tmf, sc, rqi, req_id, tag);
 	}
 
-- 
2.27.0
