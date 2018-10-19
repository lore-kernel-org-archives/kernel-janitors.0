From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Oct 2018 09:16:28 +0000
Subject: [PATCH 1/3] scsi: myrs: Fix a logical vs bitwise bug
Message-Id: <20181019091628.4pvqvib3nlz2pznb@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The || was supposed to be |.  The original code just sets ->result to 1.

Fixes: 77266186397c ("scsi: myrs: Add Mylex RAID controller (SCSI interface)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/myrs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/myrs.c b/drivers/scsi/myrs.c
index b02ee0b0dd55..17e691bde485 100644
--- a/drivers/scsi/myrs.c
+++ b/drivers/scsi/myrs.c
@@ -2085,7 +2085,7 @@ static void myrs_handle_scsi(struct myrs_hba *cs, struct myrs_cmdblk *cmd_blk,
 	    status = MYRS_STATUS_DEVICE_NON_RESPONSIVE2)
 		scmd->result = (DID_BAD_TARGET << 16);
 	else
-		scmd->result = (DID_OK << 16) || status;
+		scmd->result = (DID_OK << 16) | status;
 	scmd->scsi_done(scmd);
 }
 
-- 
2.11.0
