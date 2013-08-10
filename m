From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 10 Aug 2013 23:03:21 +0000
Subject: [patch] iwlwifi: pcie: returning positive instead of negative
Message-Id: <20130810230321.GA19051@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes.berg@intel.com>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a missing '-' character here so we return positive 'ENOMEM'
instead of negative.  The caller doesn't care.  All non-zero returns
are translated to '-ENOMEM' in iwl_pcie_nic_init().

This is just a cleanup.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/iwlwifi/pcie/tx.c b/drivers/net/wireless/iwlwifi/pcie/tx.c
index 134f7a1..a81d227 100644
--- a/drivers/net/wireless/iwlwifi/pcie/tx.c
+++ b/drivers/net/wireless/iwlwifi/pcie/tx.c
@@ -829,7 +829,7 @@ static int iwl_pcie_tx_alloc(struct iwl_trans *trans)
 				  sizeof(struct iwl_txq), GFP_KERNEL);
 	if (!trans_pcie->txq) {
 		IWL_ERR(trans, "Not enough memory for txq\n");
-		ret = ENOMEM;
+		ret = -ENOMEM;
 		goto error;
 	}
 
