From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Jul 2014 07:44:47 +0000
Subject: [patch] RDMA/amso1100: integer overflow in c2_alloc_cq_buf()
Message-Id: <20140717074447.GA477@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Tucker <tom-7bPotxP6k4+P2YhJcF5u+vpXobYPEAuW@public.gmane.org>
Cc: Steve Wise <swise-7bPotxP6k4+P2YhJcF5u+vpXobYPEAuW@public.gmane.org>, Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This is a static checker fix.  The static checker says that q_size comes
from the user and can be any 32 bit value.  The call tree is:
  --> ib_uverbs_create_cq()
      --> c2_create_cq()
          --> c2_init_cq()

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/amso1100/c2_cq.c b/drivers/infiniband/hw/amso1100/c2_cq.c
index 49e0e85..1b63185 100644
--- a/drivers/infiniband/hw/amso1100/c2_cq.c
+++ b/drivers/infiniband/hw/amso1100/c2_cq.c
@@ -260,11 +260,14 @@ static void c2_free_cq_buf(struct c2_dev *c2dev, struct c2_mq *mq)
 			  mq->msg_pool.host, dma_unmap_addr(mq, mapping));
 }
 
-static int c2_alloc_cq_buf(struct c2_dev *c2dev, struct c2_mq *mq, int q_size,
-			   int msg_size)
+static int c2_alloc_cq_buf(struct c2_dev *c2dev, struct c2_mq *mq,
+			   size_t q_size, size_t msg_size)
 {
 	u8 *pool_start;
 
+	if (q_size > SIZE_MAX / msg_size)
+		return -EINVAL;
+
 	pool_start = dma_alloc_coherent(&c2dev->pcidev->dev, q_size * msg_size,
 					&mq->host_dma, GFP_KERNEL);
 	if (!pool_start)
