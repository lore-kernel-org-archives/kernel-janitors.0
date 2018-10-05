From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 05 Oct 2018 10:47:01 +0000
Subject: [PATCH] iwlwifi: mvm: remove set but not used variable 'he_phy_data'
Message-Id: <1538736421-97401-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Golan Ben Ami <golan.ben.ami@intel.com>, Sara Sharon <sara.sharon@intel.com>, Shaul Triebitz <shaul.triebitz@intel.com>, Liad Kaufman <liad.kaufman@intel.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c: In function 'iwl_mvm_rx_mpdu_mq':
drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c:1386:7: warning:
 variable 'he_phy_data' set but not used [-Wunused-but-set-variable]
   u64 he_phy_data;
   
'he_phy_data' never used since be introduce in
commit 18ead597daa1 ("iwlwifi: support new rx_mpdu_desc api")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c b/drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c
index 894dd63..7eaa586 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c
@@ -1383,12 +1383,6 @@ void iwl_mvm_rx_mpdu_mq(struct iwl_mvm *mvm, struct napi_struct *napi,
 	/* update aggregation data for monitor sake on default queue */
 	if (!queue && (phy_info & IWL_RX_MPDU_PHY_AMPDU)) {
 		bool toggle_bit = phy_info & IWL_RX_MPDU_PHY_AMPDU_TOGGLE;
-		u64 he_phy_data;
-
-		if (mvm->trans->cfg->device_family >= IWL_DEVICE_FAMILY_22560)
-			he_phy_data = le64_to_cpu(desc->v3.he_phy_data);
-		else
-			he_phy_data = le64_to_cpu(desc->v1.he_phy_data);
 
 		rx_status->flag |= RX_FLAG_AMPDU_DETAILS;
 		rx_status->ampdu_reference = mvm->ampdu_ref;
