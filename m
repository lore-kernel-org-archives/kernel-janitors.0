From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Feb 2012 07:30:12 +0000
Subject: [patch] [SCSI] qla4xxx: silence a Sparse warning
Message-Id: <20120221073011.GC6896@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ravi Anand <ravi.anand@qlogic.com>
Cc: Vikas Chaudhary <vikas.chaudhary@qlogic.com>, iscsi-driver@qlogic.com, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

Sparse complains that the definition of this funciton doesn't match the
implementation.  The "uint32_t aen_code" should be an enum.

drivers/scsi/qla4xxx/ql4_os.c:2966:5: error: symbol
	'qla4xxx_post_aen_work' redeclared with different type
	(originally declared at drivers/scsi/qla4xxx/ql4_glbl.h:184)
	- incompatible argument 2 (different signedness)

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/qla4xxx/ql4_glbl.h b/drivers/scsi/qla4xxx/ql4_glbl.h
index 954ba91..71bbc07 100644
--- a/drivers/scsi/qla4xxx/ql4_glbl.h
+++ b/drivers/scsi/qla4xxx/ql4_glbl.h
@@ -181,7 +181,8 @@ int qla4xxx_flash_ddb_change(struct scsi_qla_host *ha, uint32_t fw_ddb_index,
 int qla4xxx_ddb_change(struct scsi_qla_host *ha, uint32_t fw_ddb_index,
 		       struct ddb_entry *ddb_entry, uint32_t state);
 void qla4xxx_build_ddb_list(struct scsi_qla_host *ha, int is_reset);
-int qla4xxx_post_aen_work(struct scsi_qla_host *ha, uint32_t aen_code,
+int qla4xxx_post_aen_work(struct scsi_qla_host *ha,
+			  enum iscsi_host_event_code aen_code,
 			  uint32_t data_size, uint8_t *data);
 int qla4xxx_ping_iocb(struct scsi_qla_host *ha, uint32_t options,
 		      uint32_t payload_size, uint32_t pid, uint8_t *ipaddr);
