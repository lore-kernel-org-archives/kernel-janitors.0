From: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 28 Feb 2015 10:02:29 +0000
Subject: [PATCH 6/7] mtd: blkdevs: remove dead code
Message-Id: <1425117750-22298-7-git-send-email-computersforpeace@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The only exit (break) from the preceding loop is nested within a
condition which yields req = NULL. This code is dead.

Coverity CID #752669

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index d08229eb44d8..2b0c52870999 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -171,9 +171,6 @@ static void mtd_blktrans_work(struct work_struct *work)
 		background_done = 0;
 	}
 
-	if (req)
-		__blk_end_request_all(req, -EIO);
-
 	spin_unlock_irq(rq->queue_lock);
 }
 
-- 
2.1.0

