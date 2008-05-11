From: Leonardo Potenza <lpotenza@inwind.it>
Date: Sun, 11 May 2008 17:08:05 +0000
Subject: [PATCH 1/2] fs/ocfs2/cluster: compilation warning fix
Message-Id: <200805111908.06046.lpotenza@inwind.it>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: mfasheh@suse.com, joel.becker@oracle.com, linux-kernel@vger.kernel.org

From: Leonardo Potenza <lpotenza@inwind.it>

Removed the warning messages:
fs/ocfs2/cluster/tcp.h:132: warning: 'o2net_debugfs_init' defined but not used
fs/ocfs2/cluster/tcp.h:136: warning: 'o2net_debugfs_exit' defined but not used
fs/ocfs2/cluster/tcp.h:139: warning: 'o2net_debug_add_nst' defined but not used
fs/ocfs2/cluster/tcp.h:142: warning: 'o2net_debug_del_nst' defined but not used
fs/ocfs2/cluster/tcp.h:145: warning: 'o2net_debug_add_sc' defined but not used
fs/ocfs2/cluster/tcp.h:148: warning: 'o2net_debug_del_sc' defined but not used

If not in debug build (CONFIG_DEBUG_FS), the definition of those functions
has been moved from 'tcp.h' to 'netdebug.c'.

Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>
---

 netdebug.c |   31 +++++++++++++++++++++++++++++--
 tcp.h      |   22 ----------------------
 2 files changed, 29 insertions(+), 24 deletions(-)

Index: linux-2.6/fs/ocfs2/cluster/netdebug.c
=================================--- linux-2.6.orig/fs/ocfs2/cluster/netdebug.c
+++ linux-2.6/fs/ocfs2/cluster/netdebug.c
@@ -24,8 +24,6 @@
  *
  */
 
-#ifdef CONFIG_DEBUG_FS
-
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/slab.h>
@@ -43,6 +41,8 @@
 
 #include "tcp_internal.h"
 
+#ifdef CONFIG_DEBUG_FS
+
 #define O2NET_DEBUG_DIR		"o2net"
 #define SC_DEBUG_NAME		"sock_containers"
 #define NST_DEBUG_NAME		"send_tracking"
@@ -438,4 +438,31 @@ void o2net_debugfs_exit(void)
 		debugfs_remove(o2net_dentry);
 }
 
+#else
+
+int o2net_debugfs_init(void)
+{
+	return 0;
+}
+
+void o2net_debugfs_exit(void)
+{
+}
+
+void o2net_debug_add_nst(struct o2net_send_tracking *nst)
+{
+}
+
+void o2net_debug_del_nst(struct o2net_send_tracking *nst)
+{
+}
+
+void o2net_debug_add_sc(struct o2net_sock_container *sc)
+{
+}
+
+void o2net_debug_del_sc(struct o2net_sock_container *sc)
+{
+}
+
 #endif	/* CONFIG_DEBUG_FS */
Index: linux-2.6/fs/ocfs2/cluster/tcp.h
=================================--- linux-2.6.orig/fs/ocfs2/cluster/tcp.h
+++ linux-2.6/fs/ocfs2/cluster/tcp.h
@@ -120,33 +120,11 @@ void o2net_exit(void);
 struct o2net_send_tracking;
 struct o2net_sock_container;
 
-#ifdef CONFIG_DEBUG_FS
 int o2net_debugfs_init(void);
 void o2net_debugfs_exit(void);
 void o2net_debug_add_nst(struct o2net_send_tracking *nst);
 void o2net_debug_del_nst(struct o2net_send_tracking *nst);
 void o2net_debug_add_sc(struct o2net_sock_container *sc);
 void o2net_debug_del_sc(struct o2net_sock_container *sc);
-#else
-static int o2net_debugfs_init(void)
-{
-	return 0;
-}
-static void o2net_debugfs_exit(void)
-{
-}
-static void o2net_debug_add_nst(struct o2net_send_tracking *nst)
-{
-}
-static void o2net_debug_del_nst(struct o2net_send_tracking *nst)
-{
-}
-static void o2net_debug_add_sc(struct o2net_sock_container *sc)
-{
-}
-static void o2net_debug_del_sc(struct o2net_sock_container *sc)
-{
-}
-#endif	/* CONFIG_DEBUG_FS */
 
 #endif /* O2CLUSTER_TCP_H */
