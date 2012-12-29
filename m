From: Emil Goode <emilgoode@gmail.com>
Date: Sat, 29 Dec 2012 15:27:17 +0000
Subject: [PATCH] Staging: wlan-ng: Add missing argument
Message-Id: <1356794837-14631-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: gregkh@linuxfoundation.org, dan.carpenter@oracle.com, krzysztof.wilczynski@linux.com, devendra.aaru@gmail.com
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

The commit c8442118 introduced a struct wireless_dev pointer
as a second argument of the function pointers set_tx_power
and get_tx_power. This patch adds the missing arguments for
the wlan-ng driver.

Sparse warnings:

drivers/staging/wlan-ng/cfg80211.c:735:25: warning:
	incorrect type in initializer (incompatible argument 2
	(different base types))
	drivers/staging/wlan-ng/cfg80211.c:735:25:
	expected int ( *set_tx_power )( ... )
	drivers/staging/wlan-ng/cfg80211.c:735:25:
	got int ( extern [toplevel] *<noident> )( ... )

drivers/staging/wlan-ng/cfg80211.c:736:25: warning:
	incorrect type in initializer (incompatible argument 2
	(different base types))
	drivers/staging/wlan-ng/cfg80211.c:736:25:
	expected int ( *get_tx_power )( ... )
	drivers/staging/wlan-ng/cfg80211.c:736:25:
	got int ( extern [toplevel] *<noident> )( ... )

drivers/staging/wlan-ng/cfg80211.c:735:2: warning:
	initialization from incompatible pointer type [enabled by default]

drivers/staging/wlan-ng/cfg80211.c:735:2: warning:
	(near initialization for ‘prism2_usb_cfg_ops.set_tx_power’)
	[enabled by default]

drivers/staging/wlan-ng/cfg80211.c:736:2: warning:
	initialization from incompatible pointer type [enabled by default]

drivers/staging/wlan-ng/cfg80211.c:736:2: warning:
	(near initialization for ‘prism2_usb_cfg_ops.get_tx_power’)
	[enabled by default]

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/staging/wlan-ng/cfg80211.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
index 18c06a5..1d31eab 100644
--- a/drivers/staging/wlan-ng/cfg80211.c
+++ b/drivers/staging/wlan-ng/cfg80211.c
@@ -638,8 +638,8 @@ int prism2_leave_ibss(struct wiphy *wiphy, struct net_device *dev)
 }
 
 
-int prism2_set_tx_power(struct wiphy *wiphy, enum nl80211_tx_power_setting type,
-			int mbm)
+int prism2_set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
+			enum nl80211_tx_power_setting type, int mbm)
 {
 	struct prism2_wiphy_private *priv = wiphy_priv(wiphy);
 	wlandevice_t *wlandev = priv->wlandev;
@@ -665,7 +665,8 @@ exit:
 	return err;
 }
 
-int prism2_get_tx_power(struct wiphy *wiphy, int *dbm)
+int prism2_get_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
+			int *dbm)
 {
 	struct prism2_wiphy_private *priv = wiphy_priv(wiphy);
 	wlandevice_t *wlandev = priv->wlandev;
-- 
1.7.10.4

