From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 10 Dec 2012 16:43:42 +0000
Subject: build regressions 2012-12-10
Message-Id: <50c6113e.GkkAWa8K9KrLHqo1%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/net/ethernet/smsc/smc91x.c:490:3: error: implicit declaration of function 'readsl' [-Werror=implicit-function-declaration]
drivers/net/ethernet/smsc/smc91x.c:490:3: error: implicit declaration of function 'readsw' [-Werror=implicit-function-declaration]
drivers/net/ethernet/smsc/smc91x.c:597:2: error: implicit declaration of function 'writesl' [-Werror=implicit-function-declaration]
drivers/net/ethernet/smsc/smc91x.c:597:2: error: implicit declaration of function 'writesw' [-Werror=implicit-function-declaration]
drivers/regulator/anatop-regulator.c:163:7: error: 'struct regulator_desc' has no member named 'linear_min_sel'
security/integrity/ima/ima_policy.c:200:7: error: 'MODULE_CHECK' undeclared (first use in this function)

[warnings]
WARNING: vmlinux.o(.cpuinit.text+0x3227): Section mismatch in reference from the function load_ucode_intel_ap() to the function .init.text:apply_microcode_early.isra.1.constprop.8()

[smatch]
drivers/net/virtio_net.c:1312 virtnet_alloc_queues() error: potential null dereference 'vi->rq'.  (kzalloc returns null)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
