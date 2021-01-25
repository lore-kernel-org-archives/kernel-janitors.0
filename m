From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Jan 2021 08:44:02 +0000
Subject: [PATCH] scsi: qla2xxx: fix some memory corruption
Message-Id: <YA6E0geUlL9Hs04A@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nilesh Javali <njavali@marvell.com>
Cc: GR-QLogic-Storage-Upstream@marvell.com, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Himanshu Madhani <himanshu.madhani@oracle.com>, Saurav Kashyap <skashyap@marvell.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This was supposed to be "data" instead of "&data".  The current code
will corrupt the stack.

Fixes: dbf1f53cfd23 ("scsi: qla2xxx: Implementation to get and manage host, target stats and initiator port")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/qla2xxx/qla_bsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/qla2xxx/qla_bsg.c b/drivers/scsi/qla2xxx/qla_bsg.c
index e45da05383cd..bee8cf9f8123 100644
--- a/drivers/scsi/qla2xxx/qla_bsg.c
+++ b/drivers/scsi/qla2xxx/qla_bsg.c
@@ -2667,7 +2667,7 @@ qla2x00_get_tgt_stats(struct bsg_job *bsg_job)
 
 		bsg_reply->reply_payload_rcv_len  			sg_copy_from_buffer(bsg_job->reply_payload.sg_list,
-					    bsg_job->reply_payload.sg_cnt, &data,
+					    bsg_job->reply_payload.sg_cnt, data,
 					    sizeof(struct ql_vnd_tgt_stats_resp));
 
 		bsg_reply->result = DID_OK;
-- 
2.29.2
