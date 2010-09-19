From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 19 Sep 2010 12:54:52 +0000
Subject: [PATCH 05/14] message: i2o: fix device_register() error handling
Message-Id: <1284900893-24411-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

If device_register() fails then call put_device().
See comment to device_register.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 compile tested.

 drivers/message/i2o/device.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/message/i2o/device.c b/drivers/message/i2o/device.c
index 0ee4264..3ac8ec3 100644
--- a/drivers/message/i2o/device.c
+++ b/drivers/message/i2o/device.c
@@ -234,8 +234,10 @@ static int i2o_device_add(struct i2o_controller *c, i2o_lct_entry *entry)
 	i2o_dev->device.parent = &c->device;
 
 	rc = device_register(&i2o_dev->device);
-	if (rc)
+	if (rc) {
+		put_device(&i2o_dev->device);
 		goto err;
+	}
 
 	list_add_tail(&i2o_dev->list, &c->devices);
 
-- 
1.7.0.4

