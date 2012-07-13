From: Emil Goode <emilgoode@gmail.com>
Date: Fri, 13 Jul 2012 23:28:08 +0000
Subject: [PATCH] staging: wlan-ng: Fix problem with wrong arguments
Message-Id: <1342222089-5930-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: gregkh@linuxfoundation.org, dan.carpenter@oracle.com, krzysztof.wilczynski@linux.com, devendra.aaru@gmail.com
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

The function pointer scan in struct cfg80211_ops is not
supposed to be assigned	a function with a struct net_device
pointer as an argument. Instead access the net_device struct
in the following way:

struct net_device *dev = request->wdev->netdev;

sparse gives these warnings:

drivers/staging/wlan-ng/cfg80211.c:726:17: warning:
        incorrect type in initializer (incompatible argument 2
        (different base types))
        expected int ( *scan )( ... )
        got int ( extern [toplevel] *<noident> )( ... )

drivers/staging/wlan-ng/cfg80211.c:726:2: warning:
        initialization from incompatible pointer type [enabled by default]

drivers/staging/wlan-ng/cfg80211.c:726:2: warning:
        (near initialization for ‘prism2_usb_cfg_ops.scan’)
        [enabled by default]

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/staging/wlan-ng/cfg80211.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
index fabff4d..0970127 100644
--- a/drivers/staging/wlan-ng/cfg80211.c
+++ b/drivers/staging/wlan-ng/cfg80211.c
@@ -327,9 +327,9 @@ int prism2_get_station(struct wiphy *wiphy, struct net_device *dev,
 	return result;
 }
 
-int prism2_scan(struct wiphy *wiphy, struct net_device *dev,
-		struct cfg80211_scan_request *request)
+int prism2_scan(struct wiphy *wiphy, struct cfg80211_scan_request *request)
 {
+	struct net_device *dev = request->wdev->netdev;
 	struct prism2_wiphy_private *priv = wiphy_priv(wiphy);
 	wlandevice_t *wlandev = dev->ml_priv;
 	struct p80211msg_dot11req_scan msg1;
-- 
1.7.10.4

