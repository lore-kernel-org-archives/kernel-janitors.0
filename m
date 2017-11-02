From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Nov 2017 13:45:11 +0000
Subject: [PATCH] staging: rtlwifi: remove unused pointer hw
Message-Id: <20171102134511.21259-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, Kalle Valo <kvalo@codeaurora.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer hw is not being used and hence can be removed. Cleans up
warning:

drivers/staging/rtlwifi/base.c:2167:23: warning: unused variable
‘hw’ [-Wunused-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtlwifi/base.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtlwifi/base.c b/drivers/staging/rtlwifi/base.c
index 2c693c7aa9d5..c947def37d31 100644
--- a/drivers/staging/rtlwifi/base.c
+++ b/drivers/staging/rtlwifi/base.c
@@ -2164,7 +2164,6 @@ void rtl_watchdog_wq_callback(void *data)
 void rtl_watch_dog_timer_callback(struct timer_list *t)
 {
 	struct rtl_priv *rtlpriv = from_timer(rtlpriv, t, works.watchdog_timer);
-	struct ieee80211_hw *hw = rtlpriv->hw;
 
 	queue_delayed_work(rtlpriv->works.rtl_wq,
 			   &rtlpriv->works.watchdog_wq, 0);
-- 
2.14.1

