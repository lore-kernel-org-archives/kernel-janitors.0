From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 30 Oct 2016 04:28:27 +0000
Subject: [PATCH] nbd: Fix error handling
Message-Id: <20161030042827.10160-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mpa@pengutronix.de, jbacik@fb.com, axboe@fb.com
Cc: nbd-general@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'blk_mq_alloc_request()' returns an error pointer in case of error, not
NULL. So test it with IS_ERR.

Fixes: 	fd8383fd88a2 ("nbd: convert to blkmq")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 19a16b2dbb91..7a1048755914 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -599,7 +599,7 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
 			return -EINVAL;
 
 		sreq = blk_mq_alloc_request(bdev_get_queue(bdev), WRITE, 0);
-		if (!sreq)
+		if (IS_ERR(sreq))
 			return -ENOMEM;
 
 		mutex_unlock(&nbd->tx_lock);
-- 
2.9.3

