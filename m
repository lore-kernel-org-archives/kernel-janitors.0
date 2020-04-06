From: Colin King <colin.king@canonical.com>
Date: Mon, 06 Apr 2020 22:54:39 +0000
Subject: [PATCH] io_uring: remove redundant variable pointer nxt and io_wq_assign_next call
Message-Id: <20200406225439.654486-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An earlier commit "io_uring: remove @nxt from handlers" removed the
setting of pointer nxt and now it is always null, hence the non-null
check and call to io_wq_assign_next is redundant and can be removed.

Addresses-Coverity: ("'Constant' variable guard")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/io_uring.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index 14efcf0a3070..b594fa0bd210 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -3509,14 +3509,11 @@ static void __io_sync_file_range(struct io_kiocb *req)
 static void io_sync_file_range_finish(struct io_wq_work **workptr)
 {
 	struct io_kiocb *req = container_of(*workptr, struct io_kiocb, work);
-	struct io_kiocb *nxt = NULL;
 
 	if (io_req_cancelled(req))
 		return;
 	__io_sync_file_range(req);
 	io_put_req(req); /* put submission ref */
-	if (nxt)
-		io_wq_assign_next(workptr, nxt);
 }
 
 static int io_sync_file_range(struct io_kiocb *req, bool force_nonblock)
-- 
2.25.1
