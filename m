From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:16:12 +0000
Subject: [PATCH 20/25] usb_main_dev: remove casts from void*
Message-Id: <1277806573-31384-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Simon Horman <horms@verge.net.au>, Nobhiro KUSUNO <n-kusuno@fc4.so-net.ne.jp>, =?UTF-8?q?Sebastian=20Dalfu=C3=9F?= <sd@sedf.de>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/rt2860/usb_main_dev.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rt2860/usb_main_dev.c b/drivers/staging/rt2860/usb_main_dev.c
index b740662..40eab25 100644
--- a/drivers/staging/rt2860/usb_main_dev.c
+++ b/drivers/staging/rt2860/usb_main_dev.c
@@ -421,8 +421,8 @@ int MlmeThread(IN void *Context)
 	int status;
 	status = 0;
 
-	pTask = (struct rt_rtmp_os_task *)Context;
-	pAd = (struct rt_rtmp_adapter *)pTask->priv;
+	pTask = Context;
+	pAd = pTask->priv;
 
 	RtmpOSTaskCustomize(pTask);
 
@@ -490,8 +490,8 @@ int RTUSBCmdThread(IN void *Context)
 	int status;
 	status = 0;
 
-	pTask = (struct rt_rtmp_os_task *)Context;
-	pAd = (struct rt_rtmp_adapter *)pTask->priv;
+	pTask = Context;
+	pAd = pTask->priv;
 
 	RtmpOSTaskCustomize(pTask);
 
-- 
1.7.0.4

