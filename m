From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 20 Feb 2018 09:46:11 +0000
Subject: [PATCH 2/2] scsi: myrs: bitwise vs logical OR typo
Message-Id: <20180220094611.GB22646@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We accidentally used a logical || instead of a | so these bit masks are
off.

Fixes: 8a8606895947 ("scsi: myrs: Add Mylex RAID controller (SCSI interface)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/myrs.c b/drivers/scsi/myrs.c
index eaa9d143a282..db3c84fc3a29 100644
--- a/drivers/scsi/myrs.c
+++ b/drivers/scsi/myrs.c
@@ -907,7 +907,7 @@ static void myrs_log_event(myrs_hba *cs, myrs_event *ev)
 	}
 	if (sshdr.sense_key = VENDOR_SPECIFIC &&
 	    (sshdr.asc = 0x80 || sshdr.asc = 0x81))
-		ev->ev_code = ((sshdr.asc - 0x80) << 8 || sshdr.ascq);
+		ev->ev_code = ((sshdr.asc - 0x80) << 8 | sshdr.ascq);
 	while (true) {
 		ev_code = myrs_ev_list[ev_idx].ev_code;
 		if (ev_code = ev->ev_code || ev_code = 0)
@@ -2201,7 +2201,7 @@ static void myrs_handle_scsi(myrs_hba *cs, myrs_cmdblk *cmd_blk,
 	    status = DAC960_V2_DeviceNonresponsive2)
 		scmd->result = (DID_BAD_TARGET << 16);
 	else
-		scmd->result = (DID_OK << 16) || status;
+		scmd->result = (DID_OK << 16) | status;
 	scmd->scsi_done(scmd);
 }
 
