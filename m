From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2016 11:34:07 +0000
Subject: [patch] swim3: remove some dead code
Message-Id: <20161124112817.GO17225@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-block@vger.kernel.org, Jens Axboe <axboe@fb.com>
Cc: kernel-janitors@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>

The goto is correct.  "rc" is already set to -EBUSY so there is no need
to do anything with that.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/swim3.c b/drivers/block/swim3.c
index c264f2d..59b4a41 100644
--- a/drivers/block/swim3.c
+++ b/drivers/block/swim3.c
@@ -1179,7 +1179,6 @@ static int swim3_add_device(struct macio_dev *mdev, int index)
 		swim3_err("%s", "Couldn't request interrupt\n");
 		pmac_call_feature(PMAC_FTR_SWIM3_ENABLE, swim, 0, 0);
 		goto out_unmap;
-		return -EBUSY;
 	}
 
 	init_timer(&fs->timeout);
