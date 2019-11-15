From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 15 Nov 2019 11:25:22 +0000
Subject: [PATCH -next] NFS: remove duplicated include from nfs4file.c
Message-Id: <20191115112522.86896-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, Olga Kornievskaia <kolga@netapp.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/nfs/nfs4file.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/nfs/nfs4file.c b/fs/nfs/nfs4file.c
index e97813b15e23..b054d57e77d9 100644
--- a/fs/nfs/nfs4file.c
+++ b/fs/nfs/nfs4file.c
@@ -8,7 +8,6 @@
 #include <linux/file.h>
 #include <linux/falloc.h>
 #include <linux/nfs_fs.h>
-#include <linux/file.h>
 #include "delegation.h"
 #include "internal.h"
 #include "iostat.h"
