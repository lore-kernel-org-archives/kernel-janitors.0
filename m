From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 06 Sep 2018 01:47:23 +0000
Subject: [PATCH -next] ocfs2: remove set but not used variable 'rb'
Message-Id: <1536198443-113047-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>
Cc: YueHaibing <yuehaibing@huawei.com>, ocfs2-devel@oss.oracle.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

fs/ocfs2/refcounttree.c: In function 'ocfs2_create_reflink_node':
fs/ocfs2/refcounttree.c:4138:31: warning:
 variable 'rb' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/ocfs2/refcounttree.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/ocfs2/refcounttree.c b/fs/ocfs2/refcounttree.c
index 7a5ee14..1114ef0 100644
--- a/fs/ocfs2/refcounttree.c
+++ b/fs/ocfs2/refcounttree.c
@@ -4135,7 +4135,6 @@ static int ocfs2_create_reflink_node(struct inode *s_inode,
 	struct buffer_head *ref_root_bh = NULL;
 	struct ocfs2_cached_dealloc_ctxt dealloc;
 	struct ocfs2_super *osb = OCFS2_SB(s_inode->i_sb);
-	struct ocfs2_refcount_block *rb;
 	struct ocfs2_dinode *di = (struct ocfs2_dinode *)s_bh->b_data;
 	struct ocfs2_refcount_tree *ref_tree;
 
@@ -4162,7 +4161,6 @@ static int ocfs2_create_reflink_node(struct inode *s_inode,
 		mlog_errno(ret);
 		goto out;
 	}
-	rb = (struct ocfs2_refcount_block *)ref_root_bh->b_data;
 
 	ret = ocfs2_duplicate_extent_list(s_inode, t_inode, t_bh,
 					  &ref_tree->rf_ci, ref_root_bh,
