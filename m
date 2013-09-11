From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Sep 2013 21:17:31 +0000
Subject: [patch] xfs: = vs == typo in ASSERT()
Message-Id: <20130911211731.GA10527@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130911020725.GE2445@devil.localdomain>
In-Reply-To: <20130911020725.GE2445@devil.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Myers <bpm@sgi.com>, Dave Chinner <dchinner@redhat.com>
Cc: Alex Elder <elder@kernel.org>, kernel-janitors@vger.kernel.org, xfs@oss.sgi.com

There is a '=' vs '=' typo so the ASSERT()s are always true.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Introduced in 21b5c9784b ('xfs: swap extents operations for CRC
filesystems')

diff --git a/fs/xfs/xfs_bmap_btree.c b/fs/xfs/xfs_bmap_btree.c
index 531b020..bb8de8e 100644
--- a/fs/xfs/xfs_bmap_btree.c
+++ b/fs/xfs/xfs_bmap_btree.c
@@ -957,9 +957,9 @@ xfs_bmbt_change_owner(
 	ASSERT(tp || buffer_list);
 	ASSERT(!(tp && buffer_list));
 	if (whichfork = XFS_DATA_FORK)
-		ASSERT(ip->i_d.di_format = XFS_DINODE_FMT_BTREE);
+		ASSERT(ip->i_d.di_format = XFS_DINODE_FMT_BTREE);
 	else
-		ASSERT(ip->i_d.di_aformat = XFS_DINODE_FMT_BTREE);
+		ASSERT(ip->i_d.di_aformat = XFS_DINODE_FMT_BTREE);
 
 	cur = xfs_bmbt_init_cursor(ip->i_mount, tp, ip, whichfork);
 	if (!cur)
