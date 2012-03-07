From: Zhengwang Ruan <ruan.zhengwang@gmail.com>
Date: Wed, 07 Mar 2012 02:36:58 +0000
Subject: [PATCH 2/2 v2] Staging:android: Initialise buffer and buffer_size before used
Message-Id: <1331087818-9942-2-git-send-email-ruan.zhengwang@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331087818-9942-1-git-send-email-ruan.zhengwang@gmail.com>
In-Reply-To: <1331087818-9942-1-git-send-email-ruan.zhengwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, arve@android.com, chris+android@zenthought.org
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

GCC warns 'buffer' and 'buffer_size' are used with being uninitialized, and
'buffer' is used as returned value, and 'buffer_size' is initialized using
uninitialized_var to clear warning.

Signed-off-by: Zhengwang Ruan <ruan.zhengwang@gmail.com>
---
v2: added a subsystem prefix to the subject
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

