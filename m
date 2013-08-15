From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Aug 2013 05:53:38 +0000
Subject: [patch] xfs: check for underflow in xfs_iformat_fork()
Message-Id: <20130815055338.GC23580@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Myers <bpm@sgi.com>
Cc: Alex Elder <elder@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, xfs@oss.sgi.com

The "di_size" variable comes from the disk and it's a signed 64 bit.
We check the upper limit but we should check for negative numbers as
well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/xfs/xfs_inode_fork.c b/fs/xfs/xfs_inode_fork.c
index 123971b..849fc70 100644
--- a/fs/xfs/xfs_inode_fork.c
+++ b/fs/xfs/xfs_inode_fork.c
@@ -167,7 +167,8 @@ xfs_iformat_fork(
 			}
 
 			di_size = be64_to_cpu(dip->di_size);
-			if (unlikely(di_size > XFS_DFORK_DSIZE(dip, ip->i_mount))) {
+			if (unlikely(di_size < 0 ||
+				     di_size > XFS_DFORK_DSIZE(dip, ip->i_mount))) {
 				xfs_warn(ip->i_mount,
 			"corrupt inode %Lu (bad size %Ld for local inode).",
 					(unsigned long long) ip->i_ino,
