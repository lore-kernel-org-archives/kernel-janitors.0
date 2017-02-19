From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 19 Feb 2017 19:04:38 +0000
Subject: [PATCH] nvmet-rdma: Fix error handling
Message-Id: <20170219190438.19371-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

According to the surrounding goto, it is likely that 'out_destroy_sq' was
expected here.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/nvme/target/rdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/target/rdma.c b/drivers/nvme/target/rdma.c
index 60990220bd83..2ae63f7e17ed 100644
--- a/drivers/nvme/target/rdma.c
+++ b/drivers/nvme/target/rdma.c
@@ -1091,7 +1091,7 @@ nvmet_rdma_alloc_queue(struct nvmet_rdma_device *ndev,
 	queue->idx = ida_simple_get(&nvmet_rdma_queue_ida, 0, 0, GFP_KERNEL);
 	if (queue->idx < 0) {
 		ret = NVME_RDMA_CM_NO_RSC;
-		goto out_free_queue;
+		goto out_destroy_sq;
 	}
 
 	ret = nvmet_rdma_alloc_rsps(queue);
-- 
2.9.3

