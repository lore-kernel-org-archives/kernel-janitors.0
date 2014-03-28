From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Mar 2014 08:03:13 +0000
Subject: [patch] xfs: extra semi-colon breaks a condition
Message-Id: <20140328080313.GA25192@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Chinner <david@fromorbit.com>
Cc: kernel-janitors@vger.kernel.org, xfs@oss.sgi.com

There were some extra semi-colons here which mean that we return true
unintentionally.

Fixes: a49935f200e2 ('xfs: xfs_check_page_type buffer checks need help')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
index 98016b3..75df77d 100644
--- a/fs/xfs/xfs_aops.c
+++ b/fs/xfs/xfs_aops.c
@@ -659,10 +659,10 @@ xfs_check_page_type(
 			if (type = XFS_IO_UNWRITTEN)
 				return true;
 		} else if (buffer_delay(bh)) {
-			if (type = XFS_IO_DELALLOC);
+			if (type = XFS_IO_DELALLOC)
 				return true;
 		} else if (buffer_dirty(bh) && buffer_mapped(bh)) {
-			if (type = XFS_IO_OVERWRITE);
+			if (type = XFS_IO_OVERWRITE)
 				return true;
 		}
 
