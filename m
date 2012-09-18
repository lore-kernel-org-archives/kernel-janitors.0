From: Emil Goode <emilgoode@gmail.com>
Date: Tue, 18 Sep 2012 16:04:07 +0000
Subject: [PATCH] staging: wlan-ng: Fix dereference before NULL check
Message-Id: <1347984247-9226-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, dan.carpenter@oracle.com, krzysztof.wilczynski@linux.com, devendra.aaru@gmail.com
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

Smatch is warning about a dereference before we check for NULL.
This patch moves the dereference to after the NULL check.

Smatch warning:
drivers/staging/wlan-ng/cfg80211.c:345 prism2_scan() warn:
	variable dereferenced before check 'request' (see line 332)

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
Introduced by my commit 01f8a27e

 drivers/staging/wlan-ng/cfg80211.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
index 0970127..57a2b05 100644
--- a/drivers/staging/wlan-ng/cfg80211.c
+++ b/drivers/staging/wlan-ng/cfg80211.c
@@ -329,9 +329,9 @@ int prism2_get_station(struct wiphy *wiphy, struct net_device *dev,
 
 int prism2_scan(struct wiphy *wiphy, struct cfg80211_scan_request *request)
 {
-	struct net_device *dev = request->wdev->netdev;
+	struct net_device *dev;
 	struct prism2_wiphy_private *priv = wiphy_priv(wiphy);
-	wlandevice_t *wlandev = dev->ml_priv;
+	wlandevice_t *wlandev;
 	struct p80211msg_dot11req_scan msg1;
 	struct p80211msg_dot11req_scan_results msg2;
 	struct cfg80211_bss *bss;
@@ -345,6 +345,9 @@ int prism2_scan(struct wiphy *wiphy, struct cfg80211_scan_request *request)
 	if (!request)
 		return -EINVAL;
 
+	dev = request->wdev->netdev;
+	wlandev = dev->ml_priv;
+
 	if (priv->scan_request && priv->scan_request != request)
 		return -EBUSY;
 
-- 
1.7.10.4

