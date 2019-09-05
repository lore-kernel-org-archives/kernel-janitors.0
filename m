From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 05 Sep 2019 02:56:23 +0000
Subject: [PATCH -next] staging: exfat: remove unused including <linux/version.h>
Message-Id: <20190905025623.63210-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis Kletnieks <valdis.kletnieks@vt.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/exfat/exfat_super.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 5b5c2ca8c9aa..cb43a39864af 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -3,7 +3,6 @@
  *  Copyright (C) 2012-2013 Samsung Electronics Co., Ltd.
  */
 
-#include <linux/version.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/time.h>
