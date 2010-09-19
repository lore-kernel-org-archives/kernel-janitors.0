From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 19 Sep 2010 12:55:11 +0000
Subject: [PATCH 11/14] staging: hv: fix device_register() error handling
Message-Id: <1284900911-24684-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Hank Janssen <hjanssen@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Bill Pemberton <wfp5p@virginia.edu>, Milan Dadok <milan@dadok.name>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

If device_register() fails then call put_device().
See comment to device_register.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 compile tested.

 drivers/staging/hv/vmbus_drv.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/hv/vmbus_drv.c b/drivers/staging/hv/vmbus_drv.c
index ad29887..255e4b2 100644
--- a/drivers/staging/hv/vmbus_drv.c
+++ b/drivers/staging/hv/vmbus_drv.c
@@ -345,6 +345,7 @@ static int vmbus_bus_init(int (*drv_init)(struct hv_driver *drv))
 		DPRINT_ERR(VMBUS_DRV,
 			   "ERROR - Unable to register vmbus root device");
 
+		put_device(&dev_ctx->device);
 		free_irq(vmbus_irq, NULL);
 		bus_unregister(&vmbus_drv_ctx->bus);
 
-- 
1.7.0.4

