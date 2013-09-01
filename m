From: Bojan Prtvar <prtvar.b@gmail.com>
Date: Sun, 01 Sep 2013 18:30:38 +0000
Subject: [PATCH] Staging: android: add __user annotation in binder.c
Message-Id: <1378060238-26297-1-git-send-email-prtvar.b@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This fixes the following sparse error
drivers/staging/android/binder.c:1795:36: error: incompatible types in comparison expression (different address spaces)

Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
---
 drivers/staging/android/binder.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/android/binder.c b/drivers/staging/android/binder.c
index 98ac020..19e6ba6 100644
--- a/drivers/staging/android/binder.c
+++ b/drivers/staging/android/binder.c
@@ -1773,7 +1773,7 @@ int binder_thread_write(struct binder_proc *proc, struct binder_thread *thread,
 		case BC_INCREFS_DONE:
 		case BC_ACQUIRE_DONE: {
 			void __user *node_ptr;
-			void *cookie;
+			void __user *cookie;
 			struct binder_node *node;
 
 			if (get_user(node_ptr, (void * __user *)ptr))
-- 
1.7.1

