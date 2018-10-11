From: Colin King <colin.king@canonical.com>
Date: Thu, 11 Oct 2018 09:57:57 +0000
Subject: [PATCH] iwlwifi: fix spelling mistake "registrating" -> "registering"
Message-Id: <20181011095757.18475-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in IWL_ERR error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/intel/iwlwifi/dvm/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/main.c b/drivers/net/wireless/intel/iwlwifi/dvm/main.c
index 1088ff036e13..a5041d92babc 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/main.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/main.c
@@ -1054,7 +1054,7 @@ static void iwl_bg_restart(struct work_struct *data)
 			ieee80211_restart_hw(priv->hw);
 		else
 			IWL_ERR(priv,
-				"Cannot request restart before registrating with mac80211\n");
+				"Cannot request restart before registering with mac80211\n");
 	} else {
 		WARN_ON(1);
 	}
-- 
2.17.1
