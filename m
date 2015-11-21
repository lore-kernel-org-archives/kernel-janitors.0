From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 21 Nov 2015 10:33:38 +0000
Subject: [patch] iwlwifi: mvm: rs: fix a warning message
Message-Id: <20151121103338.GE7002@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes.berg@intel.com>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Eyal Shapira <eyal@wizery.com>, Luca Coelho <luciano.coelho@intel.com>, Liad Kaufman <liad.kaufman@intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

WARN_ON_ONCE() doesn't take a message, it only takes a condition.  I
have changed this to WARN(1, ...).

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/iwlwifi/mvm/rs.c b/drivers/net/wireless/iwlwifi/mvm/rs.c
index d1ad103..58d7bee 100644
--- a/drivers/net/wireless/iwlwifi/mvm/rs.c
+++ b/drivers/net/wireless/iwlwifi/mvm/rs.c
@@ -1827,7 +1827,7 @@ static int rs_switch_to_column(struct iwl_mvm *mvm,
 		rate->type = lq_sta->is_vht ? LQ_VHT_MIMO2 : LQ_HT_MIMO2;
 		rate_mask = lq_sta->active_mimo2_rate;
 	} else {
-		WARN_ON_ONCE("Bad column mode");
+		WARN_ONCE(1, "Bad column mode");
 	}
 
 	if (column->mode != RS_LEGACY) {
