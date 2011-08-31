From: Dan Carpenter <error27@gmail.com>
Date: Wed, 31 Aug 2011 06:37:42 +0000
Subject: [patch -next 1/2] iwlwifi: fix double assign in
Message-Id: <20110831063742.GC3705@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: emmanuel.grumbach@intel.com
Cc: Wey-Yi Guy <wey-yi.w.guy@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, "open list:INTEL WIRELESS WI..." <linux-wireless@vger.kernel.org>, kernel-janitors@vger.kernel.org

"vif" is assigned twice.  We can remove the first one.

This silences a Smatch warning that "ctx" could be one step past the
end of the priv->contexts[] array.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/wireless/iwlwifi/iwl-core.c b/drivers/net/wireless/iwlwifi/iwl-core.c
index 20dd1a5..72b9203 100644
--- a/drivers/net/wireless/iwlwifi/iwl-core.c
+++ b/drivers/net/wireless/iwlwifi/iwl-core.c
@@ -1842,7 +1842,7 @@ void iwl_start_tx_ba_trans_ready(struct iwl_priv *priv,
 				 enum iwl_rxon_context_id ctx,
 				 u8 sta_id, u8 tid)
 {
-	struct ieee80211_vif *vif = priv->contexts[ctx].vif;
+	struct ieee80211_vif *vif;
 	u8 *addr = priv->stations[sta_id].sta.sta.addr;
 
 	if (ctx = NUM_IWL_RXON_CTX)
