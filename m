From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 09 Oct 2019 12:04:49 +0000
Subject: [PATCH -next] usb: typec: remove duplicated include from hd3ss3220.c
Message-Id: <20191009120449.44899-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/typec/hd3ss3220.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 1900910c637e..0ea5bf3c19c7 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -10,7 +10,6 @@
 #include <linux/usb/role.h>
 #include <linux/irqreturn.h>
 #include <linux/interrupt.h>
-#include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/usb/typec.h>
