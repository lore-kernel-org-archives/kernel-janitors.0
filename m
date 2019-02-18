From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 18 Feb 2019 08:42:32 +0000
Subject: [PATCH -next] floppy: remove set but not used variable 'q'
Message-Id: <20190218084232.193878-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/block/floppy.c: In function 'request_done':
drivers/block/floppy.c:2233:24: warning:
 variable 'q' set but not used [-Wunused-but-set-variable]

It's never used and can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/block/floppy.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index 55481b40df9a..95f608d1a098 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -2230,7 +2230,6 @@ static void floppy_end_request(struct request *req, blk_status_t error)
 static void request_done(int uptodate)
 {
 	struct request *req = current_req;
-	struct request_queue *q;
 	int block;
 	char msg[sizeof("request done ") + sizeof(int) * 3];
 
@@ -2243,8 +2242,6 @@ static void request_done(int uptodate)
 		return;
 	}
 
-	q = req->q;
-
 	if (uptodate) {
 		/* maintain values for invalidation on geometry
 		 * change */
