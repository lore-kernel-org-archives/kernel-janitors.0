From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:16:04 +0000
Subject: [PATCH 18/25] rtmp_timer: remove casts from void*
Message-Id: <1277806565-31316-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/rt2860/common/rtmp_timer.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rt2860/common/rtmp_timer.c b/drivers/staging/rt2860/common/rtmp_timer.c
index 42e47d9..ab52090 100644
--- a/drivers/staging/rt2860/common/rtmp_timer.c
+++ b/drivers/staging/rt2860/common/rtmp_timer.c
@@ -143,8 +143,8 @@ int RtmpTimerQThread(IN void *Context)
 	struct rt_rtmp_os_task *pTask;
 	struct rt_rtmp_adapter *pAd;
 
-	pTask = (struct rt_rtmp_os_task *)Context;
-	pAd = (struct rt_rtmp_adapter *)pTask->priv;
+	pTask = Context;
+	pAd = pTask->priv;
 
 	RtmpOSTaskCustomize(pTask);
 
-- 
1.7.0.4

