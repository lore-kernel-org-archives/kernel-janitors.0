From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 25 Jul 2019 06:59:40 +0000
Subject: [PATCH net-next] can: sja1000: f81601: remove unused including <linux/version.h>
Message-Id: <20190725065940.2118-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, "Ji-Ze Hong (Peter Hong)" <hpeter@gmail.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-can@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/can/sja1000/f81601.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/can/sja1000/f81601.c b/drivers/net/can/sja1000/f81601.c
index 362a9d4f44d5..8f25e95814ef 100644
--- a/drivers/net/can/sja1000/f81601.c
+++ b/drivers/net/can/sja1000/f81601.c
@@ -14,7 +14,6 @@
 #include <linux/pci.h>
 #include <linux/can/dev.h>
 #include <linux/io.h>
-#include <linux/version.h>
 
 #include "sja1000.h"
 
