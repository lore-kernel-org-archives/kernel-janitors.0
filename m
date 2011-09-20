From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 20 Sep 2011 06:47:15 +0000
Subject: [patch 1/2] SCSI: advansys: handle errors from scsi_dma_map()
Message-Id: <20110920064715.GA28892@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, "open list:ADVANSYS SCSI DRIVER" <linux-scsi@vger.kernel.org>, kernel-janitors@vger.kernel.org

scsi_dma_map() returns -ENOMEM on error.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/scsi/advansys.c b/drivers/scsi/advansys.c
index bfd618a..04035af 100644
--- a/drivers/scsi/advansys.c
+++ b/drivers/scsi/advansys.c
@@ -8427,6 +8427,12 @@ static int asc_build_req(struct asc_board *boardp, struct scsi_cmnd *scp,
 
 	/* Build ASC_SCSI_Q */
 	use_sg = scsi_dma_map(scp);
+	if (use_sg < 0) {
+		scsi_dma_unmap(scp);
+		scp->result = HOST_BYTE(DID_SOFT_ERROR);
+		return ASC_ERROR;
+	}
+
 	if (use_sg != 0) {
 		int sgcnt;
 		struct scatterlist *slp;
