From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 11 Jul 2020 07:34:58 +0000
Subject: [PATCH -next] xfs: remove duplicated include from xfs_buf_item.c
Message-Id: <20200711073458.27029-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191113022501.55816-1-yuehaibing@huawei.com>
In-Reply-To: <20191113022501.55816-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Darrick J . Wong" <darrick.wong@oracle.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-xfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/xfs/xfs_buf_item.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/xfs/xfs_buf_item.c b/fs/xfs/xfs_buf_item.c
index e9428c30862a..ed1bf1d99483 100644
--- a/fs/xfs/xfs_buf_item.c
+++ b/fs/xfs/xfs_buf_item.c
@@ -19,7 +19,6 @@
 #include "xfs_quota.h"
 #include "xfs_dquot_item.h"
 #include "xfs_dquot.h"
-#include "xfs_trans_priv.h"
 #include "xfs_trace.h"
 #include "xfs_log.h"
 
