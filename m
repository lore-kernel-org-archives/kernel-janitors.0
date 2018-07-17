From: Colin King <colin.king@canonical.com>
Date: Tue, 17 Jul 2018 14:42:53 +0000
Subject: [PATCH] orangefs: remove redundant pointer orangefs_inode
Message-Id: <20180717144253.29039-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer orangefs_inode is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'orangefs_inode' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/orangefs/inode.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index 6e4d2af8f5bc..31932879b716 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -251,7 +251,6 @@ int orangefs_getattr(const struct path *path, struct kstat *stat,
 {
 	int ret = -ENOENT;
 	struct inode *inode = path->dentry->d_inode;
-	struct orangefs_inode_s *orangefs_inode = NULL;
 
 	gossip_debug(GOSSIP_INODE_DEBUG,
 		     "orangefs_getattr: called on %pd\n",
@@ -262,8 +261,6 @@ int orangefs_getattr(const struct path *path, struct kstat *stat,
 		generic_fillattr(inode, stat);
 
 		/* override block size reported to stat */
-		orangefs_inode = ORANGEFS_I(inode);
-
 		if (request_mask & STATX_SIZE)
 			stat->result_mask = STATX_BASIC_STATS;
 		else
-- 
2.17.1

