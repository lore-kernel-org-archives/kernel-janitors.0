From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Nov 2019 06:22:16 +0000
Subject: [PATCH] io-wq: remove extra space characters
Message-Id: <20191119062216.qhxmnrt2rdioirja@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

These lines are indented an extra space character.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
We often see this where the lines after a comment are indented one
space extra.  I don't know if it's an editor thing maybe?

 fs/io-wq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/io-wq.c b/fs/io-wq.c
index fcb6c74209da..6d8f5e6c8167 100644
--- a/fs/io-wq.c
+++ b/fs/io-wq.c
@@ -333,9 +333,9 @@ static void __io_worker_busy(struct io_wqe *wqe, struct io_worker *worker,
 	 * If worker is moving from bound to unbound (or vice versa), then
 	 * ensure we update the running accounting.
 	 */
-	 worker_bound = (worker->flags & IO_WORKER_F_BOUND) != 0;
-	 work_bound = (work->flags & IO_WQ_WORK_UNBOUND) = 0;
-	 if (worker_bound != work_bound) {
+	worker_bound = (worker->flags & IO_WORKER_F_BOUND) != 0;
+	work_bound = (work->flags & IO_WQ_WORK_UNBOUND) = 0;
+	if (worker_bound != work_bound) {
 		io_wqe_dec_running(wqe, worker);
 		if (work_bound) {
 			worker->flags |= IO_WORKER_F_BOUND;
-- 
2.11.0
