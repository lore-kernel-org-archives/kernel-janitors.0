From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 19 Sep 2010 12:54:44 +0000
Subject: [PATCH 02/14] dio: fix device_register() error handling
Message-Id: <1284900884-24285-1-git-send-email-segooon@gmail.com>
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
 I cannot compile this driver, so it is not tested at all.

 drivers/dio/dio.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/dio/dio.c b/drivers/dio/dio.c
index 55dd88d..d2ede72 100644
--- a/drivers/dio/dio.c
+++ b/drivers/dio/dio.c
@@ -186,6 +186,7 @@ static int __init dio_init(void)
 	error = device_register(&dio_bus.dev);
 	if (error) {
 		pr_err("DIO: Error registering dio_bus\n");
+		put_device(&dio_bus.dev);
 		return error;
 	}
 
@@ -261,6 +262,7 @@ static int __init dio_init(void)
 		if (error) {
 			pr_err("DIO: Error registering device %s\n",
 			       dev->name);
+			put_device(&dev->dev);
 			continue;
 		}
 		error = dio_create_sysfs_dev_files(dev);
-- 
1.7.0.4

