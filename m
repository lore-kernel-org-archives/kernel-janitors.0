From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 16:15:46 +0000
Subject: [PATCH 1/4] vmbus: Improve a size determination in vmbus_device_create()
Message-Id: <22c8886f-a38c-23ab-9277-ccccf86b1801@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dea9c6a3-0ae6-f3fe-c0d3-7f5b856e2638@users.sourceforge.net>
In-Reply-To: <dea9c6a3-0ae6-f3fe-c0d3-7f5b856e2638@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@linuxdriverproject.org, Haiyang Zhang <haiyangz@microsoft.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 17:30:10 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hv/vmbus_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 0087b49095eb..6802d74f162c 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -1145,5 +1145,5 @@ struct hv_device *vmbus_device_create(const uuid_le *type,
 {
 	struct hv_device *child_device_obj;
 
-	child_device_obj = kzalloc(sizeof(struct hv_device), GFP_KERNEL);
+	child_device_obj = kzalloc(sizeof(*child_device_obj), GFP_KERNEL);
 	if (!child_device_obj) {
-- 
2.12.3

