From: Zhengwang Ruan <ruan.zhengwang@gmail.com>
Date: Mon, 27 Feb 2012 08:39:45 +0000
Subject: [PATCH] Initialise buffer and buffer_size before used
Message-Id: <1330331985-20767-2-git-send-email-ruan.zhengwang@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

GCC warns 'buffer' and 'buffer_size' are used with being uninitialized, and
'buffer' is used as returned value, and 'buffer_size' is initialized using
uninitialized_var to clear warning.

Signed-off-by: Zhengwang Ruan <ruan.zhengwang@gmail.com>
---
 drivers/staging/android/binder.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/android/binder.c b/drivers/staging/android/binder.c
index 4350425..6caebeb 100644
--- a/drivers/staging/android/binder.c
+++ b/drivers/staging/android/binder.c
@@ -716,8 +716,8 @@ static struct binder_buffer *binder_alloc_buf(struct binder_proc *proc,
 					      size_t offsets_size, int is_async)
 {
 	struct rb_node *n = proc->free_buffers.rb_node;
-	struct binder_buffer *buffer;
-	size_t buffer_size;
+	struct binder_buffer *buffer = NULL;
+	size_t uninitialized_var(buffer_size);
 	struct rb_node *best_fit = NULL;
 	void *has_page_addr;
 	void *end_page_addr;
-- 
1.6.0.4

