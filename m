From: Colin King <colin.king@canonical.com>
Date: Thu, 28 Jan 2021 16:39:47 +0000
Subject: [PATCH] iwlwifi: mvm: remove redundant initialization of variable phy_id
Message-Id: <20210128163947.643705-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Coelho <luciano.coelho@intel.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable phy_id is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/intel/iwlwifi/mvm/quota.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/quota.c b/drivers/net/wireless/intel/iwlwifi/mvm/quota.c
index 3d0166df2002..4a0ba7f44900 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/quota.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/quota.c
@@ -90,7 +90,7 @@ static void iwl_mvm_adjust_quota_for_noa(struct iwl_mvm *mvm,
 {
 #ifdef CONFIG_NL80211_TESTMODE
 	struct iwl_mvm_vif *mvmvif;
-	int i, phy_id = -1, beacon_int = 0;
+	int i, phy_id, beacon_int = 0;
 
 	if (!mvm->noa_duration || !mvm->noa_vif)
 		return;
-- 
2.29.2
