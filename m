From: Vasiliy Kulikov <segoon@openwall.com>
Date: Fri, 19 Nov 2010 18:41:49 +0000
Subject: [PATCH] media: video: pvrusb2: fix memory leak
Message-Id: <1290192109-11611-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Mike Isely <isely@pobox.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Use put_device() instead of kfree() because of device name leak.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested only.

 drivers/media/video/pvrusb2/pvrusb2-sysfs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/media/video/pvrusb2/pvrusb2-sysfs.c b/drivers/media/video/pvrusb2/pvrusb2-sysfs.c
index 3d7e5aa..281806b 100644
--- a/drivers/media/video/pvrusb2/pvrusb2-sysfs.c
+++ b/drivers/media/video/pvrusb2/pvrusb2-sysfs.c
@@ -647,7 +647,7 @@ static void class_dev_create(struct pvr2_sysfs *sfp,
 	if (ret) {
 		pvr2_trace(PVR2_TRACE_ERROR_LEGS,
 			   "device_register failed");
-		kfree(class_dev);
+		put_device(class_dev);
 		return;
 	}
 
-- 
1.7.0.4

