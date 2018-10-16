From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Oct 2018 17:22:51 +0000
Subject: [PATCH] iwlwifi: mvm: fix spelling mistake "Recieved" -> "Received"
Message-Id: <20181016172251.1227-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in IWL_DEBUG_TE message text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c b/drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c
index 505b0385d800..271db16cf0c8 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c
@@ -3351,7 +3351,7 @@ static bool iwl_mvm_rx_aux_roc(struct iwl_notif_wait_data *notif_wait,
 	resp = (void *)pkt->data;
 
 	IWL_DEBUG_TE(mvm,
-		     "Aux ROC: Recieved response from ucode: status=%d uid=%d\n",
+		     "Aux ROC: Received response from ucode: status=%d uid=%d\n",
 		     resp->status, resp->event_unique_id);
 
 	te_data->uid = le32_to_cpu(resp->event_unique_id);
-- 
2.19.1
