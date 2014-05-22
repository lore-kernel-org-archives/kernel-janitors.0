From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 May 2014 14:04:05 +0000
Subject: [patch v2] [XFS] small cleanup in xfs_lowbit64()
Message-Id: <20140522140405.GA27116@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20140521142909.GA22281@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Chinner <david@fromorbit.com>
Cc: kernel-janitors@vger.kernel.org, xfs@oss.sgi.com

There are two checkpatch.pl complaints here because of the bad indenting
and because of the assignment inside the condition.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: more cleanups

diff --git a/fs/xfs/xfs_bit.h b/fs/xfs/xfs_bit.h
index f1e3c90..e1649c0 100644
--- a/fs/xfs/xfs_bit.h
+++ b/fs/xfs/xfs_bit.h
@@ -66,8 +66,11 @@ static inline int xfs_lowbit64(__uint64_t v)
 		n = ffs(w);
 	} else {	/* upper bits */
 		w = (__uint32_t)(v >> 32);
-		if (w && (n = ffs(w)))
-		n += 32;
+		if (w) {
+			n = ffs(w);
+			if (n)
+				n += 32;
+		}
 	}
 	return n - 1;
 }
