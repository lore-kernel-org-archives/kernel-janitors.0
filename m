From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Mar 2017 07:56:19 +0000
Subject: [PATCH] staging: rtl8188eu: fix some inverted conditions
Message-Id: <20170314075619.GC6061@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We converted these conditions from = NULL and != NULL but messed up
and inverted some.

Fixes: e31447f934d3 ("staging: rtl8188eu: Replace x=NULL by !x")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/core/rtw_mlme.c
index 6b1a758618cc..301085a459c9 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme.c
@@ -524,7 +524,7 @@ static int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *
 	privacy = pnetwork->network.Privacy;
 
 	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
-		if (!rtw_get_wps_ie(pnetwork->network.IEs+_FIXED_IE_LENGTH_, pnetwork->network.IELength-_FIXED_IE_LENGTH_, NULL, &wps_ielen))
+		if (rtw_get_wps_ie(pnetwork->network.IEs+_FIXED_IE_LENGTH_, pnetwork->network.IELength-_FIXED_IE_LENGTH_, NULL, &wps_ielen))
 			return true;
 		else
 			return false;
@@ -1136,7 +1136,7 @@ static u8 search_max_mac_id(struct adapter *padapter)
 #if defined(CONFIG_88EU_AP_MODE)
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		for (aid = (pstapriv->max_num_sta); aid > 0; aid--) {
-			if (!pstapriv->sta_aid[aid-1])
+			if (pstapriv->sta_aid[aid-1])
 				break;
 		}
 		mac_id = aid + 1;
@@ -1189,7 +1189,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 #endif
 	/* for AD-HOC mode */
 	psta = rtw_get_stainfo(&adapter->stapriv, pstassoc->macaddr);
-	if (!psta) {
+	if (psta) {
 		/* the sta have been in sta_info_queue => do nothing */
 		RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("Error: rtw_stassoc_event_callback: sta has been in sta_hash_queue\n"));
 		return; /* between drv has received this event before and  fw have not yet to set key to CAM_ENTRY) */
@@ -2085,7 +2085,7 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 
 	struct wlan_network *pnetwork;
 
-	if (!tgt_network)
+	if (tgt_network)
 		pnetwork = tgt_network;
 	else
 		pnetwork = &pmlmepriv->cur_network;
