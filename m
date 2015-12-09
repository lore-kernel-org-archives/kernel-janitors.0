From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Dec 2015 10:26:08 +0000
Subject: [patch] iwlwifi: mvm: remove an extra tab
Message-Id: <20151209102608.GF3173@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes.berg@intel.com>, Golan Ben-Ami <golan.ben.ami@intel.com>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch prints a static checker warning here:

    drivers/net/wireless/intel/iwlwifi/mvm/fw-dbg.c:386 iwl_dump_prph()
    warn: curly braces intended?

Curly braces are NOT intended, the extra tab was added by mistake in
commit 1a616dd2f171 ('iwlwifi: dump prph registers in a common place
for all transports').

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/fw-dbg.c b/drivers/net/wireless/intel/iwlwifi/mvm/fw-dbg.c
index 9fcabc5..a6985da 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/fw-dbg.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/fw-dbg.c
@@ -383,7 +383,7 @@ static u32 iwl_dump_prph(struct iwl_trans *trans,
 			*val++ = cpu_to_le32(iwl_read_prph_no_grab(trans,
 								   reg));
 
-			*data = iwl_fw_error_next_data(*data);
+		*data = iwl_fw_error_next_data(*data);
 	}
 
 	iwl_trans_release_nic_access(trans, &flags);
