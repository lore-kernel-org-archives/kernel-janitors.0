From: Thomas Avery <tavery321@gmail.com>
Date: Mon, 19 Mar 2018 22:11:00 +0000
Subject: [PATCH] staging: rtl8723bs: Replace yield() call with cond_resched()
Message-Id: <20180319221100.rxs2n54ch53tukje@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove yield() call. yield() does not guarantee progress, and should not
be used. cond_resched or wait_event are a safe alternative.

Signed-off-by: Thomas Avery <tavery321@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 4a6af72013fa..85f7769ecc2d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -701,7 +701,7 @@ void LPS_Leave_check(
 	bReady = false;
 	start_time = jiffies;
 
-	yield();
+	cond_resched();
 
 	while (1) {
 		down(&pwrpriv->lock);
-- 
2.11.0

