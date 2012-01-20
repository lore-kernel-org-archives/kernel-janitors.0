From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Jan 2012 07:56:43 +0000
Subject: [patch] Btrfs: use gfp_t to silence a sparse warning
Message-Id: <20120120075643.GC2295@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@oracle.com>, Arne Jansen <sensille@gmx.net>
Cc: linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

These should be gfp_t or Sparse complains:
fs/btrfs/ulist.c:100:55: warning:
	incorrect type in argument 2 (different base types)

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/btrfs/ulist.c b/fs/btrfs/ulist.c
index 12f5147..5d1b047 100644
--- a/fs/btrfs/ulist.c
+++ b/fs/btrfs/ulist.c
@@ -95,7 +95,7 @@ EXPORT_SYMBOL(ulist_reinit);
  *
  * The allocated ulist will be returned in an initialized state.
  */
-struct ulist *ulist_alloc(unsigned long gfp_mask)
+struct ulist *ulist_alloc(gfp_t gfp_mask)
 {
 	struct ulist *ulist = kmalloc(sizeof(*ulist), gfp_mask);
 
@@ -143,8 +143,7 @@ EXPORT_SYMBOL(ulist_free);
  * In case of allocation failure -ENOMEM is returned and the ulist stays
  * unaltered.
  */
-int ulist_add(struct ulist *ulist, u64 val, unsigned long aux,
-	      unsigned long gfp_mask)
+int ulist_add(struct ulist *ulist, u64 val, unsigned long aux, gfp_t gfp_mask)
 {
 	int i;
 
