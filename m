From: Dan Carpenter <error27@gmail.com>
Date: Thu, 18 Nov 2010 05:05:45 +0000
Subject: [patch] Staging: spectra: update blk_queue_ordered()
Message-Id: <20101118050544.GO31724@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

blk_queue_ordered() isn't around anymore so this causes a compile error.
That change was in 4913efe456c "block: deprecate barrier and replace
blk_queue_ordered() with blk_queue_flush()" 

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/spectra/ffsport.c b/drivers/staging/spectra/ffsport.c
index c7932da..63a9d0a 100644
--- a/drivers/staging/spectra/ffsport.c
+++ b/drivers/staging/spectra/ffsport.c
@@ -656,7 +656,7 @@ static int SBD_setup_device(struct spectra_nand_dev *dev, int which)
 	/* Here we force report 512 byte hardware sector size to Kernel */
 	blk_queue_logical_block_size(dev->queue, 512);
 
-	blk_queue_ordered(dev->queue, QUEUE_ORDERED_DRAIN_FLUSH);
+	blk_queue_flush(dev->queue, REQ_FLUSH);
 
 	dev->thread = kthread_run(spectra_trans_thread, dev, "nand_thd");
 	if (IS_ERR(dev->thread)) {
