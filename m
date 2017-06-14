From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jun 2017 10:44:51 +0000
Subject: [PATCH] iwlwifi: missing error code in iwl_trans_pcie_alloc()
Message-Id: <20170614104450.GN29394@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes.berg@intel.com>, Haim Dreyfuss <haim.dreyfuss@intel.com>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Sara Sharon <sara.sharon@intel.com>, Liad Kaufman <liad.kaufman@intel.com>, Sharon Dvir <sharon.dvir@intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We don't set the error code here so we end up returning ERR_PTR(0) which
is NULL.  The caller doesn't expect that so it results in a NULL
dereference.

Fixes: 2e5d4a8f61dc ("iwlwifi: pcie: Add new configuration to enable MSIX")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/trans.c b/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
index a3c5d3b195ad..24420314f91b 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
@@ -3100,7 +3100,8 @@ struct iwl_trans *iwl_trans_pcie_alloc(struct pci_dev *pdev,
 	init_waitqueue_head(&trans_pcie->d0i3_waitq);
 
 	if (trans_pcie->msix_enabled) {
-		if (iwl_pcie_init_msix_handler(pdev, trans_pcie))
+		ret = iwl_pcie_init_msix_handler(pdev, trans_pcie);
+		if (ret)
 			goto out_no_pci;
 	 } else {
 		ret = iwl_pcie_alloc_ict(trans);
