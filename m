From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 20 Aug 2019 01:32:43 +0000
Subject: [PATCH -next] nfsd: remove duplicated include from filecache.c
Message-Id: <20190820013243.129865-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J . Bruce Fields" <bfields@fieldses.org>, Jeff Layton <jeff.layton@primarydata.com>, Weston Andros Adamson <dros@primarydata.com>, Richard Sharpe <richard.sharpe@primarydata.com>, Trond Myklebust <trond.myklebust@primarydata.com>, Chuck Lever <chuck.lever@oracle.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/nfsd/filecache.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/nfsd/filecache.c b/fs/nfsd/filecache.c
index 4759fdc8a07e..07939f4834e8 100644
--- a/fs/nfsd/filecache.c
+++ b/fs/nfsd/filecache.c
@@ -6,7 +6,6 @@
 
 #include <linux/hash.h>
 #include <linux/slab.h>
-#include <linux/hash.h>
 #include <linux/file.h>
 #include <linux/sched.h>
 #include <linux/list_lru.h>
