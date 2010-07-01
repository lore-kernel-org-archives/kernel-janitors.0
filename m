From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 01 Jul 2010 11:23:04 +0000
Subject: [PATCH 12/16] staging/rtl8192e/ieee80211: use ARRAY_SIZE
Message-Id: <1277983385-29458-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Julia Lawall <julia@diku.dk>, Herton Ronaldo Krzesinski <herton@mandriva.com.br>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Tejun Heo <tj@kernel.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Change sizeof(x) / sizeof(*x) to ARRAY_SIZE(x).

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/rtl8192e/ieee80211/ieee80211_wx.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/rtl8192e/ieee80211/ieee80211_wx.c b/drivers/staging/rtl8192e/ieee80211/ieee80211_wx.c
index 4971b1c..6dcaac5 100644
--- a/drivers/staging/rtl8192e/ieee80211/ieee80211_wx.c
+++ b/drivers/staging/rtl8192e/ieee80211/ieee80211_wx.c
@@ -121,7 +121,7 @@ static inline char *rtl819x_translate_scan(struct ieee80211_device *ieee,
         }
 	/* Add the protocol name */
 	iwe.cmd = SIOCGIWNAME;
-	for(i=0; i<(sizeof(ieee80211_modes)/sizeof(ieee80211_modes[0])); i++) {
+	for (i = 0; i < ARRAY_SIZE(ieee80211_modes); i++) {
 		if(network->mode&(1<<i)) {
 			sprintf(pname,ieee80211_modes[i].mode_string,ieee80211_modes[i].mode_size);
 			pname +=ieee80211_modes[i].mode_size;
-- 
1.7.0.4

