From: Bojan Prtvar <prtvar.b@gmail.com>
Date: Sun, 01 Sep 2013 20:18:44 +0000
Subject: [PATCH] Staging: android: Mark local functions in binder.c as static
Message-Id: <1378066724-6340-1-git-send-email-prtvar.b@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This fixes the following sparse warnings
drivers/staging/android/binder.c:1703:5: warning: symbol 'binder_thread_write' was not declared. Should it be static?
drivers/staging/android/binder.c:2058:6: warning: symbol 'binder_stat_br' was not declared. Should it be static?

Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
---
 drivers/staging/android/binder.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/android/binder.c b/drivers/staging/android/binder.c
index 98ac020..82b5861 100644
--- a/drivers/staging/android/binder.c
+++ b/drivers/staging/android/binder.c
@@ -1700,7 +1700,8 @@ err_no_context_mgr_node:
 		thread->return_error = return_error;
 }
 
-int binder_thread_write(struct binder_proc *proc, struct binder_thread *thread,
+static int binder_thread_write(struct binder_proc *proc,
+			struct binder_thread *thread,
 			void __user *buffer, size_t size, size_t *consumed)
 {
 	uint32_t cmd;
@@ -2055,7 +2056,8 @@ int binder_thread_write(struct binder_proc *proc, struct binder_thread *thread,
 	return 0;
 }
 
-void binder_stat_br(struct binder_proc *proc, struct binder_thread *thread,
+static void binder_stat_br(struct binder_proc *proc,
+			struct binder_thread *thread,
 		    uint32_t cmd)
 {
 	trace_binder_return(cmd);
-- 
1.7.1

