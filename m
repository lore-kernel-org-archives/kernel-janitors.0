From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 06 Jun 2012 21:41:38 +0000
Subject: [PATCH 4/7] fs/direct-io.c: adjust suspicious bit operation
Message-Id: <1339018901-28439-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1339018901-28439-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1339018901-28439-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, joe@perches.com, Julia Lawall <julia@diku.dk>

From: Julia Lawall <Julia.Lawall@lip6.fr>

READ is 0, so the result of the bit-and operation is 0.  Rewrite with = as
done elsewhere in the same file.

This problem was found using Coccinelle (http://coccinelle.lip6.fr/).

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/direct-io.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/direct-io.c b/fs/direct-io.c
index 0c85fae..1faf4cb 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -1258,7 +1258,7 @@ do_blockdev_direct_IO(int rw, struct kiocb *iocb, struct inode *inode,
 	 */
 	BUG_ON(retval = -EIOCBQUEUED);
 	if (dio->is_async && retval = 0 && dio->result &&
-	    ((rw & READ) || (dio->result = sdio.size)))
+	    ((rw = READ) || (dio->result = sdio.size)))
 		retval = -EIOCBQUEUED;
 
 	if (retval != -EIOCBQUEUED)

