From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 Mar 2017 10:40:00 +0000
Subject: [PATCH] iwlwifi: mvm: writing zero bytes to debugfs causes a crash
Message-Id: <20170323104000.GB20154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes.berg@intel.com>, Golan Ben-Ami <golan.ben.ami@intel.com>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Sara Sharon <sara.sharon@intel.com>, Ido Yariv <ido@wizery.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a static analysis fix.  The warning is:

	drivers/net/wireless/intel/iwlwifi/mvm/fw-dbg.c:912 iwl_mvm_fw_dbg_collect()
	warn: integer overflows 'sizeof(*desc) + len'

I guess this code is supposed to take a NUL character, but if we write
zero bytes then it tries to write -1 characters and crashes.

Fixes: c91b865cb14d ("iwlwifi: mvm: support description for user triggered fw dbg collection")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c b/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c
index a260cd503200..077bfd8f4c0c 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c
@@ -1056,6 +1056,8 @@ static ssize_t iwl_dbgfs_fw_dbg_collect_write(struct iwl_mvm *mvm,
 
 	if (ret)
 		return ret;
+	if (count = 0)
+		return 0;
 
 	iwl_mvm_fw_dbg_collect(mvm, FW_DBG_TRIGGER_USER, buf,
 			       (count - 1), NULL);
