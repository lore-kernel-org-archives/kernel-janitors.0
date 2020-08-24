From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Aug 2020 08:59:33 +0000
Subject: [PATCH] scsi: libcxgbi: Fix a use after free in cxgbi_conn_xmit_pdu()
Message-Id: <20200824085933.GD208317@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Varun Prakash <varun@chelsio.com>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Austin Kim <austindh.kim@gmail.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally move this logging printk after the free, but that leads
to a use after free.

Fixes: e33c2482289b ("scsi: cxgb4i: Add support for iSCSI segmentation offload")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/cxgbi/libcxgbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/cxgbi/libcxgbi.c b/drivers/scsi/cxgbi/libcxgbi.c
index 71aebaf533ea..0e8621a6956d 100644
--- a/drivers/scsi/cxgbi/libcxgbi.c
+++ b/drivers/scsi/cxgbi/libcxgbi.c
@@ -2457,10 +2457,10 @@ int cxgbi_conn_xmit_pdu(struct iscsi_task *task)
 		return err;
 	}
 
-	__kfree_skb(skb);
 	log_debug(1 << CXGBI_DBG_ISCSI | 1 << CXGBI_DBG_PDU_TX,
 		  "itt 0x%x, skb 0x%p, len %u/%u, xmit err %d.\n",
 		  task->itt, skb, skb->len, skb->data_len, err);
+	__kfree_skb(skb);
 	iscsi_conn_printk(KERN_ERR, task->conn, "xmit err %d.\n", err);
 	iscsi_conn_failure(task->conn, ISCSI_ERR_XMIT_FAILED);
 	return err;
-- 
2.28.0
