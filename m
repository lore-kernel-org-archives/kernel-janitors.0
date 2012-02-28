From: Zhengwang Ruan <ruan.zhengwang@gmail.com>
Date: Tue, 28 Feb 2012 09:09:34 +0000
Subject: [PATCH] Trace: initialize variable to clear warning
Message-Id: <1330420174-20537-1-git-send-email-ruan.zhengwang@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rostedt@goodmis.org, fweisbec@gmail.com, mingo@redhat.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

GCC warns that 'page2' is used without being initialized previously before
being used, this is to clear it.

Signed-off-by: Zhengwang Ruan <ruan.zhengwang@gmail.com>
---
 kernel/trace/trace.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index a3f1bc5..47376ba 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -3694,7 +3694,7 @@ tracing_mark_write(struct file *filp, const char __user *ubuf,
 	int nr_pages = 1;
 	ssize_t written;
 	void *page1;
-	void *page2;
+	void *uninitialized_var(page2);
 	int offset;
 	int size;
 	int len;
-- 
1.6.0.4

