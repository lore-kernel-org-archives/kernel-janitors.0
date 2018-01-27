From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 18:21:51 +0000
Subject: [PATCH 3/3] IB/iser: Combine substrings for three messages
Message-Id: <66f716b8-f01a-6cde-ede9-f36c20b33f76@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <00e8b16f-c856-8999-fe93-2724a2f6a56e@users.sourceforge.net>
In-Reply-To: <00e8b16f-c856-8999-fe93-2724a2f6a56e-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>, Or Gerlitz <ogerlitz-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Roi Dayan <roid-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Sagi Grimberg <sagi-NQWnxTmZq1alnMjI0IkVqw@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 18:25:37 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: quoted string split across lines

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/ulp/iser/iser_initiator.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/infiniband/ulp/iser/iser_initiator.c b/drivers/infiniband/ulp/iser/iser_initiator.c
index 1425c4957a04..df49c4eb67f7 100644
--- a/drivers/infiniband/ulp/iser/iser_initiator.c
+++ b/drivers/infiniband/ulp/iser/iser_initiator.c
@@ -142,8 +142,7 @@ iser_prepare_write_cmd(struct iscsi_task *task,
 			hdr->write_va = cpu_to_be64(mem_reg->sge.addr + unsol_sz);
 		}
 
-		iser_dbg("Cmd itt:%d, WRITE tags, RKEY:%#.4X "
-			 "VA:%#llX + unsol:%d\n",
+		iser_dbg("Cmd itt:%d, WRITE tags, RKEY:%#.4X VA:%#llX + unsol:%d\n",
 			 task->itt, mem_reg->rkey,
 			 (unsigned long long)mem_reg->sge.addr, unsol_sz);
 	}
@@ -473,8 +472,7 @@ int iser_send_data_out(struct iscsi_conn *conn,
 	tx_desc->num_sge = 2;
 
 	if (buf_offset + data_seg_len > iser_task->data[ISER_DIR_OUT].data_len) {
-		iser_err("Offset:%ld & DSL:%ld in Data-Out "
-			 "inconsistent with total len:%ld, itt:%d\n",
+		iser_err("Offset:%ld & DSL:%ld in Data-Out inconsistent with total len:%ld, itt:%d\n",
 			 buf_offset, data_seg_len,
 			 iser_task->data[ISER_DIR_OUT].data_len, itt);
 		err = -EINVAL;
@@ -612,8 +610,8 @@ iser_check_remote_inv(struct iser_conn *iser_conn,
 			 iser_conn, rkey);
 
 		if (unlikely(!iser_conn->snd_w_inv)) {
-			iser_err("conn %p: unexpected remote invalidation, "
-				 "terminating connection\n", iser_conn);
+			iser_err("conn %p: unexpected remote invalidation, terminating connection\n",
+				 iser_conn);
 			return -EPROTO;
 		}
 
-- 
2.16.1

