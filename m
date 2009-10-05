From: Pete <greg.petr@gmail.com>
Date: Mon, 05 Oct 2009 18:17:15 +0000
Subject: [PATCH 1/1, revised] fs: added KERN-DEBUG flag to dprintk macro
Message-Id: <1254765915.5279.77.camel@linux-k65f.site>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, trivial@kernel.org
Cc: Matthew Wilcox <matthew@wil.cx>, Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org

Signed-off-by: Greg Petr <greg.petr@gmail.com>

Hi, 

The following is a trivial patch which adds KERN_DEBUG flag to the
dprintk macro. Made this a more generalized version. 


--- linux-2.6/fs/aio.c	2009-10-05 14:46:11.000000000 +0530
+++ linux-2.6.test/fs/aio.c	2009-10-05 23:30:26.000000000 +0530
@@ -37,7 +37,7 @@
 #include <asm/uaccess.h>
 
 #if DEBUG > 1
-#define dprintk		printk
+#define dprintk(x...)		printk(KERN_DEBUG x)
 #else
 #define dprintk(x...)	do { ; } while (0)
 #endif
@@ -530,7 +530,7 @@ static void aio_fput_routine(struct work
  */
 static int __aio_put_req(struct kioctx *ctx, struct kiocb *req)
 {
-	dprintk(KERN_DEBUG "aio_put(%p): f_count=%ld\n",
+	dprintk("aio_put(%p): f_count=%ld\n",
 		req, atomic_long_read(&req->ki_filp->f_count));
 
 	assert_spin_locked(&ctx->ctx_lock);


