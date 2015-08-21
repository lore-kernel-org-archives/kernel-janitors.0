From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Aug 2015 08:48:21 +0000
Subject: [patch] iwlwifi: mvm: catch underflow error earlier
Message-Id: <20150821084821.GC25369@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes.berg@intel.com>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, Kalle Valo <kvalo@codeaurora.org>, Luciano Coelho <luciano.coelho@intel.com>, Eliad Peller <eliad@wizery.com>, Liad Kaufman <liad.kaufman@intel.com>, Matti Gottlieb <matti.gottlieb@intel.com>, Alexander Bondar <alexander.bondar@intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains that we don't check for underflows in
iwl_dbgfs_fw_dbg_conf_write().  This is harmless because we have a
sanity check in iwl_mvm_start_fw_dbg_conf(), but we may as well make
this unsigned and silence the underflow warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/iwlwifi/mvm/debugfs.c b/drivers/net/wireless/iwlwifi/mvm/debugfs.c
index ca4a1f8..7d69a55 100644
--- a/drivers/net/wireless/iwlwifi/mvm/debugfs.c
+++ b/drivers/net/wireless/iwlwifi/mvm/debugfs.c
@@ -949,9 +949,10 @@ static ssize_t iwl_dbgfs_fw_dbg_conf_write(struct iwl_mvm *mvm,
 					   char *buf, size_t count,
 					   loff_t *ppos)
 {
-	int ret, conf_id;
+	unsigned int conf_id;
+	int ret;
 
-	ret = kstrtoint(buf, 0, &conf_id);
+	ret = kstrtouint(buf, 0, &conf_id);
 	if (ret)
 		return ret;
 
