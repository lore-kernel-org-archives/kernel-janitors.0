From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 Jan 2016 09:02:03 +0000
Subject: [PATCH] staging/lustre/llite: constify export_operations structures
Message-Id: <1451638923-6644-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, lustre-devel@lists.lustre.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

This export_operations structure is never modified, so declare it as const.
Most other structures of this type are already const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/llite/llite_internal.h |    2 +-
 drivers/staging/lustre/lustre/llite/llite_nfs.c      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/lustre/lustre/llite/llite_internal.h b/drivers/staging/lustre/lustre/llite/llite_internal.h
index ee8a1d6..67f0832 100644
--- a/drivers/staging/lustre/lustre/llite/llite_internal.h
+++ b/drivers/staging/lustre/lustre/llite/llite_internal.h
@@ -798,7 +798,7 @@ char *ll_get_fsname(struct super_block *sb, char *buf, int buflen);
 void ll_open_cleanup(struct super_block *sb, struct ptlrpc_request *open_req);
 
 /* llite/llite_nfs.c */
-extern struct export_operations lustre_export_operations;
+extern const struct export_operations lustre_export_operations;
 __u32 get_uuid2int(const char *name, int len);
 void get_uuid2fsid(const char *name, int len, __kernel_fsid_t *fsid);
 struct inode *search_inode_for_lustre(struct super_block *sb,
diff --git a/drivers/staging/lustre/lustre/llite/llite_nfs.c b/drivers/staging/lustre/lustre/llite/llite_nfs.c
index e578a11..2de2964 100644
--- a/drivers/staging/lustre/lustre/llite/llite_nfs.c
+++ b/drivers/staging/lustre/lustre/llite/llite_nfs.c
@@ -323,7 +323,7 @@ static struct dentry *ll_get_parent(struct dentry *dchild)
 	return result;
 }
 
-struct export_operations lustre_export_operations = {
+const struct export_operations lustre_export_operations = {
        .get_parent = ll_get_parent,
        .encode_fh  = ll_encode_fh,
        .get_name   = ll_get_name,

