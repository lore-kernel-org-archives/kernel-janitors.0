From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 19:37:49 +0000
Subject: [PATCH 18/20] Staging: lustre: ptlrpc: lproc_ptlrpc: remove unneeded null test before free
Message-Id: <1430509086-22132-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Kfree can cope with a null argument, so drop null tests.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression ptr; @@

- if (ptr != NULL)
  kfree(ptr);
// </smpl>

In the first case, the only cleanup needed is the unlock, so jump to that
directly.

Likewise, in the first two failure cases of ptlrpc_lprocfs_nrs_seq_write,
no cleanup is needed, so just drop the goto and return directly.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c |   26 ++++++--------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c b/drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c
index 1391784..aeceef5 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c
@@ -510,7 +510,7 @@ static int ptlrpc_lprocfs_nrs_seq_show(struct seq_file *m, void *n)
 	infos = kcalloc(num_pols, sizeof(*infos), GFP_NOFS);
 	if (infos = NULL) {
 		rc = -ENOMEM;
-		goto out;
+		goto unlock;
 	}
 again:
 
@@ -617,10 +617,8 @@ again:
 		goto again;
 	}
 
-out:
-	if (infos)
-		kfree(infos);
-
+	kfree(infos);
+unlock:
 	mutex_unlock(&nrs_core.nrs_mutex);
 
 	return rc;
@@ -650,16 +648,12 @@ static ssize_t ptlrpc_lprocfs_nrs_seq_write(struct file *file,
 	char			       *token;
 	int				rc = 0;
 
-	if (count >= LPROCFS_NRS_WR_MAX_CMD) {
-		rc = -EINVAL;
-		goto out;
-	}
+	if (count >= LPROCFS_NRS_WR_MAX_CMD)
+		return -EINVAL;
 
 	cmd = kzalloc(LPROCFS_NRS_WR_MAX_CMD, GFP_NOFS);
-	if (cmd = NULL) {
-		rc = -ENOMEM;
-		goto out;
-	}
+	if (cmd = NULL)
+		return -ENOMEM;
 	/**
 	 * strsep() modifies its argument, so keep a copy
 	 */
@@ -716,8 +710,7 @@ default_queue:
 
 	mutex_unlock(&nrs_core.nrs_mutex);
 out:
-	if (cmd_copy)
-		kfree(cmd_copy);
+	kfree(cmd_copy);
 
 	return rc < 0 ? rc : count;
 }
@@ -860,8 +853,7 @@ ptlrpc_lprocfs_svc_req_history_stop(struct seq_file *s, void *iter)
 {
 	struct ptlrpc_srh_iterator *srhi = iter;
 
-	if (srhi != NULL)
-		kfree(srhi);
+	kfree(srhi);
 }
 
 static void *

