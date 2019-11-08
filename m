From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Nov 2019 05:11:22 +0000
Subject: [PATCH] xfs: remove a stray tab in xfs_remount_rw()
Message-Id: <20191108051121.GA26279@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Darrick J. Wong" <darrick.wong@oracle.com>, Ian Kent <raven@themaw.net>
Cc: linux-xfs@vger.kernel.org, kernel-janitors@vger.kernel.org

The extra tab makes the code slightly confusing.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/xfs/xfs_super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index b3188ea49413..ede6fac47c56 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -1599,7 +1599,7 @@ xfs_remount_rw(
 	if (error) {
 		xfs_err(mp,
 			"Error %d recovering leftover CoW allocations.", error);
-			xfs_force_shutdown(mp, SHUTDOWN_CORRUPT_INCORE);
+		xfs_force_shutdown(mp, SHUTDOWN_CORRUPT_INCORE);
 		return error;
 	}
 	xfs_start_block_reaping(mp);
-- 
2.20.1
