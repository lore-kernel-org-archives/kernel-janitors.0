From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 30 Apr 2017 15:55:32 +0000
Subject: [PATCH] fuse: Use kmalloc_array() in three functions
Message-Id: <2e6f0cd2-2a24-2d1e-9301-7e5238372306@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 30 Apr 2017 17:45:19 +0200

* Multiplications for the size determination of memory allocations
  indicated that array data structures should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data types by pointer dereferences
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/fuse/dev.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index c16d00e53264..685dd467c5f7 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -64,9 +64,9 @@ static struct fuse_req *__fuse_request_alloc(unsigned npages, gfp_t flags)
 			pages = req->inline_pages;
 			page_descs = req->inline_page_descs;
 		} else {
-			pages = kmalloc(sizeof(struct page *) * npages, flags);
-			page_descs = kmalloc(sizeof(struct fuse_page_desc) *
-					     npages, flags);
+			pages = kmalloc_array(npages, sizeof(*pages), flags);
+			page_descs = kmalloc_array(npages, sizeof(*page_descs),
+						   flags);
 		}
 
 		if (!pages || !page_descs) {
@@ -1357,7 +1357,7 @@ static ssize_t fuse_dev_splice_read(struct file *in, loff_t *ppos,
 	if (!fud)
 		return -EPERM;
 
-	bufs = kmalloc(pipe->buffers * sizeof(struct pipe_buffer), GFP_KERNEL);
+	bufs = kmalloc_array(pipe->buffers, sizeof(*bufs), GFP_KERNEL);
 	if (!bufs)
 		return -ENOMEM;
 
@@ -1941,7 +1941,7 @@ static ssize_t fuse_dev_splice_write(struct pipe_inode_info *pipe,
 	if (!fud)
 		return -EPERM;
 
-	bufs = kmalloc(pipe->buffers * sizeof(struct pipe_buffer), GFP_KERNEL);
+	bufs = kmalloc_array(pipe->buffers, sizeof(*bufs), GFP_KERNEL);
 	if (!bufs)
 		return -ENOMEM;
 
-- 
2.12.2

