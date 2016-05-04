From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 May 2016 06:19:54 +0000
Subject: [patch] iwlwifi: mvm: silence unintialized variable warning
Message-Id: <20160504061954.GD22064@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes.berg@intel.com>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Sara Sharon <sara.sharon@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Golan Ben-Ami <golan.ben.ami@intel.com>, Moshe Harel <moshe.harel@intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

"max_amsdu_len" isn't set if kstrtouint() fails.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c b/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c
index 362a546..cb8db23 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c
@@ -1020,6 +1020,8 @@ static ssize_t iwl_dbgfs_max_amsdu_len_write(struct iwl_mvm *mvm,
 	int ret;
 
 	ret = kstrtouint(buf, 0, &max_amsdu_len);
+	if (ret)
+		return ret;
 
 	if (max_amsdu_len > IEEE80211_MAX_MPDU_LEN_VHT_11454)
 		return -EINVAL;
