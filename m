From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 19 Jul 2012 08:02:28 +0000
Subject: [patch] ntfs: remove an unneeded NULL check
Message-Id: <20120719080228.GA13792@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Altaparmakov <anton@tuxera.com>
Cc: linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "ctx" variable can never be NULL here and also we dereference it
on the previous line.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 7389d2d..4db19f7 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -309,8 +309,7 @@ do_non_resident_extend:
 done:
 	flush_dcache_mft_record_page(ctx->ntfs_ino);
 	mark_mft_record_dirty(ctx->ntfs_ino);
-	if (ctx)
-		ntfs_attr_put_search_ctx(ctx);
+	ntfs_attr_put_search_ctx(ctx);
 	if (m)
 		unmap_mft_record(base_ni);
 	ntfs_debug("Done, initialized_size 0x%llx, i_size 0x%llx.",
