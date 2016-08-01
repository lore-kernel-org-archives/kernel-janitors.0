From: John Pittman <jpittman@redhat.com>
Date: Mon, 01 Aug 2016 20:35:53 +0000
Subject: [PATCH] Include: blkdev: Removed duplicate 'struct request;' declaration.
Message-Id: <1470083753-31585-1-git-send-email-jpittman@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: axboe@fb.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, John Pittman <jpittman@redhat.com>

In include/linux/blkdev.h duplicate declarations of the request
struct exist.  Cleaned up by removing the second, unneeded
declaration.

Signed-off-by: John Pittman <jpittman@redhat.com>
---
 include/linux/blkdev.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index adf3307..de79359 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -47,7 +47,6 @@ struct pr_ops;
  */
 #define BLKCG_MAX_POLS		2
 
-struct request;
 typedef void (rq_end_io_fn)(struct request *, int);
 
 #define BLK_RL_SYNCFULL		(1U << 0)
-- 
2.5.5

