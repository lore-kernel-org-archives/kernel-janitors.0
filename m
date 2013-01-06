From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 06 Jan 2013 17:21:34 +0000
Subject: build regressions 2013-01-06
Message-Id: <50e9b29e.LhOkmqzH+/7MwiWt%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[warnings]
include/linux/platform_data/i2c-s3c2410.h:37:26: warning: 'struct platform_device' declared inside parameter list [enabled by default]
include/linux/platform_data/i2c-s3c2410.h:37:26: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]

[sparse]
kernel/rcutree.c:2222:13: sparse: context imbalance in '__call_rcu_core' - different lock contexts for basic block
kernel/rcutree.c:1208:9: sparse: context imbalance in 'rcu_start_future_gp' - different lock contexts for basic block

[smatch]
kernel/rcutree.c:2255 __call_rcu_core() error: double lock 'spin_lock:&rnp_root->lock'

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
