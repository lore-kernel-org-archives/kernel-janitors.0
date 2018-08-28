From: Colin King <colin.king@canonical.com>
Date: Tue, 28 Aug 2018 14:19:07 +0000
Subject: [PATCH] ocfs2: remove unused pointer 'eb'
Message-Id: <20180828141907.10826-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@oss.oracle.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer 'eb' is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'eb' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ocfs2/alloc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/ocfs2/alloc.c b/fs/ocfs2/alloc.c
index a342f008e42f..d1cbb27808e2 100644
--- a/fs/ocfs2/alloc.c
+++ b/fs/ocfs2/alloc.c
@@ -5106,8 +5106,6 @@ int ocfs2_split_extent(handle_t *handle,
 	 * rightmost extent list.
 	 */
 	if (path->p_tree_depth) {
-		struct ocfs2_extent_block *eb;
-
 		ret = ocfs2_read_extent_block(et->et_ci,
 					      ocfs2_et_get_last_eb_blk(et),
 					      &last_eb_bh);
@@ -5115,8 +5113,6 @@ int ocfs2_split_extent(handle_t *handle,
 			mlog_errno(ret);
 			goto out;
 		}
-
-		eb = (struct ocfs2_extent_block *) last_eb_bh->b_data;
 	}
 
 	if (rec->e_cpos = split_rec->e_cpos &&
-- 
2.17.1
