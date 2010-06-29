From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:16:08 +0000
Subject: [PATCH 19/25] rt_linux: remove casts from void*
Message-Id: <1277806569-31350-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, =?UTF-8?q?Sebastian=20Dalfu=C3=9F?= <sd@sedf.de>, Jeff Mahoney <jeffm@suse.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/rt2860/rt_linux.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/rt2860/rt_linux.c b/drivers/staging/rt2860/rt_linux.c
index 0029b2d..6536965 100644
--- a/drivers/staging/rt2860/rt_linux.c
+++ b/drivers/staging/rt2860/rt_linux.c
@@ -1015,7 +1015,7 @@ int RtmpOSTaskKill(struct rt_rtmp_os_task *pTask)
 	struct rt_rtmp_adapter *pAd;
 	int ret = NDIS_STATUS_FAILURE;
 
-	pAd = (struct rt_rtmp_adapter *)pTask->priv;
+	pAd = pTask->priv;
 
 #ifdef KTHREAD_SUPPORT
 	if (pTask->kthread_task) {
-- 
1.7.0.4

