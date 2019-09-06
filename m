From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 06 Sep 2019 09:54:09 +0000
Subject: [PATCH net-next] ionic: Remove unused including <linux/version.h>
Message-Id: <20190906095410.107596-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shannon Nelson <snelson@pensando.io>, Pensando Drivers <drivers@pensando.io>, "David S . Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/pensando/ionic/ionic_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_main.c b/drivers/net/ethernet/pensando/ionic/ionic_main.c
index 5ec67f3f1853..15e432386b35 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_main.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_main.c
@@ -2,7 +2,6 @@
 /* Copyright(c) 2017 - 2019 Pensando Systems, Inc */
 
 #include <linux/module.h>
-#include <linux/version.h>
 #include <linux/netdevice.h>
 #include <linux/utsname.h>
