From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Jan 2014 13:18:51 +0000
Subject: [patch] IB/iser: use after free in iser_snd_completion()
Message-Id: <20140129131850.GD10678@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Or Gerlitz <ogerlitz-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: Roi Dayan <roid-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We use "tx_desc" again after we free it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/ulp/iser/iser_initiator.c b/drivers/infiniband/ulp/iser/iser_initiator.c
index 538822684d5b..334f34b1cd46 100644
--- a/drivers/infiniband/ulp/iser/iser_initiator.c
+++ b/drivers/infiniband/ulp/iser/iser_initiator.c
@@ -610,11 +610,12 @@ void iser_snd_completion(struct iser_tx_desc *tx_desc,
 		ib_dma_unmap_single(device->ib_device, tx_desc->dma_addr,
 					ISER_HEADERS_LEN, DMA_TO_DEVICE);
 		kmem_cache_free(ig.desc_cache, tx_desc);
+		tx_desc = NULL;
 	}
 
 	atomic_dec(&ib_conn->post_send_buf_count);
 
-	if (tx_desc->type = ISCSI_TX_CONTROL) {
+	if (tx_desc && tx_desc->type = ISCSI_TX_CONTROL) {
 		/* this arithmetic is legal by libiscsi dd_data allocation */
 		task = (void *) ((long)(void *)tx_desc -
 				  sizeof(struct iscsi_task));
