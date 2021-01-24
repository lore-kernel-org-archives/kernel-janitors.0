From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 24 Jan 2021 08:11:07 +0000
Subject: [PATCH v2] iwlwifi: mvm: Fix an error handling path in 'iwl_mvm_wowlan_config_key_params()'
Message-Id: <20210124081107.732360-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: luciano.coelho@intel.com, kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org, mordechay.goodstein@intel.com, johannes.berg@intel.com, sara.sharon@intel.com, nathan.errera@intel.com, Dan1.Halperin@intel.com, emmanuel.grumbach@intel.com, naftali.goldstein@intel.com, netdev@vger.kernel.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If the 'cmd_ver' check fails, we must release some memory as already done
in all the other error handling paths of this function.

Fixes: 9e3c39361a30 ("iwlwifi: mvm: support new KEK KCK api")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v1->v2: Fix the subject
---
 drivers/net/wireless/intel/iwlwifi/mvm/d3.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/d3.c b/drivers/net/wireless/intel/iwlwifi/mvm/d3.c
index c025188fa9bc..2fb897cbfca6 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/d3.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/d3.c
@@ -810,8 +810,10 @@ static int iwl_mvm_wowlan_config_key_params(struct iwl_mvm *mvm,
 						WOWLAN_KEK_KCK_MATERIAL,
 						IWL_FW_CMD_VER_UNKNOWN);
 		if (WARN_ON(cmd_ver != 2 && cmd_ver != 3 &&
-			    cmd_ver != IWL_FW_CMD_VER_UNKNOWN))
-			return -EINVAL;
+			    cmd_ver != IWL_FW_CMD_VER_UNKNOWN)) {
+			ret = -EINVAL;
+			goto out;
+		}
 		if (cmd_ver = 3)
 			cmd_size = sizeof(struct iwl_wowlan_kek_kck_material_cmd_v3);
 		else
-- 
2.27.0
