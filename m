From: YueHaibing <yuehaibing@huawei.com>
Date: Sun, 21 Oct 2018 09:59:04 +0000
Subject: [PATCH -next] scsi: isci: remove set but not used variable 'index'
Message-Id: <1540116568-165417-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/isci/host.c: In function 'sci_controller_complete_io':
drivers/scsi/isci/host.c:2674:6: warning:
 variable 'index' set but not used [-Wunused-but-set-variable]

It not used any more after commit
db0562509800 ("isci: preallocate requests")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/isci/host.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/isci/host.c b/drivers/scsi/isci/host.c
index 7b5deae..7ebfa3c 100644
--- a/drivers/scsi/isci/host.c
+++ b/drivers/scsi/isci/host.c
@@ -2671,7 +2671,6 @@ enum sci_status sci_controller_complete_io(struct isci_host *ihost,
 					   struct isci_request *ireq)
 {
 	enum sci_status status;
-	u16 index;
 
 	switch (ihost->sm.current_state_id) {
 	case SCIC_STOPPING:
@@ -2682,7 +2681,6 @@ enum sci_status sci_controller_complete_io(struct isci_host *ihost,
 		if (status != SCI_SUCCESS)
 			return status;
 
-		index = ISCI_TAG_TCI(ireq->io_tag);
 		clear_bit(IREQ_ACTIVE, &ireq->flags);
 		return SCI_SUCCESS;
 	default:
