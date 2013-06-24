From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 24 Jun 2013 17:01:00 +0000
Subject: build regressions 2013-06-24
Message-Id: <51c87b4c.vnb0IP6xBzyz5SSs%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
hw_breakpoint.c:(.text+0x6ad98): undefined reference to `perf_misc_flags'
hw_breakpoint.c:(.text+0x6afb0): undefined reference to `perf_instruction_pointer'
drivers/dma/dmatest.c:29:27: error: asm/dma-iommu.h: No such file or directory
drivers/dma/dmatest.c:843: error: implicit declaration of function 'arm_iommu_detach_device'
drivers/dma/dmatest.c:844: error: implicit declaration of function 'arm_iommu_release_mapping'
drivers/dma/dmatest.c:934: error: implicit declaration of function 'arm_iommu_create_mapping'
drivers/dma/dmatest.c:941: error: dereferencing pointer to incomplete type
drivers/dma/dmatest.c:943: error: implicit declaration of function 'arm_iommu_attach_device'
ERROR: "of_usb_get_phy_mode" [drivers/usb/chipidea/ci_hdrc.ko] undefined!
drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:5464:9: error: 'struct bnx2x' has no member named 'old_bulletin'
drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:5464:44: error: 'CHANNEL_DOWN' undeclared (first use in this function)
kernel/sched/core.c:6004:1: error: expected expression before '|' token
kernel/spinlock.c:112:1: error: implicit declaration of function 'arch_spin_relax' [-Werror=implicit-function-declaration]
kernel/spinlock.c:113:1: error: implicit declaration of function 'arch_read_relax' [-Werror=implicit-function-declaration]
kernel/spinlock.c:114:1: error: implicit declaration of function 'arch_write_relax' [-Werror=implicit-function-declaration]
vport-gre.c:(.text+0x14d4dc): undefined reference to `gre_handle_offloads'
vport-gre.c:(.text+0x14d521): undefined reference to `gre_build_header'
vport-gre.c:(.text+0x14d5cf): undefined reference to `gre_cisco_unregister'
vport-gre.c:(.text+0x14da10): undefined reference to `gre_cisco_register'
kernel/sysctl.c:292:15: error: 'min_sched_packing_mode' undeclared here (not in a function)
kernel/sysctl.c:293:15: error: 'max_sched_packing_mode' undeclared here (not in a function)
kernel/sched/fair.c:1571:6: error: redefinition of 'idle_enter_fair'
kernel/sched/fair.c:1581:6: error: redefinition of 'idle_exit_fair'

[warnings]
fs/cifs/smb2pdu.c:1007: warning: 'SMB2_ioctl' defined but not used
drivers/dma/dmatest.c:934: warning: initialization makes pointer from integer without a cast

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
