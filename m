From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Apr 2019 06:22:35 +0000
Subject: [PATCH] aio: Fix an error code in __io_submit_one()
Message-Id: <20190403062235.GA1343@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

This accidentally returns the wrong variable.  The "req->ki_eventfd"
pointer is NULL so this return success.

Fixes: 7316b49c2a11 ("aio: move sanity checks and request allocation to io_submit_one()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/aio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/aio.c b/fs/aio.c
index a4cc2a1cccb7..7ccecaab487a 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -1794,7 +1794,7 @@ static int __io_submit_one(struct kioctx *ctx, const struct iocb *iocb,
 		 */
 		eventfd = eventfd_ctx_fdget(iocb->aio_resfd);
 		if (IS_ERR(eventfd))
-			return PTR_ERR(req->ki_eventfd);
+			return PTR_ERR(eventfd);
 
 		req->ki_eventfd = eventfd;
 	}
-- 
2.17.1
