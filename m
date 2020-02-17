From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Feb 2020 14:39:45 +0000
Subject: [PATCH] io_uring: remove unnecessary NULL checks
Message-Id: <20200217143945.ua4lawkg22ggfihr@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "kmsg" pointer can't be NULL and we have already dereferenced it so
a check here would be useless.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/io_uring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index 72bc378edebc..e9f339453ddb 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -3065,7 +3065,7 @@ static int io_sendmsg(struct io_kiocb *req, struct io_kiocb **nxt,
 			if (req->io)
 				return -EAGAIN;
 			if (io_alloc_async_ctx(req)) {
-				if (kmsg && kmsg->iov != kmsg->fast_iov)
+				if (kmsg->iov != kmsg->fast_iov)
 					kfree(kmsg->iov);
 				return -ENOMEM;
 			}
@@ -3219,7 +3219,7 @@ static int io_recvmsg(struct io_kiocb *req, struct io_kiocb **nxt,
 			if (req->io)
 				return -EAGAIN;
 			if (io_alloc_async_ctx(req)) {
-				if (kmsg && kmsg->iov != kmsg->fast_iov)
+				if (kmsg->iov != kmsg->fast_iov)
 					kfree(kmsg->iov);
 				return -ENOMEM;
 			}
-- 
2.11.0
