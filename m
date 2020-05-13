From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 May 2020 09:48:03 +0000
Subject: [PATCH] xfs: fix error code in xfs_iflush_cluster()
Message-Id: <20200513094803.GF347693@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Darrick J. Wong" <darrick.wong@oracle.com>, Brian Foster <bfoster@redhat.com>
Cc: linux-xfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Originally this function used to always return -EFSCORRUPTED on error
but now we're trying to return more informative error codes.
Unfortunately, there was one error path missed.  If this kmem_alloc()
allocation fails then we need to return -ENOMEM instead of success.

Fixes: f20192991d79 ("xfs: simplify inode flush error handling")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/xfs/xfs_inode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
index ab31a5dec7aab..63aeda7cbafb0 100644
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@ -3505,8 +3505,10 @@ xfs_iflush_cluster(
 
 	cilist_size = igeo->inodes_per_cluster * sizeof(struct xfs_inode *);
 	cilist = kmem_alloc(cilist_size, KM_MAYFAIL|KM_NOFS);
-	if (!cilist)
+	if (!cilist) {
+		error = -ENOMEM;
 		goto out_put;
+	}
 
 	mask = ~(igeo->inodes_per_cluster - 1);
 	first_index = XFS_INO_TO_AGINO(mp, ip->i_ino) & mask;
-- 
2.26.2
