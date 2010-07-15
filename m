From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 15 Jul 2010 18:46:45 +0000
Subject: [PATCH 6/8] xfs: fix unsigned underflow
Message-Id: <1279219605-12631-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Alex Elder <aelder@sgi.com>, Felix Blyakher <felixb@sgi.com>, linux-kernel@vger.kernel.org, xfs@oss.sgi.com, xfs-masters@oss.sgi.com, Dave Chinner <dchinner@redhat.com>, Christoph Hellwig <hch@lst.de>

map_len is unsigned. Checking map_len <= 0 is buggy when it should be
below zero. So, check exact expression instead of map_len.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 fs/xfs/xfs_vnodeops.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/xfs/xfs_vnodeops.c b/fs/xfs/xfs_vnodeops.c
index 65e0879..66d585c 100644
--- a/fs/xfs/xfs_vnodeops.c
+++ b/fs/xfs/xfs_vnodeops.c
@@ -591,9 +591,9 @@ xfs_free_eofblocks(
 	 */
 	end_fsb = XFS_B_TO_FSB(mp, ((xfs_ufsize_t)ip->i_size));
 	last_fsb = XFS_B_TO_FSB(mp, (xfs_ufsize_t)XFS_MAXIOFFSET(mp));
-	map_len = last_fsb - end_fsb;
-	if (map_len <= 0)
+	if (last_fsb <= end_fsb)
 		return 0;
+	map_len = last_fsb - end_fsb;
 
 	nimaps = 1;
 	xfs_ilock(ip, XFS_ILOCK_SHARED);
-- 
1.7.0.4

