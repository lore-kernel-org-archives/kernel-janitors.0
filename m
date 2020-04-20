From: Colin King <colin.king@canonical.com>
Date: Mon, 20 Apr 2020 22:24:49 +0000
Subject: [PATCH] iwlwifi: mvm: remove redundant assignment to variable ret
Message-Id: <20200420222449.99481-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being assigned with a value that is never read
and it is being updated later with a new value. The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/intel/iwlwifi/mvm/rs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/rs.c b/drivers/net/wireless/intel/iwlwifi/mvm/rs.c
index c1aba2bf73cf..852ccfc65378 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/rs.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/rs.c
@@ -604,7 +604,7 @@ static int rs_tl_turn_on_agg_for_tid(struct iwl_mvm *mvm,
 				     struct iwl_lq_sta *lq_data, u8 tid,
 				     struct ieee80211_sta *sta)
 {
-	int ret = -EAGAIN;
+	int ret;
 
 	IWL_DEBUG_HT(mvm, "Starting Tx agg: STA: %pM tid: %d\n",
 		     sta->addr, tid);
-- 
2.25.1
