From: Emil Goode <emilgoode@gmail.com>
Date: Mon, 23 Apr 2012 17:23:44 +0000
Subject: [PATCH] staging: android: binder: fix some sparse warnings and long lines
Message-Id: <1335201824-17879-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch silences some sparse warnings and adds some line breaks
to take the 80 char limit coding style rule in consideration.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/staging/android/binder.c |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/android/binder.c b/drivers/staging/android/binder.c
index c283212..5d31417 100644
--- a/drivers/staging/android/binder.c
+++ b/drivers/staging/android/binder.c
@@ -1600,15 +1600,21 @@ static void binder_transaction(struct binder_proc *proc,
 		case BINDER_TYPE_BINDER:
 		case BINDER_TYPE_WEAK_BINDER: {
 			struct binder_ref *ref;
-			struct binder_node *node = binder_get_node(proc, fp->binder);
+			struct binder_node *node = binder_get_node(proc, 
+						     (void __user *)fp->binder);
 			if (node = NULL) {
-				node = binder_new_node(proc, fp->binder, fp->cookie);
+				node = binder_new_node(proc, 
+						(void __user *)fp->binder, 
+						(void __user *)fp->cookie);
 				if (node = NULL) {
 					return_error = BR_FAILED_REPLY;
 					goto err_binder_new_node_failed;
 				}
-				node->min_priority = fp->flags & FLAT_BINDER_FLAG_PRIORITY_MASK;
-				node->accept_fds = !!(fp->flags & FLAT_BINDER_FLAG_ACCEPTS_FDS);
+				node->min_priority = fp->flags & 
+						FLAT_BINDER_FLAG_PRIORITY_MASK;
+				
+				node->accept_fds = !!(fp->flags & 
+						FLAT_BINDER_FLAG_ACCEPTS_FDS);
 			}
 			if (fp->cookie != node->cookie) {
 				binder_user_error("binder: %d:%d sending u%p "
-- 
1.7.9.5

