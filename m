From: Joonhwan Kim <spilit464@gmail.com>
Date: Sat, 16 Jun 2018 06:03:22 +0000
Subject: [PATCH v2] staging: rtl8712: Adjust if statements to reduce indentation level
Message-Id: <3225099.6uizQ2pf4A@joonhwan-virtualbox>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, liamryandev@gmail.com, martin@martinhomuth.de, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, stefano.manni@gmail.com, kernel-janitors@vger.kernel.org

Merge two condition of if statements in
r8712_surveydone_event_callback()

Signed-off-by: Joonhwan Kim <spilit464@gmail.com>
---
v2: fix my name without period in email header

 drivers/staging/rtl8712/rtl871x_mlme.c | 51 +++++++++++++-------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_mlme.c b/drivers/staging/rtl8712/rtl871x_mlme.c
index ac547ddd72d1..b8618b0565d5 100644
--- a/drivers/staging/rtl8712/rtl871x_mlme.c
+++ b/drivers/staging/rtl8712/rtl871x_mlme.c
@@ -566,32 +566,31 @@ void r8712_surveydone_event_callback(struct _adapter *adapter, u8 *pbuf)
 	}
 
 	if (pmlmepriv->to_join) {
-		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
-			if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
-				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
-
-				if (r8712_select_and_join_from_scan(pmlmepriv)
-				    = _SUCCESS) {
-					mod_timer(&pmlmepriv->assoc_timer, jiffies +
-						  msecs_to_jiffies(MAX_JOIN_TIMEOUT));
-				} else {
-					struct wlan_bssid_ex *pdev_network -					  &(adapter->registrypriv.dev_network);
-					u8 *pibss -						 adapter->registrypriv.
-							dev_network.MacAddress;
-					pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;
-					memcpy(&pdev_network->Ssid,
-						&pmlmepriv->assoc_ssid,
-						sizeof(struct
-							 ndis_802_11_ssid));
-					r8712_update_registrypriv_dev_network
-						(adapter);
-					r8712_generate_random_ibss(pibss);
-					pmlmepriv->fw_state -						 WIFI_ADHOC_MASTER_STATE;
-					pmlmepriv->to_join = false;
-				}
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) &&
+		    !check_fwstate(pmlmepriv, _FW_LINKED)) {
+			set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
+
+			if (r8712_select_and_join_from_scan(pmlmepriv)
+			    = _SUCCESS) {
+				mod_timer(&pmlmepriv->assoc_timer, jiffies +
+					  msecs_to_jiffies(MAX_JOIN_TIMEOUT));
+			} else {
+				struct wlan_bssid_ex *pdev_network +				  &(adapter->registrypriv.dev_network);
+				u8 *pibss +					 adapter->registrypriv.
+						dev_network.MacAddress;
+				pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;
+				memcpy(&pdev_network->Ssid,
+					&pmlmepriv->assoc_ssid,
+					sizeof(struct
+						 ndis_802_11_ssid));
+				r8712_update_registrypriv_dev_network
+					(adapter);
+				r8712_generate_random_ibss(pibss);
+				pmlmepriv->fw_state +					 WIFI_ADHOC_MASTER_STATE;
+				pmlmepriv->to_join = false;
 			}
 		} else {
 			pmlmepriv->to_join = false;
-- 
2.17.1




