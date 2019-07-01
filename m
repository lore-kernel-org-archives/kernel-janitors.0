From: Colin King <colin.king@canonical.com>
Date: Mon, 01 Jul 2019 16:27:59 +0000
Subject: [PATCH][next] iwlwifi: mvm: fix comparison of u32 variable with less than zero
Message-Id: <20190701162759.15418-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190701162657.15174-1-colin.king@canonical.com>
In-Reply-To: <20190701162657.15174-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haim Dreyfuss <haim.dreyfuss@intel.com>, linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The comparison of the u32 variable wgds_tbl_idx with less than zero is
always going to be false because it is unsigned.  Fix this by making
wgds_tbl_idx a plain signed int.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: 4fd445a2c855 ("iwlwifi: mvm: Add log information about SAR status")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/intel/iwlwifi/mvm/nvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/nvm.c b/drivers/net/wireless/intel/iwlwifi/mvm/nvm.c
index 719f793b3487..a9bb43a2f27b 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/nvm.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/nvm.c
@@ -620,7 +620,7 @@ void iwl_mvm_rx_chub_update_mcc(struct iwl_mvm *mvm,
 	enum iwl_mcc_source src;
 	char mcc[3];
 	struct ieee80211_regdomain *regd;
-	u32 wgds_tbl_idx;
+	int wgds_tbl_idx;
 
 	lockdep_assert_held(&mvm->mutex);
 
-- 
2.20.1
