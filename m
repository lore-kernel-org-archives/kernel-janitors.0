From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 06 Apr 2019 03:12:25 +0000
Subject: [PATCH -next] staging: rtlwifi: base: Remove set but not used variables
Message-Id: <20190406031225.60088-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Payal Kshirsagar <payal.s.kshirsagar.98@gmail.com>, Sohil Ladhani <supertakumi86@gmail.com>, Cristian Sicilia <sicilia.cristian@gmail.com>, Luke Triantafyllidis <ltriant@cpan.org>, Nathan Chancellor <natechancellor@gmail.com>, Luca Coelho <luciano.coelho@intel.com>
Cc: YueHaibing <yuehaibing@huawei.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/staging/rtlwifi/base.c: In function 'rtl_tx_agg_stop':
drivers/staging/rtlwifi/base.c:1733:23: warning:
 variable 'tid_data' set but not used [-Wunused-but-set-variable]

drivers/staging/rtlwifi/base.c: In function 'rtl_check_beacon_key':
drivers/staging/rtlwifi/base.c:2474:5: warning:
 variable 'ds_param_len' set but not used [-Wunused-but-set-variable]

drivers/staging/rtlwifi/base.c:2472:5: warning:
 variable 'ht_oper_len' set but not used [-Wunused-but-set-variable]

drivers/staging/rtlwifi/base.c:2470:5: warning:
 variable 'ht_cap_len' set but not used [-Wunused-but-set-variable]

They are never used and can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/rtlwifi/base.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtlwifi/base.c b/drivers/staging/rtlwifi/base.c
index b8358ebbf912..b8b89e4c54d4 100644
--- a/drivers/staging/rtlwifi/base.c
+++ b/drivers/staging/rtlwifi/base.c
@@ -1730,7 +1730,6 @@ int rtl_tx_agg_stop(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		    struct ieee80211_sta *sta, u16 tid)
 {
 	struct rtl_priv *rtlpriv = rtl_priv(hw);
-	struct rtl_tid_data *tid_data;
 	struct rtl_sta_info *sta_entry = NULL;
 
 	if (!sta)
@@ -1743,7 +1742,6 @@ int rtl_tx_agg_stop(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		return -EINVAL;
 
 	sta_entry = (struct rtl_sta_info *)sta->drv_priv;
-	tid_data = &sta_entry->tids[tid];
 	sta_entry->tids[tid].agg.agg_state = RTL_AGG_STOP;
 
 	ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
@@ -2467,11 +2465,8 @@ bool rtl_check_beacon_key(struct ieee80211_hw *hw, void *data, unsigned int len)
 	struct rtl_beacon_keys bcn_key = {};
 	struct rtl_beacon_keys *cur_bcn_key;
 	u8 *ht_cap;
-	u8 ht_cap_len;
 	u8 *ht_oper;
-	u8 ht_oper_len;
 	u8 *ds_param;
-	u8 ds_param_len;
 
 	if (mac->opmode != NL80211_IFTYPE_STATION)
 		return false;
@@ -2502,18 +2497,15 @@ bool rtl_check_beacon_key(struct ieee80211_hw *hw, void *data, unsigned int len)
 	/***** Parsing DS Param IE ******/
 	ds_param = rtl_find_ie(data, len - FCS_LEN, WLAN_EID_DS_PARAMS);
 
-	if (ds_param && !(ds_param[1] < sizeof(*ds_param))) {
-		ds_param_len = ds_param[1];
+	if (ds_param && !(ds_param[1] < sizeof(*ds_param)))
 		bcn_key.bcn_channel = ds_param[2];
-	} else {
+	else
 		ds_param = NULL;
-	}
 
 	/***** Parsing HT Cap. IE ******/
 	ht_cap = rtl_find_ie(data, len - FCS_LEN, WLAN_EID_HT_CAPABILITY);
 
 	if (ht_cap && !(ht_cap[1] < sizeof(*ht_cap))) {
-		ht_cap_len = ht_cap[1];
 		ht_cap_ie = (struct ieee80211_ht_cap *)&ht_cap[2];
 		bcn_key.ht_cap_info = ht_cap_ie->cap_info;
 	} else  {
@@ -2523,12 +2515,10 @@ bool rtl_check_beacon_key(struct ieee80211_hw *hw, void *data, unsigned int len)
 	/***** Parsing HT Info. IE ******/
 	ht_oper = rtl_find_ie(data, len - FCS_LEN, WLAN_EID_HT_OPERATION);
 
-	if (ht_oper && !(ht_oper[1] < sizeof(*ht_oper))) {
-		ht_oper_len = ht_oper[1];
+	if (ht_oper && !(ht_oper[1] < sizeof(*ht_oper)))
 		ht_oper_ie = (struct ieee80211_ht_operation *)&ht_oper[2];
-	} else {
+	else
 		ht_oper = NULL;
-	}
 
 	/* update bcn_key */
 
