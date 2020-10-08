From: Colin King <colin.king@canonical.com>
Date: Thu, 08 Oct 2020 18:32:39 +0000
Subject: [PATCH] scsi: qla2xxx: fix return of uninitialized value in rval
Message-Id: <20201008183239.200358-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Himanshu Madhani <himanshu.madhani@oracle.com>, Pavel Machek <pavel@denx.de>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A previous change removed the initialization of rval and there is
now an error where an uninitialized rval is being returned on an
error return path. Fix this by returning -ENODEV.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: b994718760fa ("scsi: qla2xxx: Use constant when it is known")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/qla2xxx/qla_nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/qla2xxx/qla_nvme.c b/drivers/scsi/qla2xxx/qla_nvme.c
index ae47e0eb0311..1f9005125313 100644
--- a/drivers/scsi/qla2xxx/qla_nvme.c
+++ b/drivers/scsi/qla2xxx/qla_nvme.c
@@ -561,7 +561,7 @@ static int qla_nvme_post_cmd(struct nvme_fc_local_port *lport,
 	vha = fcport->vha;
 
 	if (!(fcport->nvme_flag & NVME_FLAG_REGISTERED))
-		return rval;
+		return -ENODEV;
 
 	if (test_bit(ABORT_ISP_ACTIVE, &vha->dpc_flags) ||
 	    (qpair && !qpair->fw_started) || fcport->deleted)
-- 
2.27.0
