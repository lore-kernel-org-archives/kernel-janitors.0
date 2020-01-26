From: Colin King <colin.king@canonical.com>
Date: Sun, 26 Jan 2020 15:47:57 +0000
Subject: [PATCH][next] scsi: megaraid_sas: fix indentation issue
Message-Id: <20200126154757.42530-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kashyap Desai <kashyap.desai@broadcom.com>, Sumit Saxena <sumit.saxena@broadcom.com>, Shivasharan S <shivasharan.srikanteshwara@broadcom.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, megaraidlinux.pdl@broadcom.com, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two statments that are indented one level too deeply, remove
the extraneous tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/megaraid/megaraid_sas_base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
index acb82181f70f..b0a413ee75d5 100644
--- a/drivers/scsi/megaraid/megaraid_sas_base.c
+++ b/drivers/scsi/megaraid/megaraid_sas_base.c
@@ -8226,8 +8226,8 @@ megasas_mgmt_fw_ioctl(struct megasas_instance *instance,
 			"return -EBUSY from %s %d cmd 0x%x opcode 0x%x cmd->cmd_status_drv 0x%x\n",
 			 __func__, __LINE__, cmd->frame->hdr.cmd, opcode,
 			 cmd->cmd_status_drv);
-			error = -EBUSY;
-			goto out;
+		error = -EBUSY;
+		goto out;
 	}
 
 	cmd->sync_cmd = 0;
-- 
2.24.0
