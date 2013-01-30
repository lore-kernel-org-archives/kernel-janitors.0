From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Jan 2013 07:07:31 +0000
Subject: [patch] [SCSI] qla4xxx: don't free NULL dma pool
Message-Id: <20130130070731.GC12396@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ravi Anand <ravi.anand@qlogic.com>
Cc: Vikas Chaudhary <vikas.chaudhary@qlogic.com>, iscsi-driver@qlogic.com, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

The error path calls dma_pool_free() on this path but "chap_table" is
NULL and "chap_dma" is uninitialized.  It's cleaner to just return
directly.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/qla4xxx/ql4_mbx.c b/drivers/scsi/qla4xxx/ql4_mbx.c
index 1c57c22..887e409 100644
--- a/drivers/scsi/qla4xxx/ql4_mbx.c
+++ b/drivers/scsi/qla4xxx/ql4_mbx.c
@@ -1404,10 +1404,8 @@ int qla4xxx_get_chap(struct scsi_qla_host *ha, char *username, char *password,
 	dma_addr_t chap_dma;
 
 	chap_table = dma_pool_alloc(ha->chap_dma_pool, GFP_KERNEL, &chap_dma);
-	if (chap_table = NULL) {
-		ret = -ENOMEM;
-		goto exit_get_chap;
-	}
+	if (chap_table = NULL)
+		return -ENOMEM;
 
 	chap_size = sizeof(struct ql4_chap_table);
 	memset(chap_table, 0, chap_size);
