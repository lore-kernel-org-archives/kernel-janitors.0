From: Dan Carpenter <error27@gmail.com>
Date: Sun, 13 Mar 2011 20:59:37 +0000
Subject: [patch] block: NULL dereference on error path in __blkdev_get()
Message-Id: <20110313205937.GI2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, tj@kernel.org
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

"disk" is always NULL when we goto out.  There was a check for this
before, but it was removed in 69e02c59a7d9 "block: Don't check events
while open is in progress".

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/block_dev.c b/fs/block_dev.c
index fbe05cb..7d02afb 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1181,9 +1181,9 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, int for_part)
  out_unlock_bdev:
 	mutex_unlock(&bdev->bd_mutex);
 	disk_unblock_events(disk);
- out:
 	module_put(disk->fops->owner);
 	put_disk(disk);
+ out:
 	bdput(bdev);
 
 	return ret;
