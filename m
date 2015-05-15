From: chaehyun lim <chaehyun.lim@gmail.com>
Date: Fri, 15 May 2015 13:13:43 +0000
Subject: [PATCH] staging: wlan-ng: fix checkpatch warnings
Message-Id: <1431695623-17909-1-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

clean up checkpatch.pl in prism2sta.c
 WARNING : line over 80 characters

Signed-off-by: chaehyun lim <chaehyun.lim@gmail.com>
---
 drivers/staging/wlan-ng/prism2sta.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2sta.c b/drivers/staging/wlan-ng/prism2sta.c
index ddb294e..0329c52 100644
--- a/drivers/staging/wlan-ng/prism2sta.c
+++ b/drivers/staging/wlan-ng/prism2sta.c
@@ -428,7 +428,8 @@ u32 prism2sta_ifstate(wlandevice_t *wlandev, u32 ifstate)
 			result = hfa384x_drvr_start(hw);
 			if (result) {
 				netdev_err(wlandev->netdev,
-				       "hfa384x_drvr_start() failed,result=%d\n", (int)result);
+					   "hfa384x_drvr_start() failed,result=%d\n",
+					   (int)result);
 				result  				 P80211ENUM_resultcode_implementation_failure;
 				wlandev->msdstate = WLAN_MSD_HWPRESENT;
@@ -471,7 +472,8 @@ u32 prism2sta_ifstate(wlandevice_t *wlandev, u32 ifstate)
 			result = hfa384x_drvr_start(hw);
 			if (result) {
 				netdev_err(wlandev->netdev,
-				       "hfa384x_drvr_start() failed,result=%d\n", (int)result);
+					   "hfa384x_drvr_start() failed,result=%d\n",
+					   (int)result);
 				result  				  P80211ENUM_resultcode_implementation_failure;
 				wlandev->msdstate = WLAN_MSD_HWPRESENT;
@@ -481,7 +483,8 @@ u32 prism2sta_ifstate(wlandevice_t *wlandev, u32 ifstate)
 			result = prism2sta_getcardinfo(wlandev);
 			if (result) {
 				netdev_err(wlandev->netdev,
-				       "prism2sta_getcardinfo() failed,result=%d\n", (int)result);
+					   "prism2sta_getcardinfo() failed,result=%d\n",
+					   (int)result);
 				result  				  P80211ENUM_resultcode_implementation_failure;
 				hfa384x_drvr_stop(hw);
@@ -491,7 +494,8 @@ u32 prism2sta_ifstate(wlandevice_t *wlandev, u32 ifstate)
 			result = prism2sta_globalsetup(wlandev);
 			if (result) {
 				netdev_err(wlandev->netdev,
-				       "prism2sta_globalsetup() failed,result=%d\n", (int)result);
+					   "prism2sta_globalsetup() failed,result=%d\n",
+					   (int)result);
 				result  				  P80211ENUM_resultcode_implementation_failure;
 				hfa384x_drvr_stop(hw);
@@ -1244,9 +1248,9 @@ void prism2sta_processing_defer(struct work_struct *data)
 				     HFA384x_RID_CURRENTSSID, result);
 				return;
 			}
-			prism2mgmt_bytestr2pstr((struct hfa384x_bytestr *) &ssid,
-						(p80211pstrd_t *) &
-						wlandev->ssid);
+			prism2mgmt_bytestr2pstr(
+					(struct hfa384x_bytestr *) &ssid,
+					(p80211pstrd_t *) &wlandev->ssid);
 
 			/* Collect the port status */
 			result = hfa384x_drvr_getconfig16(hw,
@@ -1658,8 +1662,9 @@ static void prism2sta_inf_authreq_defer(wlandevice_t *wlandev,
 			if (hw->authlist.cnt >= WLAN_AUTH_MAX) {
 				rec.status = P80211ENUM_status_ap_full;
 			} else {
-				ether_addr_copy(hw->authlist.addr[hw->authlist.cnt],
-						rec.address);
+				ether_addr_copy(
+					hw->authlist.addr[hw->authlist.cnt],
+					rec.address);
 				hw->authlist.cnt++;
 				added = 1;
 			}
-- 
1.9.1

