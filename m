From: Julia Lawall <julia@diku.dk>
Date: Mon, 16 Aug 2010 16:27:14 +0000
Subject: [PATCH 9/16] fs/fscache: Remove unnecessary error code assignment
Message-Id: <Pine.LNX.4.64.1008161826580.19313@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In each case, the value of ret is not used.  If an error occurs, -ENOBUFS
is returned explicitly.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
local idexpression x;
constant C;
@@

if (...) { ...
  x = -C
  ... when != x
(
  return <+...x...+>;
|
  return NULL;
|
  return;
|
* return ...;
)
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/fscache/page.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/fscache/page.c b/fs/fscache/page.c
index 41c441c..33538ed 100644
--- a/fs/fscache/page.c
+++ b/fs/fscache/page.c
@@ -784,7 +784,6 @@ int __fscache_write_page(struct fscache_cookie *cookie,
 	if (ret < 0)
 		goto nomem_free;
 
-	ret = -ENOBUFS;
 	spin_lock(&cookie->lock);
 
 	if (hlist_empty(&cookie->backing_objects))
@@ -854,7 +853,6 @@ submit_failed:
 	radix_tree_delete(&cookie->stores, page->index);
 	spin_unlock(&cookie->stores_lock);
 	page_cache_release(page);
-	ret = -ENOBUFS;
 	goto nobufs;
 
 nobufs_unlock_obj:
