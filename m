From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 13 Nov 2019 02:25:01 +0000
Subject: [PATCH -next] xfs: remove duplicated include from xfs_dir2_data.c
Message-Id: <20191113022501.55816-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Darrick J . Wong" <darrick.wong@oracle.com>, Eric Sandeen <sandeen@sandeen.net>, Brian Foster <bfoster@redhat.com>, Dave Chinner <dchinner@redhat.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/xfs/libxfs/xfs_dir2_data.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/xfs/libxfs/xfs_dir2_data.c b/fs/xfs/libxfs/xfs_dir2_data.c
index 9e471a28b6c6..30293a1d03f6 100644
--- a/fs/xfs/libxfs/xfs_dir2_data.c
+++ b/fs/xfs/libxfs/xfs_dir2_data.c
@@ -18,7 +18,6 @@
 #include "xfs_trans.h"
 #include "xfs_buf_item.h"
 #include "xfs_log.h"
-#include "xfs_dir2_priv.h"
 
 static xfs_failaddr_t xfs_dir2_data_freefind_verify(
 		struct xfs_dir2_data_hdr *hdr, struct xfs_dir2_data_free *bf,
