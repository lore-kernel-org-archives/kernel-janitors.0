From: Cyril Roelandt <tipecaml@gmail.com>
Date: Sun, 02 Dec 2012 02:40:20 +0000
Subject: [PATCH 4/6] scsi: megaraid: remove a useless call to memset().
Message-Id: <1354416022-20189-5-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1354416022-20189-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1354416022-20189-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Cyril Roelandt <tipecaml@gmail.com>, megaraidlinux@lsi.com, JBottomley@parallels.com, linux-scsi@vger.kernel.org

This call is followed by a call to memcpy() on the same memory area, so it can
be safely removed.

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/scsi/megaraid/megaraid_sas_fusion.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/megaraid/megaraid_sas_fusion.c b/drivers/scsi/megaraid/megaraid_sas_fusion.c
index 74030af..71cc3eb 100644
--- a/drivers/scsi/megaraid/megaraid_sas_fusion.c
+++ b/drivers/scsi/megaraid/megaraid_sas_fusion.c
@@ -1028,8 +1028,6 @@ map_cmd_status(struct megasas_cmd_fusion *cmd, u8 status, u8 ext_status)
 
 		cmd->scmd->result = (DID_OK << 16) | ext_status;
 		if (ext_status = SAM_STAT_CHECK_CONDITION) {
-			memset(cmd->scmd->sense_buffer, 0,
-			       SCSI_SENSE_BUFFERSIZE);
 			memcpy(cmd->scmd->sense_buffer, cmd->sense,
 			       SCSI_SENSE_BUFFERSIZE);
 			cmd->scmd->result |= DRIVER_SENSE << 24;
-- 
1.7.10.4

