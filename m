From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 11 Oct 2015 10:42:26 +0000
Subject: [PATCH] xfs: constify sysfs_ops structures
Message-Id: <1444560146-22737-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Chinner <david@fromorbit.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, xfs@oss.sgi.com

These sysfs_ops structures are never modified.  All other sysfs_ops
structures in the kernel are declared as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/xfs/xfs_sysfs.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/xfs/xfs_sysfs.c b/fs/xfs/xfs_sysfs.c
index aa03670..192c865 100644
--- a/fs/xfs/xfs_sysfs.c
+++ b/fs/xfs/xfs_sysfs.c
@@ -112,7 +112,7 @@ xfs_dbg_store(
 	return xfs_attr->store ? xfs_attr->store(buf, count, NULL) : 0;
 }
 
-static struct sysfs_ops xfs_dbg_ops = {
+static const struct sysfs_ops xfs_dbg_ops = {
 	.show = xfs_dbg_show,
 	.store = xfs_dbg_store,
 };
@@ -227,7 +227,7 @@ xfs_log_store(
 	return xfs_attr->store ? xfs_attr->store(buf, count, log) : 0;
 }
 
-static struct sysfs_ops xfs_log_ops = {
+static const struct sysfs_ops xfs_log_ops = {
 	.show = xfs_log_show,
 	.store = xfs_log_store,
 };

