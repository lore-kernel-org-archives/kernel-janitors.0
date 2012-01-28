From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 28 Jan 2012 10:55:01 +0000
Subject: [patch] xfs: remove an unneeded NULL check
Message-Id: <20120128105501.GB25092@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Myers <bpm@sgi.com>
Cc: xfs-masters@oss.sgi.com, Alex Elder <elder@kernel.org>, kernel-janitors@vger.kernel.org, xfs@oss.sgi.com

Smatch complains because we check "commit_lsn" for NULL inconsistently.
fs/xfs/xfs_log_cil.c +705 xfs_log_commit_cil(43) error: we previously
	assumed 'commit_lsn' could be null (see line 688)
xfs_log_commit_cil() is only called from one place, and "commit_lsn" is
a valid pointer, so I've removed the NULL check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/xfs/xfs_log_cil.c b/fs/xfs/xfs_log_cil.c
index d4fadbe..d9c4652 100644
--- a/fs/xfs/xfs_log_cil.c
+++ b/fs/xfs/xfs_log_cil.c
@@ -685,8 +685,7 @@ xfs_log_commit_cil(
 
 	/* lock out background commit */
 	down_read(&log->l_cilp->xc_ctx_lock);
-	if (commit_lsn)
-		*commit_lsn = log->l_cilp->xc_ctx->sequence;
+	*commit_lsn = log->l_cilp->xc_ctx->sequence;
 
 	xlog_cil_insert_items(log, log_vector, tp->t_ticket);
 
