From: Colin King <colin.king@canonical.com>
Date: Thu, 15 Oct 2020 11:55:50 +0000
Subject: [PATCH][next] io_uring: fix flags check for the REQ_F_WORK_INITIALIZED setting
Message-Id: <20201015115550.485235-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the check for REQ_F_WORK_INITIALIZED is always true because
the | operator is being used. I believe this check should be checking
if the bit is set using the & operator.

Addresses-Coverity: ("Wrong operator used")
Fixes: 9c357fed168a ("io_uring: fix REQ_F_COMP_LOCKED by killing it")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index 01d0b35415dc..5ef54df03d7c 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -1813,7 +1813,7 @@ static void __io_fail_links(struct io_kiocb *req)
 		 * but avoid REQ_F_WORK_INITIALIZED because it may deadlock on
 		 * work.fs->lock.
 		 */
-		if (link->flags | REQ_F_WORK_INITIALIZED)
+		if (link->flags & REQ_F_WORK_INITIALIZED)
 			io_put_req_deferred(link, 2);
 		else
 			io_double_put_req(link);
-- 
2.27.0
