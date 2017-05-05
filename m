From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 May 2017 05:30:40 +0000
Subject: [PATCH] CIFS: Set ->should_dirty in cifs_user_readv()
Message-Id: <20170505053040.x67a5f4riyba2wqb@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Pavel Shilovsky <pshilov-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>
Cc: linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The current code causes a static checker warning because ITER_IOVEC is
zero so the condition is never true.

Fixes: 6685c5e2d1ac ("CIFS: Add asynchronous read support through kernel AIO")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I'm assuming this is the correct fix from looking at how ITER_IOVEC is
normally used.  Please review.

diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index 6ef78ad838e6..71ba8fa63c41 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -3271,7 +3271,7 @@ ssize_t cifs_user_readv(struct kiocb *iocb, struct iov_iter *to)
 	if (!is_sync_kiocb(iocb))
 		ctx->iocb = iocb;
 
-	if (to->type & ITER_IOVEC)
+	if (to->type = ITER_IOVEC)
 		ctx->should_dirty = true;
 
 	rc = setup_aio_ctx_iter(ctx, to, READ);
