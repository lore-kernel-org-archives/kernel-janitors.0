From: Shaun Zinck <shaun.zinck@gmail.com>
Date: Thu, 30 Aug 2007 03:49:44 +0000
Subject: [PATCH] fs: Use DIV_ROUND_UP where possible
Message-Id: <20070829224944.58f2934a@shaun>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This replaces code that does the same as DIV_ROUND_UP, defined in kernel.h,
to use the macro. 

Signed-off-by: Shaun Zinck <shaun.zinck@gmail.com>
---
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 2980eab..8e0051d 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -286,7 +286,7 @@ blkdev_direct_IO(int rw, struct kiocb *iocb, const struct iovec *iov,
 
 	while (nbytes) {
 		/* roughly estimate number of bio vec needed */
-		nvec = (nbytes + PAGE_SIZE - 1) / PAGE_SIZE;
+		nvec = DIV_ROUND_UP(nbytes, PAGE_SIZE);
 		nvec = max(nvec, nr_segs - seg);
 		nvec = min(nvec, (unsigned long) BIO_MAX_PAGES);
 
diff --git a/fs/direct-io.c b/fs/direct-io.c
index 901dc55..55735a5 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -984,9 +984,8 @@ direct_io_worker(int rw, struct kiocb *iocb, struct inode *inode,
 
 	for (seg = 0; seg < nr_segs; seg++) {
 		user_addr = (unsigned long)iov[seg].iov_base;
-		dio->pages_in_io +-			((user_addr+iov[seg].iov_len +PAGE_SIZE-1)/PAGE_SIZE
-				- user_addr/PAGE_SIZE);
+		dio->pages_in_io += DIV_ROUND_UP(user_addr+iov[seg].iov_len, PAGE_SIZE)
+			- user_addr/PAGE_SIZE;
 	}
 
 	for (seg = 0; seg < nr_segs; seg++) {
@@ -1007,7 +1006,7 @@ direct_io_worker(int rw, struct kiocb *iocb, struct inode *inode,
 			dio->total_pages++;
 			bytes -= PAGE_SIZE - (user_addr & (PAGE_SIZE - 1));
 		}
-		dio->total_pages += (bytes + PAGE_SIZE - 1) / PAGE_SIZE;
+		dio->total_pages += DIV_ROUND_UP(bytes, PAGE_SIZE);
 		dio->curr_user_address = user_addr;
 	
 		ret = do_direct_IO(dio);
