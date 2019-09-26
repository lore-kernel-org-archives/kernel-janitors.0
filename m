From: Colin King <colin.king@canonical.com>
Date: Thu, 26 Sep 2019 09:50:12 +0000
Subject: [PATCH][next] io_uring: ensure variable ret is initialized to zero
Message-Id: <20190926095012.31826-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where sig is NULL the error variable ret is not initialized
and may contain a garbage value on the final checks to see if ret is
-ERESTARTSYS.  Best to initialize ret to zero before the do loop to
ensure the ret does not accidentially contain -ERESTARTSYS before the
loop.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: dd671c79e40b ("io_uring: make CQ ring wakeups be more efficient")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/io_uring.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index 7b5710e3a18c..aa8ac557493c 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -2835,6 +2835,7 @@ static int io_cqring_wait(struct io_ring_ctx *ctx, int min_events,
 			return ret;
 	}
 
+	ret = 0;
 	iowq.nr_timeouts = atomic_read(&ctx->cq_timeouts);
 	do {
 		prepare_to_wait_exclusive(&ctx->wait, &iowq.wq,
-- 
2.20.1
