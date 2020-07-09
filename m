From: Colin King <colin.king@canonical.com>
Date: Thu, 09 Jul 2020 13:52:17 +0000
Subject: [PATCH][next] scsi: cxgb4i: fix dereference of pointer tdata before it is null checked
Message-Id: <20200709135217.1408105-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Varun Prakash <varun@chelsio.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently pointer tdata is being dereferenced on the initialization of
pointer skb before tdata is null checked. This could lead to a potential
null pointer dereference.  Fix this by dereferencing tdata after tdata
has been null pointer sanity checked.

Addresses-Coverity: ("Dereference before null check")
Fixes: e33c2482289b ("scsi: cxgb4i: Add support for iSCSI segmentation offload")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/cxgbi/libcxgbi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/cxgbi/libcxgbi.c b/drivers/scsi/cxgbi/libcxgbi.c
index 1fb101c616b7..a6119d9daedf 100644
--- a/drivers/scsi/cxgbi/libcxgbi.c
+++ b/drivers/scsi/cxgbi/libcxgbi.c
@@ -2147,7 +2147,7 @@ int cxgbi_conn_init_pdu(struct iscsi_task *task, unsigned int offset,
 	struct iscsi_conn *conn = task->conn;
 	struct iscsi_tcp_task *tcp_task = task->dd_data;
 	struct cxgbi_task_data *tdata = iscsi_task_cxgbi_data(task);
-	struct sk_buff *skb = tdata->skb;
+	struct sk_buff *skb;
 	struct scsi_cmnd *sc = task->sc;
 	u32 expected_count, expected_offset;
 	u32 datalen = count, dlimit = 0;
@@ -2161,6 +2161,7 @@ int cxgbi_conn_init_pdu(struct iscsi_task *task, unsigned int offset,
 		       tcp_task ? tcp_task->dd_data : NULL, tdata);
 		return -EINVAL;
 	}
+	skb = tdata->skb;
 
 	log_debug(1 << CXGBI_DBG_ISCSI | 1 << CXGBI_DBG_PDU_TX,
 		  "task 0x%p,0x%p, skb 0x%p, 0x%x,0x%x,0x%x, %u+%u.\n",
@@ -2365,7 +2366,7 @@ int cxgbi_conn_xmit_pdu(struct iscsi_task *task)
 	struct iscsi_tcp_task *tcp_task = task->dd_data;
 	struct cxgbi_task_data *tdata = iscsi_task_cxgbi_data(task);
 	struct cxgbi_task_tag_info *ttinfo = &tdata->ttinfo;
-	struct sk_buff *skb = tdata->skb;
+	struct sk_buff *skb;
 	struct cxgbi_sock *csk = NULL;
 	u32 pdulen = 0;
 	u32 datalen;
@@ -2378,6 +2379,7 @@ int cxgbi_conn_xmit_pdu(struct iscsi_task *task)
 		return -EINVAL;
 	}
 
+	skb = tdata->skb;
 	if (!skb) {
 		log_debug(1 << CXGBI_DBG_ISCSI | 1 << CXGBI_DBG_PDU_TX,
 			  "task 0x%p, skb NULL.\n", task);
-- 
2.27.0
