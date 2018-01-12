From: Colin King <colin.king@canonical.com>
Date: Fri, 12 Jan 2018 16:37:15 +0000
Subject: [PATCH][xfs-next] xfs: fix check on struct_version for versions 4 or greater
Message-Id: <20180112163715.27169-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Darrick J . Wong" <darrick.wong@oracle.com>, linux-xfs@vger.kernel.org, Brian Foster <bfoster@redhat.com>, Dave Chinner <dchinner@redhat.com>, Eric Sandeen <sandeen@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

It appears that the check for versions 4 or more is incorrect and is
off-by-one. Fix this.

Detected by CoverityScan, CID#1463775 ("Logically dead code")

Fixes: ac503a4cc9e8 ("xfs: refactor the geometry structure filling function")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/xfs/libxfs/xfs_sb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/libxfs/xfs_sb.c b/fs/xfs/libxfs/xfs_sb.c
index 35b005d66977..869a2f3f0375 100644
--- a/fs/xfs/libxfs/xfs_sb.c
+++ b/fs/xfs/libxfs/xfs_sb.c
@@ -951,7 +951,7 @@ xfs_fs_geometry(
 	geo->rtsectsize = sbp->sb_blocksize;
 	geo->dirblocksize = xfs_dir2_dirblock_bytes(sbp);
 
-	if (struct_version < 3)
+	if (struct_version < 4)
 		return 0;
 
 	if (xfs_sb_version_haslogv2(sbp))
-- 
2.15.1

