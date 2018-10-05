From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 05 Oct 2018 11:23:54 +0000
Subject: [PATCH -next] staging: axis-fifo: remove duplicated include from axis-fifo.c
Message-Id: <1538738634-131706-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jacob Feder <jacobsfeder@gmail.com>, Alexey Khoroshilov <khoroshilov@ispras.ru>, kbuild test robot <fengguang.wu@intel.com>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: YueHaibing <yuehaibing@huawei.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 63c8efd..48a9877 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -27,8 +27,6 @@
 #include <linux/interrupt.h>
 #include <linux/param.h>
 #include <linux/fs.h>
-#include <linux/device.h>
-#include <linux/cdev.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
 #include <linux/jiffies.h>
