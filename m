From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 22 Mar 2013 17:09:40 +0000
Subject: build regressions 2013-03-22
Message-Id: <514c9054.8r7GS7yTq4qDV2Vr%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/kernel/process.c:211:4: error: implicit declaration of function 'tick_check_broadcast_expired' [-Werror=implicit-function-declaration]
ERROR: "rtm_dn_policy" [net/decnet/decnet.ko] undefined!
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:337:2: error: invalid application of 'sizeof' to incomplete type 'struct kvm_vcpu_arch'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:338:2: error: invalid use of undefined type 'struct kvm_vcpu'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:339:2: error: invalid use of undefined type 'struct kvm_vcpu'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:341:2: error: invalid use of undefined type 'struct kvm_vcpu_arch'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:342:2: error: invalid use of undefined type 'struct kvm_vcpu_arch'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:344:2: error: invalid use of undefined type 'struct kvm_vcpu_arch'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:345:2: error: invalid use of undefined type 'struct kvm_vcpu_arch'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:347:2: error: invalid use of undefined type 'struct kvm_vcpu_arch'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:348:2: error: invalid use of undefined type 'struct kvm_vcpu_arch'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:349:2: error: invalid use of undefined type 'struct kvm_vcpu_arch'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:350:2: error: invalid use of undefined type 'struct kvm_vcpu_arch'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:352:2: error: invalid use of undefined type 'struct kvm_vcpu_arch'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:354:2: error: invalid use of undefined type 'struct kvm_vcpu_arch'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:355:2: error: invalid use of undefined type 'struct kvm_vcpu_arch'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:356:2: error: invalid use of undefined type 'struct kvm_vcpu_arch'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:357:2: error: invalid use of undefined type 'struct kvm_vcpu_arch'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:358:2: error: invalid use of undefined type 'struct kvm_vcpu_arch'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:359:2: error: invalid use of undefined type 'struct kvm_vcpu_arch'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:360:2: error: invalid use of undefined type 'struct kvm_vcpu_arch'
/c/kernel-tests/src/tip/arch/mips/kernel/asm-offsets.c:361:2: error: invalid use of undefined type 'struct kvm_vcpu_arch'
arch/tile/kernel/ptrace.c:261:3: error: implicit declaration of function 'trace_sys_enter'
arch/tile/kernel/ptrace.c:272:3: error: implicit declaration of function 'trace_sys_exit'
drivers/net/virtio_net.c:1242:2: error: implicit declaration of function 'virtio_config_val' [-Werror=implicit-function-declaration]
drivers/net/virtio_net.c:1516:2: error: implicit declaration of function 'virtio_config_val_len' [-Werror=implicit-function-declaration]
drivers/block/virtio_blk.c:463:2: error: implicit declaration of function 'virtio_config_val' [-Werror=implicit-function-declaration]
drivers/char/virtio_console.c:1980:6: error: implicit declaration of function 'virtio_config_val' [-Werror=implicit-function-declaration]
drivers/scsi/virtio_scsi.c:633:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:633:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:633:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:633:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:633:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:633:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:633:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:634:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:634:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:634:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:634:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:634:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:634:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:634:2: error: invalid type argument of unary '*' (have 'u32')
drivers/cpufreq/cpufreq_conservative.c:96:27: error: request for member 'freq_step' in something not a structure or union
drivers/cpufreq/cpufreq_ondemand.c:353:44: error: request for member 'io_is_busy' in something not a structure or union
drivers/cpufreq/cpufreq_ondemand.c:428:44: error: request for member 'io_is_busy' in something not a structure or union
drivers/cpufreq/cpufreq_governor.c:100:15: error: 'struct dbs_data' has no member named 'governor'
drivers/cpufreq/cpufreq_conservative.c:85:39: error: request for member 'sampling_down_factor' in something not a structure or union
drivers/target/iscsi/iscsi_target_configfs.c:1549:30: error: dereferencing pointer to incomplete type

[warnings]
drivers/scsi/virtio_scsi.c:633: warning: type defaults to 'int' in declaration of '__dummy2'
drivers/scsi/virtio_scsi.c:634: warning: type defaults to 'int' in declaration of '__dummy2'
drivers/virtio/virtio_pci.c:771:4: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'size_t' [-Wformat]
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): No description found for parameter 'p2p_noa_attr'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_ctwindow' description in 'ieee80211_bss_conf'
Warning(include/net/mac80211.h:369): Excess struct/union/enum/typedef member 'p2p_oppps' description in 'ieee80211_bss_conf'
drivers/target/iscsi/iscsi_target_login.c:619:2: warning: #warning FIXME: Reenable iscsit_start_nopin_timer [-Wcpp]
drivers/scsi/virtio_scsi.c:633:2: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/scsi/virtio_scsi.c:634:2: warning: comparison of distinct pointer types lacks a cast [enabled by default]
include/uapi/linux/virtio_pci.h:90:2: warning: #warning "Please support virtio_pci non-legacy mode!" [-Wcpp]

[sparse]
drivers/media/usb/s2255/s2255drv.c:2517:20: sparse: cast to restricted __le16
drivers/scsi/virtio_scsi.c:633:9: sparse: cannot dereference this type
drivers/scsi/virtio_scsi.c:633:9: sparse: incompatible types in comparison expression (different base types)
drivers/scsi/virtio_scsi.c:633:9: sparse: cannot dereference this type
drivers/scsi/virtio_scsi.c:633:9: sparse: cannot dereference this type
drivers/scsi/virtio_scsi.c:633:9: sparse: cannot dereference this type
drivers/scsi/virtio_scsi.c:633:9: sparse: cannot dereference this type
drivers/scsi/virtio_scsi.c:633:9: sparse: cannot dereference this type
drivers/scsi/virtio_scsi.c:633:9: sparse: cannot dereference this type
drivers/scsi/virtio_scsi.c:633:9: sparse: incompatible types for 'case' statement
drivers/scsi/virtio_scsi.c:633:9: sparse: incompatible types for 'case' statement
drivers/scsi/virtio_scsi.c:633:9: sparse: incompatible types for 'case' statement
drivers/scsi/virtio_scsi.c:633:9: sparse: incompatible types for 'case' statement
drivers/scsi/virtio_scsi.c:634:9: sparse: cannot dereference this type
drivers/scsi/virtio_scsi.c:634:9: sparse: incompatible types in comparison expression (different base types)
drivers/scsi/virtio_scsi.c:634:9: sparse: cannot dereference this type
drivers/scsi/virtio_scsi.c:634:9: sparse: cannot dereference this type
drivers/scsi/virtio_scsi.c:634:9: sparse: cannot dereference this type
drivers/scsi/virtio_scsi.c:634:9: sparse: cannot dereference this type
drivers/scsi/virtio_scsi.c:634:9: sparse: cannot dereference this type
drivers/scsi/virtio_scsi.c:634:9: sparse: cannot dereference this type
drivers/scsi/virtio_scsi.c:634:9: sparse: incompatible types for 'case' statement
drivers/scsi/virtio_scsi.c:634:9: sparse: incompatible types for 'case' statement
drivers/scsi/virtio_scsi.c:634:9: sparse: incompatible types for 'case' statement
drivers/scsi/virtio_scsi.c:634:9: sparse: incompatible types for 'case' statement
drivers/virtio/virtio_balloon.c:286:9: sparse: restricted __le32 degrades to integer
drivers/virtio/virtio_balloon.c:286:9: sparse: incorrect type in argument 3 (different base types)
drivers/virtio/virtio_balloon.c:286:9: sparse: incorrect type in argument 3 (different base types)
drivers/virtio/virtio_balloon.c:286:9: sparse: incorrect type in argument 3 (different base types)
drivers/virtio/virtio_balloon.c:286:9: sparse: incorrect type in argument 3 (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_pci.c:108:30: sparse: incorrect type in argument 2 (different address spaces)
drivers/virtio/virtio_pci.c:109:45: sparse: incorrect type in argument 2 (different address spaces)
drivers/virtio/virtio_pci.c:115:25: sparse: incorrect type in argument 1 (different address spaces)
drivers/virtio/virtio_pci.c:115:63: sparse: incorrect type in argument 1 (different address spaces)
drivers/virtio/virtio_pci.c:463:33: sparse: incorrect type in argument 1 (different address spaces)
drivers/virtio/virtio_pci.c:525:53: sparse: incorrect type in argument 2 (different address spaces)
drivers/virtio/virtio_pci.c:563:29: sparse: incorrect type in argument 2 (different address spaces)
drivers/cpufreq/cpufreq_governor.c:100:29: sparse: no member 'governor' in struct dbs_data
drivers/cpufreq/cpufreq_ondemand.c:353:65: sparse: expected structure or union
drivers/cpufreq/cpufreq_conservative.c:85:46: sparse: expected structure or union

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
