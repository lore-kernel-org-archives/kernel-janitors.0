From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 May 2017 21:23:57 +0000
Subject: [PATCH] scsi: qedf: Cleanup the type of io_log->op
Message-Id: <20170503212357.cdl4e43ihpyzl2w6@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QLogic-Storage-Upstream@cavium.com
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

We store sc_cmd->cmnd[0] which is an unsigned char in io_log->op so
this should also be unsigned char.  The other thing is that this is
displayed in the debugfs:

	seq_printf(s, "0x%02x:", io_log->op);

Smatch complains that the formatting won't work for negative values so
changing it to unsigned silences that warning as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/qedf/qedf.h b/drivers/scsi/qedf/qedf.h
index 40aeb6bb96a2..07ee88200e91 100644
--- a/drivers/scsi/qedf/qedf.h
+++ b/drivers/scsi/qedf/qedf.h
@@ -259,7 +259,7 @@ struct qedf_io_log {
 	uint16_t task_id;
 	uint32_t port_id; /* Remote port fabric ID */
 	int lun;
-	char op; /* SCSI CDB */
+	unsigned char op; /* SCSI CDB */
 	uint8_t lba[4];
 	unsigned int bufflen; /* SCSI buffer length */
 	unsigned int sg_count; /* Number of SG elements */
