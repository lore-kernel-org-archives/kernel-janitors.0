From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 May 2016 06:19:13 +0000
Subject: [patch] iwlwifi: mvm: remove an unused variable
Message-Id: <20160504061913.GC22064@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes.berg@intel.com>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Luca Coelho <luciano.coelho@intel.com>, Sara Sharon <sara.sharon@intel.com>, Golan Ben-Ami <golan.ben.ami@intel.com>, Avri Altman <avri.altman@intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We never initalize ampdu_status so it causes a static checker warning
when we pass it to iwl_mvm_pass_packet_to_mac80211().  Fortunately, it's
never used so we can just remove it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/rx.c b/drivers/net/wireless/intel/iwlwifi/mvm/rx.c
index 263e8a8..c9d419f 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/rx.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/rx.c
@@ -100,7 +100,7 @@ static void iwl_mvm_pass_packet_to_mac80211(struct iwl_mvm *mvm,
 					    struct napi_struct *napi,
 					    struct sk_buff *skb,
 					    struct ieee80211_hdr *hdr, u16 len,
-					    u32 ampdu_status, u8 crypt_len,
+					    u8 crypt_len,
 					    struct iwl_rx_cmd_buffer *rxb)
 {
 	unsigned int hdrlen, fraglen;
@@ -267,7 +267,6 @@ void iwl_mvm_rx_rx_mpdu(struct iwl_mvm *mvm, struct napi_struct *napi,
 	struct ieee80211_sta *sta = NULL;
 	struct sk_buff *skb;
 	u32 len;
-	u32 ampdu_status;
 	u32 rate_n_flags;
 	u32 rx_pkt_status;
 	u8 crypt_len = 0;
@@ -453,8 +452,8 @@ void iwl_mvm_rx_rx_mpdu(struct iwl_mvm *mvm, struct napi_struct *napi,
 		     mvm->sched_scan_pass_all = SCHED_SCAN_PASS_ALL_ENABLED))
 		mvm->sched_scan_pass_all = SCHED_SCAN_PASS_ALL_FOUND;
 
-	iwl_mvm_pass_packet_to_mac80211(mvm, napi, skb, hdr, len, ampdu_status,
-					crypt_len, rxb);
+	iwl_mvm_pass_packet_to_mac80211(mvm, napi, skb, hdr, len, crypt_len,
+					rxb);
 }
 
 static void iwl_mvm_update_rx_statistics(struct iwl_mvm *mvm,
