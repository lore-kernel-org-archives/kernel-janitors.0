From: Colin King <colin.king@canonical.com>
Date: Tue, 27 Mar 2018 14:40:01 +0000
Subject: [PATCH][next] xfs: fix zero'ing of ILOG owner bits by using correct bitwise operator
Message-Id: <20180327144001.14074-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Darrick J . Wong" <darrick.wong@oracle.com>, linux-xfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the masking of the ili_fields is using the ! operator which
results in masking with 0, which clears all the bits which is not
intended.  Instead, use the ~ operator that negates the inverts the
bits to correctly mask out the XFS_ILOG_AOWNER and XFS_ILOG_DOWNER
bits.

Detected by CoverityScan, CID#1466877 ("Logical vs bitwise operator")

Fixes: 3fdf96830762 ("xfs: do not log swapext extent owner changes for deleted")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/xfs/xfs_inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
index a16f48fde4da..3e3aab3888fa 100644
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@ -2477,7 +2477,7 @@ xfs_ifree(
 	ip->i_d.di_aformat = XFS_DINODE_FMT_EXTENTS;
 
 	/* Don't attempt to replay owner changes for a deleted inode */
-	ip->i_itemp->ili_fields &= !(XFS_ILOG_AOWNER|XFS_ILOG_DOWNER);
+	ip->i_itemp->ili_fields &= ~(XFS_ILOG_AOWNER|XFS_ILOG_DOWNER);
 
 	/*
 	 * Bump the generation count so no one will be confused
-- 
2.15.1

