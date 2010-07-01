From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Thu, 01 Jul 2010 12:18:43 +0000
Subject: [PATCH] staging/wlan-ng: fix compile error updating to new NL80211
Message-Id: <1277986723.1679.8.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hello, 

A few days ago I send this patch and didn't get any feedback. So I'm resending it.

In linux-next I got a compile error in wlan-ng:

CC [M]  drivers/staging/wlan-ng/p80211netdev.o
In file included from drivers/staging/wlan-ng/p80211netdev.c:91:
drivers/staging/wlan-ng/cfg80211.c:602: warning: ‘enum tx_power_setting’ declared inside parameter list
drivers/staging/wlan-ng/cfg80211.c:602: warning: its scope is only this definition or declaration, which is probably not what you want
drivers/staging/wlan-ng/cfg80211.c:602: error: parameter 2 (‘type’) has incomplete type
drivers/staging/wlan-ng/cfg80211.c: In function ‘prism2_set_tx_power’:
drivers/staging/wlan-ng/cfg80211.c:609: error: ‘TX_POWER_AUTOMATIC’ undeclared (first use in this function)
drivers/staging/wlan-ng/cfg80211.c:609: error: (Each undeclared identifier is reported only once
drivers/staging/wlan-ng/cfg80211.c:609: error: for each function it appears in.)
make[1]: *** [drivers/staging/wlan-ng/p80211netdev.o] Error 1
make: *** [_module_drivers/staging/wlan-ng] Error 2

The problem is that the 802.11 netlink interface changed and the driver was not updated

This patch solves the issue

Thanks a lot,


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/wlan-ng/cfg80211.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
index b0792f7..9803b28 100644
--- a/drivers/staging/wlan-ng/cfg80211.c
+++ b/drivers/staging/wlan-ng/cfg80211.c
@@ -599,14 +599,14 @@ int prism2_leave_ibss(struct wiphy *wiphy, struct net_device *dev) {
 
 
 int prism2_set_tx_power(struct wiphy *wiphy,
-			enum tx_power_setting type, int dbm) {
+			enum nl80211_tx_power_setting type, int dbm) {
 	struct prism2_wiphy_private *priv = wiphy_priv(wiphy);
 	wlandevice_t *wlandev = priv->wlandev;
 	u32 data;
 	int result;
 	int err = 0;
 
-	if (type = TX_POWER_AUTOMATIC)
+	if (type = NL80211_TX_POWER_AUTOMATIC)
 		data = 30;
 	else
 		data = dbm;
-- 
1.7.0.4




