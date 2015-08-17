From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Aug 2015 14:36:47 +0000
Subject: [patch] qla4xxx: remove some bogus casts
Message-Id: <20150817143647.GA23820@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QLogic-Storage-Upstream@qlogic.com, Vikas Chaudhary <vikas.chaudhary@qlogic.com>
Cc: "James E.J. Bottomley" <JBottomley@odin.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

These casts are wrong and unnecessary.  They annoy static checkers
because they imply we are planning to write sizeof(long) bytes to a
sizeof(u32) buffer which would corrupt memory.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/qla4xxx/ql4_init.c b/drivers/scsi/qla4xxx/ql4_init.c
index 4180d6d..d97ea5d 100644
--- a/drivers/scsi/qla4xxx/ql4_init.c
+++ b/drivers/scsi/qla4xxx/ql4_init.c
@@ -101,19 +101,13 @@ int qla4xxx_init_rings(struct scsi_qla_host *ha)
 	ha->response_ptr = &ha->response_ring[ha->response_out];
 
 	if (is_qla8022(ha)) {
-		writel(0,
-		    (unsigned long  __iomem *)&ha->qla4_82xx_reg->req_q_out);
-		writel(0,
-		    (unsigned long  __iomem *)&ha->qla4_82xx_reg->rsp_q_in);
-		writel(0,
-		    (unsigned long  __iomem *)&ha->qla4_82xx_reg->rsp_q_out);
+		writel(0, &ha->qla4_82xx_reg->req_q_out);
+		writel(0, &ha->qla4_82xx_reg->rsp_q_in);
+		writel(0, &ha->qla4_82xx_reg->rsp_q_out);
 	} else if (is_qla8032(ha) || is_qla8042(ha)) {
-		writel(0,
-		       (unsigned long __iomem *)&ha->qla4_83xx_reg->req_q_in);
-		writel(0,
-		       (unsigned long __iomem *)&ha->qla4_83xx_reg->rsp_q_in);
-		writel(0,
-		       (unsigned long __iomem *)&ha->qla4_83xx_reg->rsp_q_out);
+		writel(0, &ha->qla4_83xx_reg->req_q_in);
+		writel(0, &ha->qla4_83xx_reg->rsp_q_in);
+		writel(0, &ha->qla4_83xx_reg->rsp_q_out);
 	} else {
 		/*
 		 * Initialize DMA Shadow registers.  The firmware is really
