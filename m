From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Aug 2017 10:36:57 +0000
Subject: [PATCH] scsi: qedi: off by one in qedi_get_cmd_from_tid()
Message-Id: <20170825103657.6kwprvwfks7szn3b@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QLogic-Storage-Upstream@cavium.com, Manish Rangankar <manish.rangankar@cavium.com>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

The > here should be >= or we end up reading one element beyond the end
of the qedi->itt_map[] array.  The qedi->itt_map[] array is allocated in
qedi_alloc_itt().

Fixes: ace7f46ba5fd ("scsi: qedi: Add QLogic FastLinQ offload iSCSI driver framework.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/qedi/qedi_main.c b/drivers/scsi/qedi/qedi_main.c
index c4a470bab4dd..cccc34adc0e0 100644
--- a/drivers/scsi/qedi/qedi_main.c
+++ b/drivers/scsi/qedi/qedi_main.c
@@ -1576,7 +1576,7 @@ struct qedi_cmd *qedi_get_cmd_from_tid(struct qedi_ctx *qedi, u32 tid)
 {
 	struct qedi_cmd *cmd = NULL;
 
-	if (tid > MAX_ISCSI_TASK_ENTRIES)
+	if (tid >= MAX_ISCSI_TASK_ENTRIES)
 		return NULL;
 
 	cmd = qedi->itt_map[tid].p_cmd;
