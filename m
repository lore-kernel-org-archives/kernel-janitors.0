From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 21 Jan 2019 08:26:37 +0000
Subject: [PATCH -next] staging: gasket: interrupt: remove unused including <linux/version.h>
Message-Id: <1548059197-147949-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Springer <rspringer@google.com>, John Joseph <jnjoseph@google.com>, Ben Chan <benchan@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yue Haibing <yuehaibing@huawei.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Yue Haibing <yuehaibing@huawei.com>

Remove including <linux/version.h> that don't need it.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/staging/gasket/gasket_interrupt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gasket/gasket_interrupt.c b/drivers/staging/gasket/gasket_interrupt.c
index 1cfbc12..176ac2a 100644
--- a/drivers/staging/gasket/gasket_interrupt.c
+++ b/drivers/staging/gasket/gasket_interrupt.c
@@ -9,7 +9,6 @@
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/printk.h>
-#include <linux/version.h>
 #ifdef GASKET_KERNEL_TRACE_SUPPORT
 #define CREATE_TRACE_POINTS
 #include <trace/events/gasket_interrupt.h>
