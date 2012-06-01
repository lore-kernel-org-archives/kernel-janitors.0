From: Emil Goode <emilgoode@gmail.com>
Date: Fri, 01 Jun 2012 19:43:29 +0000
Subject: [PATCH] pps: Return PTR_ERR on error in device_create
Message-Id: <1338579809-11637-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: giometti@enneenne.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

We should return PTR_ERR if the call to the
device_create function fails.
Without this patch we instead return the value
from a successful call to cdev_add if the call
to device_create fails.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/pps/pps.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pps/pps.c b/drivers/pps/pps.c
index 98fbe62..e771487 100644
--- a/drivers/pps/pps.c
+++ b/drivers/pps/pps.c
@@ -327,8 +327,10 @@ int pps_register_cdev(struct pps_device *pps)
 	}
 	pps->dev = device_create(pps_class, pps->info.dev, devt, pps,
 							"pps%d", pps->id);
-	if (IS_ERR(pps->dev))
+	if (IS_ERR(pps->dev)) {
+		err = PTR_ERR(pps->dev);
 		goto del_cdev;
+	}
 
 	pps->dev->release = pps_device_destruct;
 
-- 
1.7.10

