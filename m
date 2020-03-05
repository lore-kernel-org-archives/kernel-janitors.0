From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Mar 2020 20:05:44 +0000
Subject: [PATCH] io_uring: Fix error handling in __io_compat_recvmsg_copy_hdr()
Message-Id: <20200305200544.5wmrfo7hbfybp3w5@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to check if __get_compat_msghdr() fails and return immediately
on error.  Also if compat_import_iovec() fails then we should return a
negative error code, but the current behavior is to just return
success.

Fixes: ede6c476b57d ("io_uring: add IOSQE_BUFFER_SELECT support for IORING_OP_RECVMSG")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/io_uring.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index d7c42bd04c78..c1a59cde2d88 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -3684,6 +3684,8 @@ static int __io_compat_recvmsg_copy_hdr(struct io_kiocb *req,
 	msg_compat = (struct compat_msghdr __user *) sr->msg;
 	ret = __get_compat_msghdr(&io->msg.msg, msg_compat, &io->msg.uaddr,
 					&ptr, &len);
+	if (ret)
+		return ret;
 
 	uiov = compat_ptr(ptr);
 	if (req->flags & REQ_F_BUFFER_SELECT) {
@@ -3703,8 +3705,8 @@ static int __io_compat_recvmsg_copy_hdr(struct io_kiocb *req,
 		ret = compat_import_iovec(READ, uiov, len, UIO_FASTIOV,
 						&io->msg.iov,
 						&io->msg.msg.msg_iter);
-		if (ret > 0)
-			ret = 0;
+		if (ret < 0)
+			return ret;
 	}
 
 	return 0;
-- 
2.11.0
