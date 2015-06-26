From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 26 Jun 2015 21:23:29 +0000
Subject: [PATCH] staging: lustre: Deletion of unnecessary checks before three function calls
Message-Id: <558DC2D1.7030408@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oleg Drokin <oleg.drokin@intel.com>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 26 Jun 2015 23:10:42 +0200

The following functions test whether their argument is NULL and then
return immediately.
* kfree
* ll_file_data_put
* ptlrpc_connection_put

Thus the test around such calls is not needed.

This issue was detected by using the Coccinelle software.


See also a previous update suggestion:
"remove unneeded null test before free" by Julia Lawall
https://lkml.org/lkml/2015/5/1/498
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg878600.html

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/lustre/lustre/llite/file.c      | 3 +--
 drivers/staging/lustre/lustre/llite/llite_lib.c | 2 +-
 drivers/staging/lustre/lustre/ptlrpc/import.c   | 6 ++----
 drivers/staging/lustre/lustre/ptlrpc/service.c  | 4 +---
 4 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/lustre/lustre/llite/file.c b/drivers/staging/lustre/lustre/llite/file.c
index 3075db2..1a85c41 100644
--- a/drivers/staging/lustre/lustre/llite/file.c
+++ b/drivers/staging/lustre/lustre/llite/file.c
@@ -702,8 +702,7 @@ out_och_free:
 out_openerr:
 		if (opendir_set != 0)
 			ll_stop_statahead(inode, lli->lli_opendir_key);
-		if (fd != NULL)
-			ll_file_data_put(fd);
+		ll_file_data_put(fd);
 	} else {
 		ll_stats_ops_tally(ll_i2sbi(inode), LPROC_LL_OPEN, 1);
 	}
diff --git a/drivers/staging/lustre/lustre/llite/llite_lib.c b/drivers/staging/lustre/lustre/llite/llite_lib.c
index 2513988..ab4839c 100644
--- a/drivers/staging/lustre/lustre/llite/llite_lib.c
+++ b/drivers/staging/lustre/lustre/llite/llite_lib.c
@@ -1114,7 +1114,7 @@ void ll_clear_inode(struct inode *inode)
 	if (lli->lli_mds_read_och)
 		ll_md_real_close(inode, FMODE_READ);
 
-	if (S_ISLNK(inode->i_mode) && lli->lli_symlink_name) {
+	if (S_ISLNK(inode->i_mode)) {
 		kfree(lli->lli_symlink_name);
 		lli->lli_symlink_name = NULL;
 	}
diff --git a/drivers/staging/lustre/lustre/ptlrpc/import.c b/drivers/staging/lustre/lustre/ptlrpc/import.c
index c9b8481..1eae389 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/import.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/import.c
@@ -555,14 +555,12 @@ static int import_select_connection(struct obd_import *imp)
 	imp_conn->oic_last_attempt = cfs_time_current_64();
 
 	/* switch connection, don't mind if it's same as the current one */
-	if (imp->imp_connection)
-		ptlrpc_connection_put(imp->imp_connection);
+	ptlrpc_connection_put(imp->imp_connection);
 	imp->imp_connection = ptlrpc_connection_addref(imp_conn->oic_conn);
 
 	dlmexp = class_conn2export(&imp->imp_dlm_handle);
 	LASSERT(dlmexp != NULL);
-	if (dlmexp->exp_connection)
-		ptlrpc_connection_put(dlmexp->exp_connection);
+	ptlrpc_connection_put(dlmexp->exp_connection);
 	dlmexp->exp_connection = ptlrpc_connection_addref(imp_conn->oic_conn);
 	class_export_put(dlmexp);
 
diff --git a/drivers/staging/lustre/lustre/ptlrpc/service.c b/drivers/staging/lustre/lustre/ptlrpc/service.c
index 9117f1c..b9ae0b7 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/service.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/service.c
@@ -2826,9 +2826,7 @@ void ptlrpc_hr_fini(void)
 	ptlrpc_stop_hr_threads();
 
 	cfs_percpt_for_each(hrp, i, ptlrpc_hr.hr_partitions) {
-		if (hrp->hrp_thrs != NULL) {
-			kfree(hrp->hrp_thrs);
-		}
+		kfree(hrp->hrp_thrs);
 	}
 
 	cfs_percpt_free(ptlrpc_hr.hr_partitions);
-- 
2.4.4

