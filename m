From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Jul 2020 18:47:11 +0000
Subject: [PATCH] io_uring: fix a use after free in io_async_task_func()
Message-Id: <20200708184711.GA31157@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>, linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, kernel-janitors@vger.kernel.org

The "apoll" variable is freed and then used on the next line.  We need
to move the free down a few lines.

Fixes: 0be0b0e33b0b ("io_uring: simplify io_async_task_func()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/io_uring.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index 70828e2470e2..f2993070a9e8 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -4652,12 +4652,13 @@ static void io_async_task_func(struct callback_head *cb)
 	/* restore ->work in case we need to retry again */
 	if (req->flags & REQ_F_WORK_INITIALIZED)
 		memcpy(&req->work, &apoll->work, sizeof(req->work));
-	kfree(apoll);
 
 	if (!READ_ONCE(apoll->poll.canceled))
 		__io_req_task_submit(req);
 	else
 		__io_req_task_cancel(req, -ECANCELED);
+
+	kfree(apoll);
 }
 
 static int io_async_wake(struct wait_queue_entry *wait, unsigned mode, int sync,
-- 
2.27.0
