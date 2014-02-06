From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Feb 2014 20:42:42 +0000
Subject: [patch] staging: r8188eu: memory corruption handling long ssids
Message-Id: <20140206204241.GA20028@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We should cap the SSID length at NDIS_802_11_LENGTH_SSID (32) characters
to avoid memory corruption.  If the SSID is too long then I have opted
to ignore it instead of truncating it.

We don't need to clear bssid->Ssid.Ssid[0] because this struct is
allocated with rtw_zmalloc()

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8188eu/core/rtw_wlan_util.c b/drivers/staging/rtl8188eu/core/rtw_wlan_util.c
index 153ec61493ab..96df62f95b6b 100644
--- a/drivers/staging/rtl8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8188eu/core/rtw_wlan_util.c
@@ -912,12 +912,12 @@ int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len)
 	unsigned char *pbuf;
 	u32 wpa_ielen = 0;
 	u8 *pbssid = GetAddr3Ptr(pframe);
-	u32 hidden_ssid = 0;
 	struct HT_info_element *pht_info = NULL;
 	struct rtw_ieee80211_ht_cap *pht_cap = NULL;
 	u32 bcn_channel;
 	unsigned short	ht_cap_info;
 	unsigned char	ht_info_infos_0;
+	int ssid_len;
 
 	if (is_client_associated_to_ap(Adapter) = false)
 		return true;
@@ -999,21 +999,15 @@ int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len)
 	}
 
 	/* checking SSID */
+	ssid_len = 0;
 	p = rtw_get_ie(bssid->IEs + _FIXED_IE_LENGTH_, _SSID_IE_, &len, bssid->IELength - _FIXED_IE_LENGTH_);
-	if (p = NULL) {
-		DBG_88E("%s marc: cannot find SSID for survey event\n", __func__);
-		hidden_ssid = true;
-	} else {
-		hidden_ssid = false;
-	}
-
-	if ((NULL != p) && (false = hidden_ssid && (*(p + 1)))) {
-		memcpy(bssid->Ssid.Ssid, (p + 2), *(p + 1));
-		bssid->Ssid.SsidLength = *(p + 1);
-	} else {
-		bssid->Ssid.SsidLength = 0;
-		bssid->Ssid.Ssid[0] = '\0';
+	if (p) {
+		ssid_len = *(p + 1);
+		if (ssid_len > NDIS_802_11_LENGTH_SSID)
+			ssid_len = 0;
 	}
+	memcpy(bssid->Ssid.Ssid, (p + 2), ssid_len);
+	bssid->Ssid.SsidLength = ssid_len;
 
 	RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("%s bssid.Ssid.Ssid:%s bssid.Ssid.SsidLength:%d "
 				"cur_network->network.Ssid.Ssid:%s len:%d\n", __func__, bssid->Ssid.Ssid,
