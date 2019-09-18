From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 18 Sep 2019 12:28:15 +0000
Subject: [PATCH net] iwlwifi: add dependency of THERMAL with IWLMVM
Message-Id: <20190918122815.155657-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: johannes.berg@intel.com, emmanuel.grumbach@intel.com, luciano.coelho@intel.com, linuxwifi@intel.com, kvalo@codeaurora.org, davem@davemloft.net
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

If CONFIG_IWLMVM=y, CONFIG_THERMAL=n, below error can be found:
drivers/net/wireless/intel/iwlwifi/mvm/fw.o: In function `iwl_mvm_up':
fw.c:(.text+0x2c26): undefined reference to `iwl_mvm_send_temp_report_ths_cmd'
make: *** [vmlinux] Error 1

After commit 242d9c8b9a93 ("iwlwifi: mvm: use FW thermal
monitoring regardless of CONFIG_THERMAL"), iwl_mvm_up()
calls iwl_mvm_send_temp_report_ths_cmd(), but this function
is under CONFIG_THERMAL, which is depended on CONFIG_THERMAL.

Fixes: 242d9c8b9a93 ("iwlwifi: mvm: use FW thermal monitoring regardless of CONFIG_THERMAL")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/net/wireless/intel/iwlwifi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/Kconfig b/drivers/net/wireless/intel/iwlwifi/Kconfig
index 7dbc0d3..801aa0f 100644
--- a/drivers/net/wireless/intel/iwlwifi/Kconfig
+++ b/drivers/net/wireless/intel/iwlwifi/Kconfig
@@ -65,6 +65,7 @@ config IWLMVM
 	tristate "Intel Wireless WiFi MVM Firmware support"
 	select WANT_DEV_COREDUMP
 	depends on MAC80211
+	depends on THERMAL
 	help
 	  This is the driver that supports the MVM firmware. The list
 	  of the devices that use this firmware is available here:
-- 
2.7.4
