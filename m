From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 27 Feb 2013 21:09:29 +0000
Subject: build regressions 2013-02-27
Message-Id: <512e7609.I8TXxLLhAQ9bh0WK%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/linux/dmaengine.h:996:1: error: expected ';' before '}' token
include/linux/dmaengine.h:996:1: error: expected ';' before '}' token
include/linux/dmaengine.h:996:1: error: expected ';' before '}' token
include/linux/dmaengine.h:996:1: error: expected ';' before '}' token
include/linux/dmaengine.h:996:1: error: expected ';' before '}' token
include/linux/dmaengine.h:996:1: error: expected ';' before '}' token
include/linux/dmaengine.h:996:1: error: expected ';' before '}' token
include/linux/dmaengine.h:996:1: error: expected ';' before '}' token
(.text+0xaa0a0): undefined reference to `of_dma_request_slave_channel'
drivers/net/wireless/iwlwifi/mvm/d3.c:900:5: error: implicit declaration of function 'is_multicast_ether_addr' [-Werror=implicit-function-declaration]
drivers/dma/dmaengine.c:65:26: fatal error: linux/of_dma.h: No such file or directory

[warnings]
drivers/cpufreq/cpufreq_conservative.c:116:23: warning: unused variable 'dw' [-Wunused-variable]

[sparse]
drivers/cpufreq/cpufreq_governor.c:186:6: sparse: symbol 'gov_cancel_work' was not declared. Should it be static?
drivers/net/wireless/iwlwifi/mvm/d3.c:900:37: sparse: undefined identifier 'is_multicast_ether_addr'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
