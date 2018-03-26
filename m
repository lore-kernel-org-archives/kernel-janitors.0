From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 26 Mar 2018 06:47:02 +0000
Subject: [PATCH -next] afs: Make symbol 'afs_cell_gc_delay' static
Message-Id: <1522046822-20276-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warnings:

fs/afs/cell.c:21:24: warning:
 symbol 'afs_cell_gc_delay' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 fs/afs/cell.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/afs/cell.c b/fs/afs/cell.c
index 3d2c5e0..c17e03b 100644
--- a/fs/afs/cell.c
+++ b/fs/afs/cell.c
@@ -18,7 +18,7 @@
 #include <keys/rxrpc-type.h>
 #include "internal.h"
 
-unsigned __read_mostly afs_cell_gc_delay = 10;
+static unsigned __read_mostly afs_cell_gc_delay = 10;
 
 static void afs_manage_cell(struct work_struct *);

