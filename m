From: Dan Carpenter <error27@gmail.com>
Date: Tue, 01 Jun 2010 07:12:53 +0000
Subject: [patch] fscache: remove unneeded null checks
Message-Id: <20100601071253.GG5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Mar 22, 2010 at 12:47:17PM +0000, David Howells wrote:
> radix_tree_gang_lookup_tag() finds pages in the tree that have a
> particular tag set, and returns the number of pages it has selected.
> If that number is != 1, then I don't proceed with accessing the array.
>
> So I think the tests of page later are unnecessary.

Yep.  I think so too.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/fscache/page.c b/fs/fscache/page.c
index 47aefd3..723b889 100644
--- a/fs/fscache/page.c
+++ b/fs/fscache/page.c
@@ -710,30 +710,26 @@ static void fscache_write_op(struct fscache_operation *_op)
 		goto superseded;
 	}
 
-	if (page) {
-		radix_tree_tag_set(&cookie->stores, page->index,
-				   FSCACHE_COOKIE_STORING_TAG);
-		radix_tree_tag_clear(&cookie->stores, page->index,
-				     FSCACHE_COOKIE_PENDING_TAG);
-	}
+	radix_tree_tag_set(&cookie->stores, page->index,
+			   FSCACHE_COOKIE_STORING_TAG);
+	radix_tree_tag_clear(&cookie->stores, page->index,
+			     FSCACHE_COOKIE_PENDING_TAG);
 
 	spin_unlock(&cookie->stores_lock);
 	spin_unlock(&object->lock);
 
-	if (page) {
-		fscache_set_op_state(&op->op, "Store");
-		fscache_stat(&fscache_n_store_pages);
-		fscache_stat(&fscache_n_cop_write_page);
-		ret = object->cache->ops->write_page(op, page);
-		fscache_stat_d(&fscache_n_cop_write_page);
-		fscache_set_op_state(&op->op, "EndWrite");
-		fscache_end_page_write(object, page);
-		if (ret < 0) {
-			fscache_set_op_state(&op->op, "Abort");
-			fscache_abort_object(object);
-		} else {
-			fscache_enqueue_operation(&op->op);
-		}
+	fscache_set_op_state(&op->op, "Store");
+	fscache_stat(&fscache_n_store_pages);
+	fscache_stat(&fscache_n_cop_write_page);
+	ret = object->cache->ops->write_page(op, page);
+	fscache_stat_d(&fscache_n_cop_write_page);
+	fscache_set_op_state(&op->op, "EndWrite");
+	fscache_end_page_write(object, page);
+	if (ret < 0) {
+		fscache_set_op_state(&op->op, "Abort");
+		fscache_abort_object(object);
+	} else {
+		fscache_enqueue_operation(&op->op);
 	}
 
 	_leave("");
