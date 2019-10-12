From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 12 Oct 2019 17:26:24 +0000
Subject: iwlwifi: Checking a kmemdup() call in iwl_req_fw_callback()
Message-Id: <71774617-79f9-1365-4267-a15a47422d10@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-wireless@vger.kernel.org, linuxwifi@intel.com, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Johannes Berg <johannes.berg@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Luca Coelho <luciano.coelho@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>

Hello,

I tried another script for the semantic patch language out.
This source code analysis approach points out that the implementation
of the function “iwl_req_fw_callback” contains still an unchecked call
of the function “kmemdup”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/intel/iwlwifi/iwl-drv.c?id=1c0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n1454
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/net/wireless/intel/iwlwifi/iwl-drv.c#L1454

Can it be that just an other data structure member should be used
for the desired null pointer check at this place?

Regards,
Markus
