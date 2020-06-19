From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Jun 2020 14:30:41 +0000
Subject: [PATCH] scsi: qla2xxx: Fix a condition in qla2x00_find_all_fabric_devs()
Message-Id: <20200619143041.GD267142@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nilesh Javali <njavali@marvell.com>, Darren Trapp <darren.trapp@cavium.com>
Cc: GR-QLogic-Storage-Upstream@marvell.com, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Himanshu Madhani <himanshu.madhani@cavium.com>, Johannes Thumshirn <jthumshirn@suse.de>, Hannes Reinecke <hare@suse.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

This code doesn't make sense unless the correct "fcport" was found.

Fixes: 9dd9686b1419 ("scsi: qla2xxx: Add changes for devloss timeout in driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is from static analysis and review.  I'm not super familiar with
the code and I can't test it.  Please review it extra carefully.

 drivers/scsi/qla2xxx/qla_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/qla2xxx/qla_init.c b/drivers/scsi/qla2xxx/qla_init.c
index 4576d3ae9937..2436a17f5cd9 100644
--- a/drivers/scsi/qla2xxx/qla_init.c
+++ b/drivers/scsi/qla2xxx/qla_init.c
@@ -5944,7 +5944,7 @@ qla2x00_find_all_fabric_devs(scsi_qla_host_t *vha)
 			break;
 		}
 
-		if (NVME_TARGET(vha->hw, fcport)) {
+		if (found && NVME_TARGET(vha->hw, fcport)) {
 			if (fcport->disc_state = DSC_DELETE_PEND) {
 				qla2x00_set_fcport_disc_state(fcport, DSC_GNL);
 				vha->fcport_count--;
-- 
2.27.0
