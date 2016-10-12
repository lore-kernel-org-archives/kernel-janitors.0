From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 06:24:02 +0000
Subject: [patch 2/2] nbd: checking for NULL vs IS_ERR
Message-Id: <20161012062402.GW12841@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

blk_mq_alloc_request() returns error pointers on error, never NULLs.
Same thing with blk_mq_init_queue(), and also we should set the error
code there.

Fixes: fd8383fd88a2 ('nbd: convert to blkmq')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index ba405b5..8c2599d 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -599,8 +599,8 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
 			return -EINVAL;
 
 		sreq = blk_mq_alloc_request(bdev_get_queue(bdev), WRITE, 0);
-		if (!sreq)
-			return -ENOMEM;
+		if (IS_ERR(sreq))
+			return PTR_ERR(sreq);
 
 		mutex_unlock(&nbd->tx_lock);
 		fsync_bdev(bdev);
diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index ad62964..bb5f23b 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -955,9 +955,10 @@ static int __init nbd_init(void)
 		 * These structs are big so we dynamically allocate them.
 		 */
 		disk->queue = blk_mq_init_queue(&nbd_dev[i].tag_set);
-		if (!disk->queue) {
+		if (IS_ERR(disk->queue)) {
 			blk_mq_free_tag_set(&nbd_dev[i].tag_set);
 			put_disk(disk);
+			err = PTR_ERR(disk->queue);
 			goto out;
 		}
 
