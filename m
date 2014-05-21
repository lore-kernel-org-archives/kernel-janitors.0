From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 May 2014 12:27:46 +0000
Subject: [patch] [XFS] indent an if statement
Message-Id: <20140521122746.GD23396@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Chinner <david@fromorbit.com>
Cc: kernel-janitors@vger.kernel.org, xfs@oss.sgi.com

The "n += 32;" goes with the if statement on the line before so it
should be indented.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/xfs/xfs_bit.h b/fs/xfs/xfs_bit.h
index f1e3c90..f685942 100644
--- a/fs/xfs/xfs_bit.h
+++ b/fs/xfs/xfs_bit.h
@@ -67,7 +67,7 @@ static inline int xfs_lowbit64(__uint64_t v)
 	} else {	/* upper bits */
 		w = (__uint32_t)(v >> 32);
 		if (w && (n = ffs(w)))
-		n += 32;
+			n += 32;
 	}
 	return n - 1;
 }
