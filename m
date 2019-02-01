From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 01 Feb 2019 01:49:22 +0000
Subject: [PATCH -next] s390: remove unused including <linux/version.h>
Message-Id: <20190201020252.127647-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/s390/kernel/setup.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
index 3b416599f6ca..5e707eaa0b31 100644
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@ -49,7 +49,6 @@
 #include <linux/memory.h>
 #include <linux/compat.h>
 #include <linux/start_kernel.h>
-#include <linux/version.h>
 
 #include <asm/ipl.h>
 #include <asm/facility.h>
