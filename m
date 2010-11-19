From: Vasiliy Kulikov <segoon@openwall.com>
Date: Fri, 19 Nov 2010 18:41:40 +0000
Subject: [PATCH] drivers: base: core: do not put noninitialized devices
Message-Id: <1290192100-11451-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org

If kobject_set_name_vargs() fails then put_device() frees
device with zero kobj->state_initialized.  This leads to WARN().
Divide device_register() call to device_initialize() call before
kobject_set_name_vargs() and device_add() call after it.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested only.

 drivers/base/core.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 46ff6c2..833ccf3 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1424,11 +1424,12 @@ struct device *device_create_vargs(struct class *class, struct device *parent,
 	dev->release = device_create_release;
 	dev_set_drvdata(dev, drvdata);
 
+	device_initialize(dev);
 	retval = kobject_set_name_vargs(&dev->kobj, fmt, args);
 	if (retval)
 		goto error;
 
-	retval = device_register(dev);
+	retval = device_add(dev);
 	if (retval)
 		goto error;
 
-- 
1.7.0.4

