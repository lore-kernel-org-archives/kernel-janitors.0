From: Bojan Prtvar <prtvar.b@gmail.com>
Date: Mon, 02 Sep 2013 06:18:40 +0000
Subject: [PATCH v2] Staging: android: Mark local functions in binder.c as static
Message-Id: <1378102720-4200-1-git-send-email-prtvar.b@gmail.com>
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
 v2: Fixed indentig as suggested by Dan Carpenter.

 drivers/staging/android/binder.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/android/binder.c b/drivers/staging/android/binder.c
index 98ac020..bb7c816 100644
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
@@ -2055,8 +2056,8 @@ int binder_thread_write(struct binder_proc *proc, struct binder_thread *thread,
 	return 0;
 }
 
-void binder_stat_br(struct binder_proc *proc, struct binder_thread *thread,
-		    uint32_t cmd)
+static void binder_stat_br(struct binder_proc *proc,
+			   struct binder_thread *thread, uint32_t cmd)
 {
 	trace_binder_return(cmd);
 	if (_IOC_NR(cmd) < ARRAY_SIZE(binder_stats.br)) {
-- 
1.7.1

