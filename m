From: YueHaibing <yuehaibing@huawei.com>
Date: Sun, 06 Oct 2019 07:43:24 +0000
Subject: [PATCH -next] media: cx231xx: remove duplicated include from cx231xx-417.c
Message-Id: <20191006074324.48283-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, Kate Stewart <kstewart@linuxfoundation.org>, Wenwen Wang <wenwen@cs.uga.edu>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/media/usb/cx231xx/cx231xx-417.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index 46d0215deee6..1aec4459f50a 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -22,7 +22,6 @@
 #include <linux/firmware.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
-#include <linux/slab.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>
