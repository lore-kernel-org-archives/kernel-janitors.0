From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 13 Nov 2018 07:09:38 +0000
Subject: [PATCH -next] scsi: pmcraid: remove set but not used variables 'res, access'
Message-Id: <1542092978-71192-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/pmcraid.c: In function 'pmcraid_abort_cmd':
drivers/scsi/pmcraid.c:2878:33: warning:
 variable 'res' set but not used [-Wunused-but-set-variable]

drivers/scsi/pmcraid.c: In function 'pmcraid_ioctl_passthrough':
drivers/scsi/pmcraid.c:3603:5: warning:
 variable 'access' set but not used [-Wunused-but-set-variable]

'res' never used since introduction in commit 89a368104150 ("[SCSI] pmcraid:
PMC-Sierra MaxRAID driver to support 6Gb/s SAS RAID controller")

'access' not used any more since commit
edb88cef0570 ("scsi: pmcraid: use normal copy_from_user")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/pmcraid.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index 707d766..555e4a3 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -2875,10 +2875,8 @@ static struct pmcraid_cmd *pmcraid_abort_cmd(struct pmcraid_cmd *cmd)
 {
 	struct pmcraid_cmd *cancel_cmd;
 	struct pmcraid_instance *pinstance;
-	struct pmcraid_resource_entry *res;
 
 	pinstance = (struct pmcraid_instance *)cmd->drv_inst;
-	res = cmd->scsi_cmd->device->hostdata;
 
 	cancel_cmd = pmcraid_get_free_cmd(pinstance);
 
@@ -3600,7 +3598,7 @@ static long pmcraid_ioctl_passthrough(
 	u32 ioasc;
 	int request_size;
 	int buffer_size;
-	u8 access, direction;
+	u8 direction;
 	int rc = 0;
 
 	/* If IOA reset is in progress, wait 10 secs for reset to complete */
@@ -3648,13 +3646,10 @@ static long pmcraid_ioctl_passthrough(
 
 	request_size = le32_to_cpu(buffer->ioarcb.data_transfer_length);
 
-	if (buffer->ioarcb.request_flags0 & TRANSFER_DIR_WRITE) {
-		access = VERIFY_READ;
+	if (buffer->ioarcb.request_flags0 & TRANSFER_DIR_WRITE)
 		direction = DMA_TO_DEVICE;
-	} else {
-		access = VERIFY_WRITE;
+	else
 		direction = DMA_FROM_DEVICE;
-	}
 
 	if (request_size < 0) {
 		rc = -EINVAL;
