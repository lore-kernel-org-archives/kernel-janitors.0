From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 18:18:47 +0000
Subject: [PATCH 1/3] IB/iser: Delete an error message for a failed memory allocation in iser_send_data_out()
Message-Id: <8dc6dc89-c77f-513d-70d3-11bcf963a539@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <00e8b16f-c856-8999-fe93-2724a2f6a56e@users.sourceforge.net>
In-Reply-To: <00e8b16f-c856-8999-fe93-2724a2f6a56e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Or Gerlitz <ogerlitz@mellanox.com>, Roi Dayan <roid@mellanox.com>, Sagi Grimberg <sagi@grimberg.me>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 17:48:47 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/ulp/iser/iser_initiator.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/infiniband/ulp/iser/iser_initiator.c b/drivers/infiniband/ulp/iser/iser_initiator.c
index 2a07692007bd..3ae2571ba5b4 100644
--- a/drivers/infiniband/ulp/iser/iser_initiator.c
+++ b/drivers/infiniband/ulp/iser/iser_initiator.c
@@ -452,10 +452,8 @@ int iser_send_data_out(struct iscsi_conn *conn,
 		 __func__,(int)itt,(int)data_seg_len,(int)buf_offset);
 
 	tx_desc = kmem_cache_zalloc(ig.desc_cache, GFP_ATOMIC);
-	if (tx_desc = NULL) {
-		iser_err("Failed to alloc desc for post dataout\n");
+	if (!tx_desc)
 		return -ENOMEM;
-	}
 
 	tx_desc->type = ISCSI_TX_DATAOUT;
 	tx_desc->cqe.done = iser_dataout_comp;
-- 
2.16.1

