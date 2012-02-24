From: Zhengwang Ruan <ruan.zhengwang@gmail.com>
Date: Fri, 24 Feb 2012 11:52:00 +0000
Subject: [PATCH] Staging:android: Silence some compiler warnings
Message-Id: <1330084320-15557-1-git-send-email-ruan.zhengwang@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There are some compiler warnings, this is to silence them.

Signed-off-by: Zhengwang Ruan <ruan.zhengwang@gmail.com>
---
 drivers/staging/android/binder.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/android/binder.c b/drivers/staging/android/binder.c
index f0b7e66..c4e616c 100644
--- a/drivers/staging/android/binder.c
+++ b/drivers/staging/android/binder.c
@@ -104,7 +104,7 @@ static uint32_t binder_debug_mask = BINDER_DEBUG_USER_ERROR |
 module_param_named(debug_mask, binder_debug_mask, uint, S_IWUSR | S_IRUGO);
 
 static int binder_debug_no_lock;
-module_param_named(proc_no_lock, binder_debug_no_lock, bool, S_IWUSR | S_IRUGO);
+module_param_named(proc_no_lock, binder_debug_no_lock, int, S_IWUSR | S_IRUGO);
 
 static DECLARE_WAIT_QUEUE_HEAD(binder_user_error_wait);
 static int binder_stop_on_user_error;
@@ -716,8 +716,8 @@ static struct binder_buffer *binder_alloc_buf(struct binder_proc *proc,
 					      size_t offsets_size, int is_async)
 {
 	struct rb_node *n = proc->free_buffers.rb_node;
-	struct binder_buffer *buffer;
-	size_t buffer_size;
+	struct binder_buffer *buffer = NULL;
+	size_t buffer_size = 0;
 	struct rb_node *best_fit = NULL;
 	void *has_page_addr;
 	void *end_page_addr;
-- 
1.6.0.4

