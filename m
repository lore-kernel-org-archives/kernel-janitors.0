From: Colin King <colin.king@canonical.com>
Date: Wed, 10 Feb 2021 20:00:07 +0000
Subject: [PATCH][next] io_uring: remove redundant initialization of variable ret
Message-Id: <20210210200007.149248-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Fixes: b63534c41e20 ("io_uring: re-issue block requests that failed because of resources")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index 909b3169d74e..eff58a967822 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -2785,7 +2785,7 @@ static void io_complete_rw_common(struct kiocb *kiocb, long res,
 static bool io_resubmit_prep(struct io_kiocb *req)
 {
 	struct iovec inline_vecs[UIO_FASTIOV], *iovec = inline_vecs;
-	int rw, ret = -ECANCELED;
+	int rw, ret;
 	struct iov_iter iter;
 
 	/* already prepared */
-- 
2.30.0
