From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Fri, 24 Feb 2012 07:20:42 +0000
Subject: [PATCH] xfs: Use memset to initialize structure member.
Message-Id: <1330067322-17011-1-git-send-email-santoshprasadnayak@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bpm@sgi.com
Cc: Santosh Nayak <santoshprasadnayak@gmail.com>, elder@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, xfs@oss.sgi.com, xfs-masters@oss.sgi.com

From: Santosh Nayak <santoshprasadnayak@gmail.com>

Sparse is giving following warning:
fs/xfs/xfs_bmap.c:4826:41: warning: Using plain integer as NULL pointer.

To avoid this warning, use memset to initialize the structure member.

Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
---
 fs/xfs/xfs_bmap.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/fs/xfs/xfs_bmap.c b/fs/xfs/xfs_bmap.c
index 188ef2f..030e93f 100644
--- a/fs/xfs/xfs_bmap.c
+++ b/fs/xfs/xfs_bmap.c
@@ -4823,7 +4823,7 @@ xfs_bmapi_write(
 {
 	struct xfs_mount	*mp = ip->i_mount;
 	struct xfs_ifork	*ifp;
-	struct xfs_bmalloca	bma = { 0 };	/* args for xfs_bmap_alloc */
+	struct xfs_bmalloca	bma;		/* args for xfs_bmap_alloc */
 	xfs_fileoff_t		end;		/* end of mapped file region */
 	int			eof;		/* after the end of extents */
 	int			error;		/* error return */
@@ -4852,6 +4852,8 @@ xfs_bmapi_write(
 	ASSERT(!(flags & XFS_BMAPI_IGSTATE));
 	ASSERT(tp != NULL);
 	ASSERT(len > 0);
+
+	memset(&bma, 0, sizeof(bma));
 
 	whichfork = (flags & XFS_BMAPI_ATTRFORK) ?
 		XFS_ATTR_FORK : XFS_DATA_FORK;
-- 
1.7.4.4

