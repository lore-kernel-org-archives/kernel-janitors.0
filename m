From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 May 2013 07:53:30 +0000
Subject: [patch] xfs: bug widening binary "not" operation
Message-Id: <20130516075330.GB7494@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Myers <bpm@sgi.com>
Cc: Alex Elder <elder@kernel.org>, kernel-janitors@vger.kernel.org, xfs@oss.sgi.com

The problem here is:

	ioffset = offset & ~(rounding - 1);

"offset" and "ioffset" are type xfs_off_t (__s64) and "rounding" is
unsigned int.  The "offset & ~(rounding - 1)" clears the high 32 bits
and which is unintentional.

This is a static checker fix so I'm not sure how much difference this
makes in real life.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/xfs/xfs_vnodeops.c b/fs/xfs/xfs_vnodeops.c
index 1501f4f..9f557c6 100644
--- a/fs/xfs/xfs_vnodeops.c
+++ b/fs/xfs/xfs_vnodeops.c
@@ -1453,7 +1453,7 @@ xfs_free_file_space(
 	xfs_mount_t		*mp;
 	int			nimap;
 	uint			resblks;
-	uint			rounding;
+	xfs_off_t		rounding;
 	int			rt;
 	xfs_fileoff_t		startoffset_fsb;
 	xfs_trans_t		*tp;
