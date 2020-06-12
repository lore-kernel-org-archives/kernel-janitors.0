From: Kaitao Cheng <pilgrimtao@gmail.com>
Date: Fri, 12 Jun 2020 16:09:46 +0000
Subject: [PATCH v2] proc/fd: Remove unnecessary {files, f_flags, file} initialization in seq_show()
Message-Id: <20200612160946.21187-1-pilgrimtao@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adobriyan@gmail.com, Markus.Elfring@web.de
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, songmuchun@bytedance.com, kernel-janitors@vger.kernel.org, Kaitao Cheng <pilgrimtao@gmail.com>

'files' will be immediately reassigned. 'f_flags' and 'file' will be
overwritten in the if{} or seq_show() directly exits with an error.
so we don't need to consume CPU resources to initialize them.

Signed-off-by: Kaitao Cheng <pilgrimtao@gmail.com>
---

v2 ChangeLog:
  1. Fix some commit message
  2. Remove unnecessary f_flags initialization

 fs/proc/fd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/proc/fd.c b/fs/proc/fd.c
index 81882a13212d..d3854b76e95e 100644
--- a/fs/proc/fd.c
+++ b/fs/proc/fd.c
@@ -19,9 +19,9 @@
 
 static int seq_show(struct seq_file *m, void *v)
 {
-	struct files_struct *files = NULL;
-	int f_flags = 0, ret = -ENOENT;
-	struct file *file = NULL;
+	struct files_struct *files;
+	int f_flags, ret = -ENOENT;
+	struct file *file;
 	struct task_struct *task;
 
 	task = get_proc_task(m->private);
-- 
2.20.1
