From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 15 Dec 2012 18:47:29 +0000
Subject: build regressions 2012-12-15
Message-Id: <50ccc5c1.7H9f0FweB3uGQZNR%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
initramfs.c:(.init.text+0x228c): undefined reference to `__initramfs_size'
block/cfq-iosched.c:1257:10: error: implicit declaration of function 'cfqg_flat_parent' [-Werror=implicit-function-declaration]
block/cfq-iosched.c:1279:2: error: implicit declaration of function 'cfqg_parent' [-Werror=implicit-function-declaration]

[warnings]
arch/x86/include/uapi/asm/ptrace-abi.h:28:0: warning: "R15" redefined [enabled by default]
arch/x86/include/uapi/asm/ptrace-abi.h:29:0: warning: "R14" redefined [enabled by default]
arch/x86/include/uapi/asm/ptrace-abi.h:30:0: warning: "R13" redefined [enabled by default]
arch/x86/include/uapi/asm/ptrace-abi.h:31:0: warning: "R12" redefined [enabled by default]
arch/x86/include/uapi/asm/ptrace-abi.h:35:0: warning: "R11" redefined [enabled by default]
arch/x86/include/uapi/asm/ptrace-abi.h:36:0: warning: "R10" redefined [enabled by default]
arch/x86/include/uapi/asm/ptrace-abi.h:37:0: warning: "R9" redefined [enabled by default]
block/cfq-iosched.c:1257:30: warning: initialization makes pointer from integer without a cast [enabled by default]
block/cfq-iosched.c:1292:17: warning: assignment makes pointer from integer without a cast [enabled by default]

[sparse]
drivers/net/tun.c:399:19: sparse: symbol 'tun_enable_queue' was not declared. Should it be static?
drivers/gpu/drm/radeon/r600_cs.c:2529:5: sparse: symbol 'r600_dma_cs_next_reloc' was not declared. Should it be static?
drivers/gpu/drm/radeon/r600_cs.c:2565:5: sparse: symbol 'r600_dma_cs_parse' was not declared. Should it be static?
drivers/gpu/drm/radeon/evergreen_cs.c:2851:5: sparse: symbol 'evergreen_dma_cs_parse' was not declared. Should it be static?
drivers/gpu/drm/radeon/evergreen_cs.c:3593:5: sparse: symbol 'evergreen_dma_ib_parse' was not declared. Should it be static?

[smatch]
fs/btrfs/tree-log.c:3401 log_one_extent() error: double unlock 'irq:'

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
