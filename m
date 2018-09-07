From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 07 Sep 2018 01:55:33 +0000
Subject: [PATCH -next] vfs: syscall: Remove duplicated include from namespace.c
Message-Id: <1536285937-150932-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/namespace.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index 6c95796..e28db6e 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -26,7 +26,6 @@
 #include <linux/magic.h>
 #include <linux/bootmem.h>
 #include <linux/task_work.h>
-#include <linux/file.h>
 #include <linux/sched/task.h>
 #include <uapi/linux/mount.h>
 #include <linux/fs_context.h>
