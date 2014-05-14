From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 May 2014 12:54:18 +0000
Subject: [patch] mtip32xx: blk_mq_init_queue() returns an ERR_PTR
Message-Id: <20140514125418.GA14571@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@fb.com>
Cc: Asai Thambi S P <asamymuthupa@micron.com>, Sam Bradshaw <sbradshaw@micron.com>, Kent Overstreet <kmo@daterainc.com>, Alexander Gordeev <agordeev@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We changed this from blk_alloc_queue_node() to blk_mq_init_queue() so
the check needs to be updated as well.

Fixes: ee5036035df1 ('mtip32xx: convert to use blk-mq')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index 3a0882e..5979ab3 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -3890,7 +3890,7 @@ skip_create_disk:
 
 	/* Allocate the request queue. */
 	dd->queue = blk_mq_init_queue(&dd->tags);
-	if (dd->queue = NULL) {
+	if (IS_ERR(dd->queue)) {
 		dev_err(&dd->pdev->dev,
 			"Unable to allocate request queue\n");
 		rv = -ENOMEM;
