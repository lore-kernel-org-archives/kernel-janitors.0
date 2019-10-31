From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 Oct 2019 10:55:47 +0000
Subject: [PATCH] io_uring: signedness bug in io_async_cancel()
Message-Id: <20191031105547.GC26612@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

The problem is that this enum is unsigned, and we do use "ret" for the
enum values, but we also use it for negative error codes.  If it's not
signed then it causes a problem in the error handling.

Fixes: 6ec62e598211 ("io_uring: support for generic async request cancel")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index c4cdfe16cba7..9dcbde233657 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -2144,8 +2144,8 @@ static int io_async_cancel(struct io_kiocb *req, const struct io_uring_sqe *sqe,
 			   struct io_kiocb **nxt)
 {
 	struct io_ring_ctx *ctx = req->ctx;
-	enum io_wq_cancel ret;
 	void *sqe_addr;
+	int ret;
 
 	if (unlikely(ctx->flags & IORING_SETUP_IOPOLL))
 		return -EINVAL;
-- 
2.20.1
