From: Colin King <colin.king@canonical.com>
Date: Sun, 05 May 2019 22:01:22 +0000
Subject: [PATCH] io_uring: fix shadowed variable ret return code being not checked
Message-Id: <20190505220122.5024-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently variable ret is declared in a while-loop code block that
shadows another variable ret. When an error occurs in the while-loop
the error return in ret is not being set in the outer code block and
so the error check on ret is always going to be checking on the wrong
ret variable resulting in check that is always going to be true and
a premature return occurs.

Fix this by removing the declaration of the inner while-loop variable
ret so that shadowing does not occur.

Addresses-Coverity: ("'Constant' variable guards dead code")
Fixes: 6b06314c47e1 ("io_uring: add file set registration")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/io_uring.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index 452e35357865..50f965060ef1 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -2363,7 +2363,6 @@ static int io_sqe_files_scm(struct io_ring_ctx *ctx)
 	left = ctx->nr_user_files;
 	while (left) {
 		unsigned this_files = min_t(unsigned, left, SCM_MAX_FD);
-		int ret;
 
 		ret = __io_sqe_files_scm(ctx, this_files, total);
 		if (ret)
-- 
2.20.1
