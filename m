From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Oct 2015 18:19:51 +0000
Subject: [patch] xfs: fix an error code in xfs_fs_fill_super()
Message-Id: <20151015181951.GD3163@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Chinner <david@fromorbit.com>, Bill O'Donnell <billodo@redhat.com>
Cc: kernel-janitors@vger.kernel.org, xfs@oss.sgi.com

If alloc_percpu() fails, we accidentally return PTR_ERR(NULL), which
means success, but we intended to return -ENOMEM.

Fixes: 225e4635580c ('xfs: per-filesystem stats in sysfs')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 368c55a..b2c252c 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -1477,7 +1477,7 @@ xfs_fs_fill_super(
 	/* Allocate stats memory before we do operations that might use it */
 	mp->m_stats.xs_stats = alloc_percpu(struct xfsstats);
 	if (!mp->m_stats.xs_stats) {
-		error = PTR_ERR(mp->m_stats.xs_stats);
+		error = -ENOMEM;
 		goto out_destroy_counters;
 	}
 
