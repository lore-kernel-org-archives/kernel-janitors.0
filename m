From: Colin King <colin.king@canonical.com>
Date: Tue, 05 May 2020 09:33:43 +0000
Subject: [PATCH]i[next] io_uring: remove redundant check on force_nonblock
Message-Id: <20200505093343.41869-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check on force_nonblock is redundant as this is performed
several statements earlier and also returns with -EAGAIN. Remove
the redundant check.

Addresses-Coverity: ("Logicall dead code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index e5dfbbd2aa34..4b1efb062f7f 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -2782,7 +2782,7 @@ static int io_splice(struct io_kiocb *req, bool force_nonblock)
 	poff_in = (sp->off_in = -1) ? NULL : &sp->off_in;
 	poff_out = (sp->off_out = -1) ? NULL : &sp->off_out;
 	ret = do_splice(in, poff_in, out, poff_out, sp->len, flags);
-	if (force_nonblock && ret = -EAGAIN)
+	if (ret = -EAGAIN)
 		return -EAGAIN;
 
 	io_put_file(req, in, (sp->flags & SPLICE_F_FD_IN_FIXED));
-- 
2.25.1
