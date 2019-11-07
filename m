From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 07 Nov 2019 01:59:23 +0000
Subject: [PATCH -next] staging: vboxsf: Remove unused including <linux/version.h>
Message-Id: <20191107015923.100013-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fsdevel@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/vboxsf/vfsmod.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vboxsf/vfsmod.h b/drivers/staging/vboxsf/vfsmod.h
index de650d65fbe4..18f95b00fc33 100644
--- a/drivers/staging/vboxsf/vfsmod.h
+++ b/drivers/staging/vboxsf/vfsmod.h
@@ -10,7 +10,6 @@
 
 #include <linux/backing-dev.h>
 #include <linux/idr.h>
-#include <linux/version.h>
 #include "shfl_hostintf.h"
 
 #define DIR_BUFFER_SIZE SZ_16K
