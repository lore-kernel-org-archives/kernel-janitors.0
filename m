From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Jun 2015 09:23:31 +0000
Subject: [patch] Staging: Lustre: lproc_fid: remove some dead code
Message-Id: <20150605092331.GB24871@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We know "rc = 0" so there is no need to check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/lustre/lustre/fid/lproc_fid.c b/drivers/staging/lustre/lustre/fid/lproc_fid.c
index 41ab2ee..cc2201c 100644
--- a/drivers/staging/lustre/lustre/fid/lproc_fid.c
+++ b/drivers/staging/lustre/lustre/fid/lproc_fid.c
@@ -157,10 +157,8 @@ ldebugfs_fid_width_seq_write(struct file *file,
 	if (val <= max && val > 0) {
 		seq->lcs_width = val;
 
-		if (rc = 0) {
-			CDEBUG(D_INFO, "%s: Sequence size: %llu\n",
-			       seq->lcs_name, seq->lcs_width);
-		}
+		CDEBUG(D_INFO, "%s: Sequence size: %llu\n", seq->lcs_name,
+		       seq->lcs_width);
 	}
 
 	mutex_unlock(&seq->lcs_mutex);
