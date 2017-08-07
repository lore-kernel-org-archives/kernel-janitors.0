From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 07 Aug 2017 13:00:16 +0000
Subject: [PATCH 2/5] block-skd: Adjust 44 checks for null pointers
Message-Id: <1df2d0ea-ddd2-f8d2-f9ec-c877c2d7e31f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <56b55301-2db3-9c0b-297f-c2115fd92c6c@users.sourceforge.net>
In-Reply-To: <56b55301-2db3-9c0b-297f-c2115fd92c6c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Geliang Tang <geliangtang@gmail.com>, Jens Axboe <axboe@kernel.dk>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 7 Aug 2017 14:00:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/skd_main.c | 92 +++++++++++++++++++++++-------------------------
 1 file changed, 44 insertions(+), 48 deletions(-)

diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
index c90c05555d94..fa8569d4543b 100644
--- a/drivers/block/skd_main.c
+++ b/drivers/block/skd_main.c
@@ -488,7 +488,7 @@ static void skd_fail_all_pending(struct skd_device *skdev)
 
 	for (;; ) {
 		req = blk_peek_request(q);
-		if (req = NULL)
+		if (!req)
 			break;
 		blk_start_request(req);
 		__blk_end_request_all(req, BLK_STS_IOERR);
@@ -562,8 +562,8 @@ static void skd_request_fn(struct request_queue *q)
 	}
 
 	if (blk_queue_stopped(skdev->queue)) {
-		if (skdev->skmsg_free_list = NULL ||
-		    skdev->skreq_free_list = NULL ||
+		if (!skdev->skmsg_free_list ||
+		    !skdev->skreq_free_list ||
 		    skdev->in_flight >= skdev->queue_low_water_mark)
 			/* There is still some kind of shortage */
 			return;
@@ -585,7 +585,7 @@ static void skd_request_fn(struct request_queue *q)
 		req = blk_peek_request(q);
 
 		/* Are there any native requests to start? */
-		if (req = NULL)
+		if (!req)
 			break;
 
 		lba = (u32)blk_rq_pos(req);
@@ -616,7 +616,7 @@ static void skd_request_fn(struct request_queue *q)
 
 		/* Is a skd_request_context available? */
 		skreq = skdev->skreq_free_list;
-		if (skreq = NULL) {
+		if (!skreq) {
 			pr_debug("%s:%s:%d Out of req=%p\n",
 				 skdev->name, __func__, __LINE__, q);
 			break;
@@ -625,8 +625,8 @@ static void skd_request_fn(struct request_queue *q)
 		SKD_ASSERT((skreq->id & SKD_ID_INCR) = 0);
 
 		/* Now we check to see if we can get a fit msg */
-		if (skmsg = NULL) {
-			if (skdev->skmsg_free_list = NULL) {
+		if (!skmsg) {
+			if (!skdev->skmsg_free_list) {
 				pr_debug("%s:%s:%d Out of msg\n",
 					 skdev->name, __func__, __LINE__);
 				break;
@@ -649,10 +649,10 @@ static void skd_request_fn(struct request_queue *q)
 		skreq->fitmsg_id = 0;
 
 		/* Either a FIT msg is in progress or we have to start one. */
-		if (skmsg = NULL) {
+		if (!skmsg) {
 			/* Are there any FIT msg buffers available? */
 			skmsg = skdev->skmsg_free_list;
-			if (skmsg = NULL) {
+			if (!skmsg) {
 				pr_debug("%s:%s:%d Out of msg skdev=%p\n",
 					 skdev->name, __func__, __LINE__,
 					 skdev);
@@ -772,7 +772,7 @@ static void skd_request_fn(struct request_queue *q)
 	 * This minimizes latency when there are fewer requests than
 	 * what fits in a FIT msg.
 	 */
-	if (skmsg != NULL) {
+	if (skmsg) {
 		/* Bigger than just a FIT msg header? */
 		if (skmsg->length > sizeof(struct fit_msg_hdr)) {
 			pr_debug("%s:%s:%d sending msg=%p, len %d\n",
@@ -1300,7 +1300,7 @@ static int skd_ioctl_sg_io(struct skd_device *skdev, fmode_t mode,
 out:
 	skd_sg_io_release_skspcl(skdev, &sksgio);
 
-	if (sksgio.iov != NULL && sksgio.iov != &sksgio.no_iov_iov)
+	if (sksgio.iov && sksgio.iov != &sksgio.no_iov_iov)
 		kfree(sksgio.iov);
 	return rc;
 }
@@ -1450,7 +1450,7 @@ static int skd_sg_io_obtain_skspcl(struct skd_device *skdev,
 
 		spin_lock_irqsave(&skdev->lock, flags);
 		skspcl = skdev->skspcl_free_list;
-		if (skspcl != NULL) {
+		if (skspcl) {
 			skdev->skspcl_free_list  				(struct skd_special_context *)skspcl->req.next;
 			skspcl->req.id += SKD_ID_INCR;
@@ -1460,7 +1460,7 @@ static int skd_sg_io_obtain_skspcl(struct skd_device *skdev,
 		}
 		spin_unlock_irqrestore(&skdev->lock, flags);
 
-		if (skspcl != NULL) {
+		if (skspcl) {
 			rc = 0;
 			break;
 		}
@@ -1520,7 +1520,7 @@ static int skd_skreq_prep_buffering(struct skd_device *skdev,
 			nbytes = resid;
 
 		page = alloc_page(GFP_KERNEL);
-		if (page = NULL)
+		if (!page)
 			return -ENOMEM;
 
 		sg_set_page(sg, page, nbytes, 0);
@@ -1781,7 +1781,7 @@ static int skd_sg_io_release_skspcl(struct skd_device *skdev,
 {
 	struct skd_special_context *skspcl = sksgio->skspcl;
 
-	if (skspcl != NULL) {
+	if (skspcl) {
 		ulong flags;
 
 		sksgio->skspcl = NULL;
@@ -2889,7 +2889,7 @@ static void skd_release_special(struct skd_device *skdev,
 		__free_page(page);
 	}
 
-	was_depleted = (skdev->skspcl_free_list = NULL);
+	was_depleted = !skdev->skspcl_free_list;
 
 	skspcl->req.state = SKD_REQ_STATE_IDLE;
 	skspcl->req.id += SKD_ID_INCR;
@@ -3173,7 +3173,7 @@ static void skd_recover_requests(struct skd_device *skdev, int requeue)
 			skd_log_skreq(skdev, skreq, "recover");
 
 			SKD_ASSERT((skreq->id & SKD_ID_INCR) != 0);
-			SKD_ASSERT(skreq->req != NULL);
+			SKD_ASSERT(skreq->req);
 
 			/* Release DMA resources for the request. */
 			if (skreq->n_sg > 0)
@@ -3975,8 +3975,7 @@ static int skd_cons_skcomp(struct skd_device *skdev)
 
 	skcomp = pci_zalloc_consistent(skdev->pdev, nbytes,
 				       &skdev->cq_dma_address);
-
-	if (skcomp = NULL) {
+	if (!skcomp) {
 		rc = -ENOMEM;
 		goto err_out;
 	}
@@ -4003,7 +4002,7 @@ static int skd_cons_skmsg(struct skd_device *skdev)
 
 	skdev->skmsg_table = kzalloc(sizeof(struct skd_fitmsg_context)
 				     *skdev->num_fitmsg_context, GFP_KERNEL);
-	if (skdev->skmsg_table = NULL) {
+	if (!skdev->skmsg_table) {
 		rc = -ENOMEM;
 		goto err_out;
 	}
@@ -4019,8 +4018,7 @@ static int skd_cons_skmsg(struct skd_device *skdev)
 		skmsg->msg_buf = pci_alloc_consistent(skdev->pdev,
 						      SKD_N_FITMSG_BYTES + 64,
 						      &skmsg->mb_dma_address);
-
-		if (skmsg->msg_buf = NULL) {
+		if (!skmsg->msg_buf) {
 			rc = -ENOMEM;
 			goto err_out;
 		}
@@ -4055,8 +4053,7 @@ static struct fit_sg_descriptor *skd_cons_sg_list(struct skd_device *skdev,
 	nbytes = sizeof(*sg_list) * n_sg;
 
 	sg_list = pci_alloc_consistent(skdev->pdev, nbytes, ret_dma_addr);
-
-	if (sg_list != NULL) {
+	if (sg_list) {
 		uint64_t dma_address = *ret_dma_addr;
 		u32 i;
 
@@ -4087,7 +4084,7 @@ static int skd_cons_skreq(struct skd_device *skdev)
 
 	skdev->skreq_table = kzalloc(sizeof(struct skd_request_context)
 				     * skdev->num_req_context, GFP_KERNEL);
-	if (skdev->skreq_table = NULL) {
+	if (!skdev->skreq_table) {
 		rc = -ENOMEM;
 		goto err_out;
 	}
@@ -4107,7 +4104,7 @@ static int skd_cons_skreq(struct skd_device *skdev)
 
 		skreq->sg = kzalloc(sizeof(struct scatterlist) *
 				    skdev->sgs_per_request, GFP_KERNEL);
-		if (skreq->sg = NULL) {
+		if (!skreq->sg) {
 			rc = -ENOMEM;
 			goto err_out;
 		}
@@ -4116,8 +4113,7 @@ static int skd_cons_skreq(struct skd_device *skdev)
 		skreq->sksg_list = skd_cons_sg_list(skdev,
 						    skdev->sgs_per_request,
 						    &skreq->sksg_dma_address);
-
-		if (skreq->sksg_list = NULL) {
+		if (!skreq->sksg_list) {
 			rc = -ENOMEM;
 			goto err_out;
 		}
@@ -4146,7 +4142,7 @@ static int skd_cons_skspcl(struct skd_device *skdev)
 
 	skdev->skspcl_table = kzalloc(sizeof(struct skd_special_context)
 				      * skdev->n_special, GFP_KERNEL);
-	if (skdev->skspcl_table = NULL) {
+	if (!skdev->skspcl_table) {
 		rc = -ENOMEM;
 		goto err_out;
 	}
@@ -4166,14 +4162,14 @@ static int skd_cons_skspcl(struct skd_device *skdev)
 		skspcl->msg_buf  			pci_zalloc_consistent(skdev->pdev, nbytes,
 					      &skspcl->mb_dma_address);
-		if (skspcl->msg_buf = NULL) {
+		if (!skspcl->msg_buf) {
 			rc = -ENOMEM;
 			goto err_out;
 		}
 
 		skspcl->req.sg = kzalloc(sizeof(struct scatterlist) *
 					 SKD_N_SG_PER_SPECIAL, GFP_KERNEL);
-		if (skspcl->req.sg = NULL) {
+		if (!skspcl->req.sg) {
 			rc = -ENOMEM;
 			goto err_out;
 		}
@@ -4182,7 +4178,7 @@ static int skd_cons_skspcl(struct skd_device *skdev)
 							 SKD_N_SG_PER_SPECIAL,
 							 &skspcl->req.
 							 sksg_dma_address);
-		if (skspcl->req.sksg_list = NULL) {
+		if (!skspcl->req.sksg_list) {
 			rc = -ENOMEM;
 			goto err_out;
 		}
@@ -4213,7 +4209,7 @@ static int skd_cons_sksb(struct skd_device *skdev)
 
 	skspcl->data_buf = pci_zalloc_consistent(skdev->pdev, nbytes,
 						 &skspcl->db_dma_address);
-	if (skspcl->data_buf = NULL) {
+	if (!skspcl->data_buf) {
 		rc = -ENOMEM;
 		goto err_out;
 	}
@@ -4221,14 +4217,14 @@ static int skd_cons_sksb(struct skd_device *skdev)
 	nbytes = SKD_N_SPECIAL_FITMSG_BYTES;
 	skspcl->msg_buf = pci_zalloc_consistent(skdev->pdev, nbytes,
 						&skspcl->mb_dma_address);
-	if (skspcl->msg_buf = NULL) {
+	if (!skspcl->msg_buf) {
 		rc = -ENOMEM;
 		goto err_out;
 	}
 
 	skspcl->req.sksg_list = skd_cons_sg_list(skdev, 1,
 						 &skspcl->req.sksg_dma_address);
-	if (skspcl->req.sksg_list = NULL) {
+	if (!skspcl->req.sksg_list) {
 		rc = -ENOMEM;
 		goto err_out;
 	}
@@ -4377,7 +4373,7 @@ static struct skd_device *skd_construct(struct pci_dev *pdev)
 
 static void skd_free_skcomp(struct skd_device *skdev)
 {
-	if (skdev->skcomp_table != NULL) {
+	if (skdev->skcomp_table) {
 		u32 nbytes;
 
 		nbytes = sizeof(skdev->skcomp_table[0]) *
@@ -4394,7 +4390,7 @@ static void skd_free_skmsg(struct skd_device *skdev)
 {
 	u32 i;
 
-	if (skdev->skmsg_table = NULL)
+	if (!skdev->skmsg_table)
 		return;
 
 	for (i = 0; i < skdev->num_fitmsg_context; i++) {
@@ -4402,7 +4398,7 @@ static void skd_free_skmsg(struct skd_device *skdev)
 
 		skmsg = &skdev->skmsg_table[i];
 
-		if (skmsg->msg_buf != NULL) {
+		if (skmsg->msg_buf) {
 			skmsg->msg_buf += skmsg->offset;
 			skmsg->mb_dma_address += skmsg->offset;
 			pci_free_consistent(skdev->pdev, SKD_N_FITMSG_BYTES,
@@ -4421,7 +4417,7 @@ static void skd_free_sg_list(struct skd_device *skdev,
 			     struct fit_sg_descriptor *sg_list,
 			     u32 n_sg, dma_addr_t dma_addr)
 {
-	if (sg_list != NULL) {
+	if (sg_list) {
 		u32 nbytes;
 
 		nbytes = sizeof(*sg_list) * n_sg;
@@ -4434,7 +4430,7 @@ static void skd_free_skreq(struct skd_device *skdev)
 {
 	u32 i;
 
-	if (skdev->skreq_table = NULL)
+	if (!skdev->skreq_table)
 		return;
 
 	for (i = 0; i < skdev->num_req_context; i++) {
@@ -4461,7 +4457,7 @@ static void skd_free_skspcl(struct skd_device *skdev)
 	u32 i;
 	u32 nbytes;
 
-	if (skdev->skspcl_table = NULL)
+	if (!skdev->skspcl_table)
 		return;
 
 	for (i = 0; i < skdev->n_special; i++) {
@@ -4469,7 +4465,7 @@ static void skd_free_skspcl(struct skd_device *skdev)
 
 		skspcl = &skdev->skspcl_table[i];
 
-		if (skspcl->msg_buf != NULL) {
+		if (skspcl->msg_buf) {
 			nbytes = SKD_N_SPECIAL_FITMSG_BYTES;
 			pci_free_consistent(skdev->pdev, nbytes,
 					    skspcl->msg_buf,
@@ -4500,7 +4496,7 @@ static void skd_free_sksb(struct skd_device *skdev)
 
 	skspcl = &skdev->internal_skspcl;
 
-	if (skspcl->data_buf != NULL) {
+	if (skspcl->data_buf) {
 		nbytes = SKD_N_INTERNAL_BYTES;
 
 		pci_free_consistent(skdev->pdev, nbytes,
@@ -4510,7 +4506,7 @@ static void skd_free_sksb(struct skd_device *skdev)
 	skspcl->data_buf = NULL;
 	skspcl->db_dma_address = 0;
 
-	if (skspcl->msg_buf != NULL) {
+	if (skspcl->msg_buf) {
 		nbytes = SKD_N_SPECIAL_FITMSG_BYTES;
 		pci_free_consistent(skdev->pdev, nbytes,
 				    skspcl->msg_buf, skspcl->mb_dma_address);
@@ -4530,7 +4526,7 @@ static void skd_free_disk(struct skd_device *skdev)
 {
 	struct gendisk *disk = skdev->disk;
 
-	if (disk != NULL) {
+	if (disk) {
 		struct request_queue *q = disk->queue;
 
 		if (disk->flags & GENHD_FL_UP)
@@ -4544,7 +4540,7 @@ static void skd_free_disk(struct skd_device *skdev)
 
 static void skd_destruct(struct skd_device *skdev)
 {
-	if (skdev = NULL)
+	if (!skdev)
 		return;
 
 
@@ -4699,7 +4695,7 @@ static int skd_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	skdev = skd_construct(pdev);
-	if (skdev = NULL) {
+	if (!skdev) {
 		rc = -ENOMEM;
 		goto err_out_regions;
 	}
@@ -5170,7 +5166,7 @@ static void skd_log_skreq(struct skd_device *skdev,
 		 skdev->name, __func__, __LINE__,
 		 skreq->timeout_stamp, skreq->sg_data_dir, skreq->n_sg);
 
-	if (skreq->req != NULL) {
+	if (skreq->req) {
 		struct request *req = skreq->req;
 		u32 lba = (u32)blk_rq_pos(req);
 		u32 count = blk_rq_sectors(req);
-- 
2.13.4

