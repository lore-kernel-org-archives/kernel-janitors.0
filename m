From: Emil Goode <emilgoode@gmail.com>
Date: Sat, 27 Jul 2013 18:40:11 +0000
Subject: [PATCH 1/2] staging: lustre: Fix non-ANSI sparse warnings
Message-Id: <1374950412-15973-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch fixes a lot of non-ANSI sparse warnings.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 .../lustre/lnet/klnds/socklnd/socklnd_lib-linux.c        |    6 +++---
 drivers/staging/lustre/lnet/lnet/api-ni.c                |    2 +-
 drivers/staging/lustre/lnet/selftest/console.c           |    2 +-
 .../staging/lustre/lustre/libcfs/linux/linux-tracefile.c |   14 +++++++-------
 drivers/staging/lustre/lustre/ptlrpc/pack_generic.c      |    2 +-
 drivers/staging/lustre/lustre/ptlrpc/pinger.c            |    4 ++--
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.c b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.c
index 3e08fe2..76e442b 100644
--- a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.c
+++ b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.c
@@ -325,20 +325,20 @@ ksocknal_lib_tunables_init ()
 }
 
 void
-ksocknal_lib_tunables_fini ()
+ksocknal_lib_tunables_fini(void)
 {
 	if (ksocknal_tunables.ksnd_sysctl != NULL)
 		unregister_sysctl_table(ksocknal_tunables.ksnd_sysctl);
 }
 #else
 int
-ksocknal_lib_tunables_init ()
+ksocknal_lib_tunables_init(void)
 {
 	return 0;
 }
 
 void
-ksocknal_lib_tunables_fini ()
+ksocknal_lib_tunables_fini(void)
 {
 }
 #endif /* # if CONFIG_SYSCTL && !CFS_SYSFS_MODULE_PARM */
diff --git a/drivers/staging/lustre/lnet/lnet/api-ni.c b/drivers/staging/lustre/lnet/lnet/api-ni.c
index 250c618..160a429 100644
--- a/drivers/staging/lustre/lnet/lnet/api-ni.c
+++ b/drivers/staging/lustre/lnet/lnet/api-ni.c
@@ -1371,7 +1371,7 @@ EXPORT_SYMBOL(LNetNIInit);
  * \return always 0 for current implementation.
  */
 int
-LNetNIFini()
+LNetNIFini(void)
 {
 	LNET_MUTEX_LOCK(&the_lnet.ln_api_mutex);
 
diff --git a/drivers/staging/lustre/lnet/selftest/console.c b/drivers/staging/lustre/lnet/selftest/console.c
index 78e8d04..09e4700 100644
--- a/drivers/staging/lustre/lnet/selftest/console.c
+++ b/drivers/staging/lustre/lnet/selftest/console.c
@@ -1773,7 +1773,7 @@ lstcon_session_info(lst_sid_t *sid_up, int *key_up, unsigned *featp,
 }
 
 int
-lstcon_session_end()
+lstcon_session_end(void)
 {
 	lstcon_rpc_trans_t *trans;
 	lstcon_group_t     *grp;
diff --git a/drivers/staging/lustre/lustre/libcfs/linux/linux-tracefile.c b/drivers/staging/lustre/lustre/libcfs/linux/linux-tracefile.c
index a500a0b..162beee 100644
--- a/drivers/staging/lustre/lustre/libcfs/linux/linux-tracefile.c
+++ b/drivers/staging/lustre/lustre/libcfs/linux/linux-tracefile.c
@@ -51,7 +51,7 @@ char *cfs_trace_console_buffers[NR_CPUS][CFS_TCD_TYPE_MAX];
 
 struct rw_semaphore cfs_tracefile_sem;
 
-int cfs_tracefile_init_arch()
+int cfs_tracefile_init_arch(void)
 {
 	int    i;
 	int    j;
@@ -96,7 +96,7 @@ out:
 	return -ENOMEM;
 }
 
-void cfs_tracefile_fini_arch()
+void cfs_tracefile_fini_arch(void)
 {
 	int    i;
 	int    j;
@@ -116,27 +116,27 @@ void cfs_tracefile_fini_arch()
 	fini_rwsem(&cfs_tracefile_sem);
 }
 
-void cfs_tracefile_read_lock()
+void cfs_tracefile_read_lock(void)
 {
 	down_read(&cfs_tracefile_sem);
 }
 
-void cfs_tracefile_read_unlock()
+void cfs_tracefile_read_unlock(void)
 {
 	up_read(&cfs_tracefile_sem);
 }
 
-void cfs_tracefile_write_lock()
+void cfs_tracefile_write_lock(void)
 {
 	down_write(&cfs_tracefile_sem);
 }
 
-void cfs_tracefile_write_unlock()
+void cfs_tracefile_write_unlock(void)
 {
 	up_write(&cfs_tracefile_sem);
 }
 
-cfs_trace_buf_type_t cfs_trace_buf_idx_get()
+cfs_trace_buf_type_t cfs_trace_buf_idx_get(void)
 {
 	if (in_irq())
 		return CFS_TCD_TYPE_IRQ;
diff --git a/drivers/staging/lustre/lustre/ptlrpc/pack_generic.c b/drivers/staging/lustre/lustre/ptlrpc/pack_generic.c
index ffff648..9c20d0c 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/pack_generic.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/pack_generic.c
@@ -115,7 +115,7 @@ int lustre_msg_check_version(struct lustre_msg *msg, __u32 version)
 EXPORT_SYMBOL(lustre_msg_check_version);
 
 /* early reply size */
-int lustre_msg_early_size()
+int lustre_msg_early_size(void)
 {
 	static int size = 0;
 	if (!size) {
diff --git a/drivers/staging/lustre/lustre/ptlrpc/pinger.c b/drivers/staging/lustre/lustre/ptlrpc/pinger.c
index f521251..79e7d08 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/pinger.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/pinger.c
@@ -51,7 +51,7 @@ struct mutex pinger_mutex;
 static LIST_HEAD(pinger_imports);
 static struct list_head timeout_list = LIST_HEAD_INIT(timeout_list);
 
-int ptlrpc_pinger_suppress_pings()
+int ptlrpc_pinger_suppress_pings(void)
 {
 	return suppress_pings;
 }
@@ -608,7 +608,7 @@ int ptlrpc_pinger_remove_timeouts(void)
 	return 0;
 }
 
-void ptlrpc_pinger_wake_up()
+void ptlrpc_pinger_wake_up(void)
 {
 	thread_add_flags(&pinger_thread, SVC_EVENT);
 	wake_up(&pinger_thread.t_ctl_waitq);
-- 
1.7.10.4

