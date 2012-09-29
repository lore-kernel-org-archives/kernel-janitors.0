From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 29 Sep 2012 07:11:04 +0000
Subject: [patch 1/2] memstick: use after free in msb_disk_release()
Message-Id: <20120929071104.GB10993@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxim Levitsky <maximlevitsky@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>

The original code dereferenced "msb" after freeing it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index c815fe5..a8e8915 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -1983,9 +1983,9 @@ static int msb_disk_release(struct gendisk *disk)
 			msb->usage_count--;
 
 		if (!msb->usage_count) {
-			kfree(msb);
 			disk->private_data = NULL;
 			idr_remove(&msb_disk_idr, msb->disk_id);
+			kfree(msb);
 			put_disk(disk);
 		}
 	}
