From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Apr 2017 10:39:38 +0000
Subject: [PATCH] iwlwifi: pcie: missing unlock on error path
Message-Id: <20170421103937.jko3eguvfn3i6r3v@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes.berg@intel.com>, Sara Sharon <sara.sharon@intel.com>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We should unlock before returning.

Fixes: eda50cde58de ("iwlwifi: pcie: add context information support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c b/drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c
index 302310dfef9e..4e84955d55c8 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c
@@ -212,8 +212,10 @@ int iwl_trans_pcie_gen2_start_fw(struct iwl_trans *trans,
 		goto out;
 	}
 
-	if (iwl_pcie_ctxt_info_init(trans, fw))
-		return -ENOMEM;
+	if (iwl_pcie_ctxt_info_init(trans, fw)) {
+		ret = -ENOMEM;
+		goto out;
+	}
 
 	/* re-check RF-Kill state since we may have missed the interrupt */
 	hw_rfkill = iwl_trans_check_hw_rf_kill(trans);
