From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 30 Apr 2019 01:51:12 +0000
Subject: [PATCH -next] dm: remove unused including <linux/version.h>
Message-Id: <20190430020102.56234-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: YueHaibing <yuehaibing@huawei.com>, dm-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/md/dm-dust.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index 997830984893..df011da50b50 100644
--- a/drivers/md/dm-dust.c
+++ b/drivers/md/dm-dust.c
@@ -10,7 +10,6 @@
 
 #include <linux/device-mapper.h>
 #include <linux/module.h>
-#include <linux/version.h>
 #include <linux/rbtree.h>
 
 #define DM_MSG_PREFIX "dust"
