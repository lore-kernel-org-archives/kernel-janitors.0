From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Aug 2020 09:08:43 +0000
Subject: [PATCH] scsi: csiostor: fix fix spelling mistake "couldnt" -> "couldn't"
Message-Id: <20200810090843.49553-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Nathan Chancellor <natechancellor@gmail.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in two comments and a csio_err error
message. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/csiostor/csio_scsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/csiostor/csio_scsi.c b/drivers/scsi/csiostor/csio_scsi.c
index 00cf33573136..55e74da2f3cb 100644
--- a/drivers/scsi/csiostor/csio_scsi.c
+++ b/drivers/scsi/csiostor/csio_scsi.c
@@ -933,14 +933,14 @@ csio_scsis_aborting(struct csio_ioreq *req, enum csio_scsi_ev evt)
 		 *    abort for that I/O by the FW crossed each other.
 		 *    The FW returned FW_EINVAL. The original I/O would have
 		 *    returned with FW_SUCCESS or any other SCSI error.
-		 * 3. The FW couldnt sent the abort out on the wire, as there
+		 * 3. The FW couldn't sent the abort out on the wire, as there
 		 *    was an I-T nexus loss (link down, remote device logged
 		 *    out etc). FW sent back an appropriate IT nexus loss status
 		 *    for the abort.
 		 * 4. FW sent an abort, but abort timed out (remote device
 		 *    didnt respond). FW replied back with
 		 *    FW_SCSI_ABORT_TIMEDOUT.
-		 * 5. FW couldnt genuinely abort the request for some reason,
+		 * 5. FW couldn't genuinely abort the request for some reason,
 		 *    and sent us an error.
 		 *
 		 * The first 3 scenarios are treated as  succesful abort
@@ -1859,7 +1859,7 @@ csio_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *cmnd)
 	spin_unlock_irqrestore(&hw->lock, flags);
 
 	if (retval != 0) {
-		csio_err(hw, "ioreq: %p couldnt be started, status:%d\n",
+		csio_err(hw, "ioreq: %p couldn't be started, status:%d\n",
 			 ioreq, retval);
 		CSIO_INC_STATS(scsim, n_busy_error);
 		goto err_put_req;
-- 
2.27.0
