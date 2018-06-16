From: Joe Perches <joe@perches.com>
Date: Sat, 16 Jun 2018 23:00:53 +0000
Subject: Re: [PATCH v2] staging: rtl8712: Adjust if statements to reduce indentation level
Message-Id: <aa97094ecc116745d817acb762486c00b6c17507.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3225099.6uizQ2pf4A@joonhwan-virtualbox>
In-Reply-To: <3225099.6uizQ2pf4A@joonhwan-virtualbox>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joonhwan Kim <spilit464@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, liamryandev@gmail.com, martin@martinhomuth.de, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, stefano.manni@gmail.com, kernel-janitors@vger.kernel.org

On Sat, 2018-06-16 at 15:03 +0900, Joonhwan Kim wrote:
> Merge two condition of if statements in
> r8712_surveydone_event_callback()

Are you sure you are not changing the logic here?

I think it'd be nicer to refactor the code instead.

Something like:
---
 drivers/staging/rtl8712/rtl871x_mlme.c | 73 +++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_mlme.c b/drivers/staging/rtl8712/rtl871x_mlme.c
index ac547ddd72d1..d711305b33e1 100644
--- a/drivers/staging/rtl8712/rtl871x_mlme.c
+++ b/drivers/staging/rtl8712/rtl871x_mlme.c
@@ -552,6 +552,19 @@ void r8712_survey_event_callback(struct _adapter *adapter, u8 *pbuf)
 	spin_unlock_irqrestore(&pmlmepriv->lock2, flags);
 }
 
+static bool r8712_under_linking_then_join(struct mlme_priv *pmlmepriv)
+{
+	set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
+
+	if (r8712_select_and_join_from_scan(pmlmepriv) != _SUCCESS)
+		return false;
+
+	mod_timer(&pmlmepriv->assoc_timer,
+		  jiffies + msecs_to_jiffies(MAX_JOIN_TIMEOUT));
+
+	return true;
+}
+
 void r8712_surveydone_event_callback(struct _adapter *adapter, u8 *pbuf)
 {
 	unsigned long irqL;
@@ -565,45 +578,31 @@ void r8712_surveydone_event_callback(struct _adapter *adapter, u8 *pbuf)
 		_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
 	}
 
-	if (pmlmepriv->to_join) {
-		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
-			if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
-				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
+	if (!pmlmepriv->to_join)
+		goto exit;
+
+	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
+		if (check_fwstate(pmlmepriv, _FW_LINKED) ||
+		    r8712_under_linking_then_join(pmlmepriv))
+			goto exit;
+
+		pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;
+		memcpy(&adapter->registrypriv.dev_network.Ssid,
+		       &pmlmepriv->assoc_ssid,
+		       sizeof(struct ndis_802_11_ssid));
+		r8712_update_registrypriv_dev_network(adapter);
+		r8712_generate_random_ibss(adapter->registrypriv.dev_network.MacAddress);
+		pmlmepriv->fw_state = WIFI_ADHOC_MASTER_STATE;
+		pmlmepriv->to_join = false;
+	} else {
+		pmlmepriv->to_join = false;
+		if (r8712_under_linking_then_join(pmlmepriv))
+			goto exit;
 
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
-			}
-		} else {
-			pmlmepriv->to_join = false;
-			set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
-			if (r8712_select_and_join_from_scan(pmlmepriv) =
-			    _SUCCESS)
-				mod_timer(&pmlmepriv->assoc_timer, jiffies +
-					  msecs_to_jiffies(MAX_JOIN_TIMEOUT));
-			else
-				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
-		}
+		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 	}
+
+exit:
 	spin_unlock_irqrestore(&pmlmepriv->lock, irqL);
 }
 
