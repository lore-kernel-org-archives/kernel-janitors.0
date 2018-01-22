From: Colin King <colin.king@canonical.com>
Date: Mon, 22 Jan 2018 15:57:30 +0000
Subject: [PATCH] staging: rtl8192u: remove redundant initialization of 'timeout'
Message-Id: <20180122155730.16216-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170209110643.22590-1-colin.king@canonical.com>
In-Reply-To: <20170209110643.22590-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, simran singhal <singhalsimran0@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable timeout is initialized however this value is never read and
it is reassigned a new value a little later, hence the initialization
is redundant and can be removed.

Cleans up clang warning:
drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c:1728:6: warning:
Value stored to 'timeout' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
index f56fdc7a4b61..25c186a8bde3 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
@@ -1725,7 +1725,7 @@ static void ieee80211_sta_ps_send_null_frame(struct ieee80211_device *ieee,
 static short ieee80211_sta_ps_sleep(struct ieee80211_device *ieee, u32 *time_h,
 				    u32 *time_l)
 {
-	int timeout = ieee->ps_timeout;
+	int timeout;
 	u8 dtim;
 	/*if(ieee->ps = IEEE80211_PS_DISABLED ||
 		ieee->iw_mode != IW_MODE_INFRA ||
-- 
2.15.1

