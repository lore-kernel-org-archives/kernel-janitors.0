From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Apr 2017 19:46:19 +0000
Subject: [PATCH] iwlwifi: pcie: off by one in iwl_trans_pcie_dyn_txq_alloc()
Message-Id: <20170421194619.sjc33647odsfkcfl@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes.berg@intel.com>, Sara Sharon <sara.sharon@intel.com>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The > should be >= or we are writing one space beyond the end of the
array.

Fixes: 310181ec34e2 ("iwlwifi: move to TVQM mode")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c b/drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c
index 9fb46a6f47cf..295331558108 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c
@@ -912,7 +912,7 @@ int iwl_trans_pcie_dyn_txq_alloc(struct iwl_trans *trans,
 	rsp = (void *)hcmd.resp_pkt->data;
 	qid = le16_to_cpu(rsp->queue_number);
 
-	if (qid > ARRAY_SIZE(trans_pcie->txq)) {
+	if (qid >= ARRAY_SIZE(trans_pcie->txq)) {
 		WARN_ONCE(1, "queue index %d unsupported", qid);
 		ret = -EIO;
 		goto error;
