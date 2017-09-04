From: Colin King <colin.king@canonical.com>
Date: Mon, 04 Sep 2017 11:23:16 +0000
Subject: [PATCH] RDMA/nes: do not leak uninitialized resp.reserved to userspace
Message-Id: <20170904112316.23832-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Faisal Latif <faisal.latif-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Colin Ian King <colin.king@canonical.com>

resp.reserved has not been initialized and so the copy_to_user (via
ib_copy_to_udata) is copying uninitialized data from the stack back
to user space which is a potential information leak. Fix this by
setting resp.reserved to zero.

Fixes: 3c2d774cad5b ("RDMA/nes: Add a driver for NetEffect RNICs")
Cc: <stable@vger.kernel.org> [2.6.24+]
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/nes/nes_verbs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/infiniband/hw/nes/nes_verbs.c b/drivers/infiniband/hw/nes/nes_verbs.c
index f0dc5f4aa177..052c3822dfed 100644
--- a/drivers/infiniband/hw/nes/nes_verbs.c
+++ b/drivers/infiniband/hw/nes/nes_verbs.c
@@ -1666,6 +1666,7 @@ static struct ib_cq *nes_create_cq(struct ib_device *ibdev,
 		resp.cq_id = nescq->hw_cq.cq_number;
 		resp.cq_size = nescq->hw_cq.cq_size;
 		resp.mmap_db_index = 0;
+		resp.reserved = 0;
 		if (ib_copy_to_udata(udata, &resp, sizeof resp - sizeof resp.reserved)) {
 			nes_free_resource(nesadapter, nesadapter->allocated_cqs, cq_num);
 			kfree(nescq);
-- 
2.14.1

