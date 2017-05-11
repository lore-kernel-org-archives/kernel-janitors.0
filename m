From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 16:17:01 +0000
Subject: [PATCH 2/4] vmbus: Delete an error message for a failed memory allocation in vmbus_device_create()
Message-Id: <587dbcf5-8b12-fac7-693e-5f471e6d5167@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dea9c6a3-0ae6-f3fe-c0d3-7f5b856e2638@users.sourceforge.net>
In-Reply-To: <dea9c6a3-0ae6-f3fe-c0d3-7f5b856e2638@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@linuxdriverproject.org, Haiyang Zhang <haiyangz@microsoft.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 17:33:14 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hv/vmbus_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 6802d74f162c..96328aebae5a 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -1149,7 +1149,5 @@ struct hv_device *vmbus_device_create(const uuid_le *type,
-	if (!child_device_obj) {
-		pr_err("Unable to allocate device object for child device\n");
+	if (!child_device_obj)
 		return NULL;
-	}
 
 	child_device_obj->channel = channel;
 	memcpy(&child_device_obj->dev_type, type, sizeof(uuid_le));
-- 
2.12.3

