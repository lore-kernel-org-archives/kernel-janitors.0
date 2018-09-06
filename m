From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 06 Sep 2018 01:54:07 +0000
Subject: [PATCH -next] iomap: remove duplicated include from iomap.c
Message-Id: <1536198847-10922-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Yue Haibing <yuehaibing@huawei.com>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Yue Haibing <yuehaibing@huawei.com>

Remove duplicated include.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 fs/iomap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/iomap.c b/fs/iomap.c
index 009071e..e837c36 100644
--- a/fs/iomap.c
+++ b/fs/iomap.c
@@ -30,7 +30,6 @@
 #include <linux/task_io_accounting_ops.h>
 #include <linux/dax.h>
 #include <linux/sched/signal.h>
-#include <linux/swap.h>
 
 #include "internal.h"
 
