From: Zhengwang Ruan <ruan.zhengwang@gmail.com>
Date: Thu, 01 Mar 2012 02:41:17 +0000
Subject: [PATCH v2] Trace: Add comment to notify a warning caused by a gcc bug
Message-Id: <1330569677-11984-1-git-send-email-ruan.zhengwang@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rostedt@goodmis.org, fweisbec@gmail.com, mingo@redhat.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

GCC (version < 4.6) warns 'page2' is uninitialized, but this is helpful
to track a real potential bug, simply add comment to note this.

Signed-off-by: Zhengwang Ruan <ruan.zhengwang@gmail.com>
---
v2: Change fix to add a comment.
---
 kernel/trace/trace.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index a3f1bc5..ef332e6 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -3694,7 +3694,7 @@ tracing_mark_write(struct file *filp, const char __user *ubuf,
 	int nr_pages = 1;
 	ssize_t written;
 	void *page1;
-	void *page2;
+	void *page2;	/* if you get a warning here, upgrade your gcc to 4.6 */
 	int offset;
 	int size;
 	int len;
-- 
1.6.0.4

