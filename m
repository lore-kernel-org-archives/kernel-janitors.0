From: Leonardo Potenza <lpotenza@inwind.it>
Date: Sun, 11 May 2008 17:08:43 +0000
Subject: [PATCH 2/2] fs/ocfs2/dlm: compilation warning fix
Message-Id: <200805111908.43488.lpotenza@inwind.it>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: mfasheh@suse.com, joel.becker@oracle.com, linux-kernel@vger.kernel.org

From: Leonardo Potenza <lpotenza@inwind.it>

Removed the warning messages:
fs/ocfs2/dlm/dlmdebug.h:64: warning: 'dlm_debug_init' defined but not used
fs/ocfs2/dlm/dlmdebug.h:68: warning: 'dlm_debug_shutdown' defined but not used
fs/ocfs2/dlm/dlmdebug.h:71: warning: 'dlm_create_debugfs_subroot' defined but not used
fs/ocfs2/dlm/dlmdebug.h:75: warning: 'dlm_destroy_debugfs_subroot' defined but not used
fs/ocfs2/dlm/dlmdebug.h:78: warning: 'dlm_create_debugfs_root' defined but not used
fs/ocfs2/dlm/dlmdebug.h:82: warning: 'dlm_destroy_debugfs_root' defined but not used

If not in debug build (CONFIG_DEBUG_FS), the definition of those functions
has been moved from 'dlmdebug.h' to 'dlmdebug.c'.

Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>
---

 dlmdebug.c |   30 ++++++++++++++++++++++++++++++
 dlmdebug.h |   27 ---------------------------
 2 files changed, 30 insertions(+), 27 deletions(-)

Index: linux-2.6/fs/ocfs2/dlm/dlmdebug.c
=================================--- linux-2.6.orig/fs/ocfs2/dlm/dlmdebug.c
+++ linux-2.6/fs/ocfs2/dlm/dlmdebug.c
@@ -1034,4 +1034,34 @@ void dlm_destroy_debugfs_root(void)
 	if (dlm_debugfs_root)
 		debugfs_remove(dlm_debugfs_root);
 }
+
+#else
+
+int dlm_debug_init(struct dlm_ctxt *dlm)
+{
+	return 0;
+}
+
+void dlm_debug_shutdown(struct dlm_ctxt *dlm)
+{
+}
+
+int dlm_create_debugfs_subroot(struct dlm_ctxt *dlm)
+{
+	return 0;
+}
+
+void dlm_destroy_debugfs_subroot(struct dlm_ctxt *dlm)
+{
+}
+
+int dlm_create_debugfs_root(void)
+{
+	return 0;
+}
+
+void dlm_destroy_debugfs_root(void)
+{
+}
+
 #endif	/* CONFIG_DEBUG_FS */
Index: linux-2.6/fs/ocfs2/dlm/dlmdebug.h
=================================--- linux-2.6.orig/fs/ocfs2/dlm/dlmdebug.h
+++ linux-2.6/fs/ocfs2/dlm/dlmdebug.h
@@ -27,8 +27,6 @@
 
 void dlm_print_one_mle(struct dlm_master_list_entry *mle);
 
-#ifdef CONFIG_DEBUG_FS
-
 struct dlm_debug_ctxt {
 	struct kref debug_refcnt;
 	struct dentry *debug_state_dentry;
@@ -58,29 +56,4 @@ void dlm_destroy_debugfs_subroot(struct 
 int dlm_create_debugfs_root(void);
 void dlm_destroy_debugfs_root(void);
 
-#else
-
-static int dlm_debug_init(struct dlm_ctxt *dlm)
-{
-	return 0;
-}
-static void dlm_debug_shutdown(struct dlm_ctxt *dlm)
-{
-}
-static int dlm_create_debugfs_subroot(struct dlm_ctxt *dlm)
-{
-	return 0;
-}
-static void dlm_destroy_debugfs_subroot(struct dlm_ctxt *dlm)
-{
-}
-static int dlm_create_debugfs_root(void)
-{
-	return 0;
-}
-static void dlm_destroy_debugfs_root(void)
-{
-}
-
-#endif	/* CONFIG_DEBUG_FS */
 #endif	/* DLMDEBUG_H */
