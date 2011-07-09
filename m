From: Julia Lawall <julia@diku.dk>
Date: Sat, 09 Jul 2011 19:23:26 +0000
Subject: [PATCH] drivers/staging/hv/blkvsc_drv.c: eliminate NULL pointer dereference
Message-Id: <1310239406-9592-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hank Janssen <hjanssen@microsoft.com>
Cc: kernel-janitors@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, Greg Kroah-Hartman <gregkh@suse.de>, "K. Y. Srinivasan" <kys@microsoft.com>, Abhishek Kane <v-abkane@microsoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In this code, blkvsc_req is allocated in the cache blkdev->request_pool,
but freed in the first case to the cache blkvsc_req->dev->request_pool.
blkvsc_req->dev is subsequently initialized to blkdev, making these the
same at the second call to kmem_cache_free.  But at the point of the first
call, blkvsc_req->dev is NULL.  The second call is changed too, for
uniformity.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,e,e1,e2,e3;
@@

x = \(kmem_cache_alloc\|kmem_cache_zalloc\)(e1,e2)
... when != x = e
(
kmem_cache_free(e1,x);
|
?-kmem_cache_free(e3,x);
+kmem_cache_free(e1,x);
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/hv/blkvsc_drv.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/staging/hv/blkvsc_drv.c b/drivers/staging/hv/blkvsc_drv.c
--- a/drivers/staging/hv/blkvsc_drv.c
+++ b/drivers/staging/hv/blkvsc_drv.c
@@ -325,7 +325,7 @@ static int blkvsc_do_operation(struct bl
 
 	page_buf = alloc_page(GFP_KERNEL);
 	if (!page_buf) {
-		kmem_cache_free(blkvsc_req->dev->request_pool, blkvsc_req);
+		kmem_cache_free(blkdev->request_pool, blkvsc_req);
 		return -ENOMEM;
 	}
 
@@ -422,7 +422,7 @@ cleanup:
 
 	__free_page(page_buf);
 
-	kmem_cache_free(blkvsc_req->dev->request_pool, blkvsc_req);
+	kmem_cache_free(blkdev->request_pool, blkvsc_req);
 
 	return ret;
 }

