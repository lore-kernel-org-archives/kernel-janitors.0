From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 25 Jun 2013 17:09:03 +0000
Subject: build regressions 2013-06-25
Message-Id: <51c9ceaf.kYljQ/VYfhLt0S9p%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/staging/imx-drm/ipu-v3/ipu-common.c:947:11: error: 'irq_generic_chip_ops' undeclared (first use in this function)
drivers/staging/imx-drm/ipu-v3/ipu-common.c:953:2: error: implicit declaration of function 'irq_alloc_domain_generic_chips' [-Werror=implicit-function-declaration]
drivers/staging/imx-drm/ipu-v3/ipu-common.c:962:3: error: implicit declaration of function 'irq_get_domain_generic_chip' [-Werror=implicit-function-declaration]
drivers/staging/imx-drm/ipu-v3/ipu-common.c:974:5: error: 'struct irq_chip_generic' has no member named 'unused'
drivers/gpu/drm/drm_gem_cma_helper.c:526:35: error: macro "dma_buf_export" requires 5 arguments, but only 4 given
drivers/gpu/drm/drm_gem_cma_helper.c:525:9: error: 'dma_buf_export' undeclared (first use in this function)
make[1]: *** No rule to make target `include/config/auto.conf', needed by `include/config/kernel.release'.
arch/x86/kvm/svm.c:1030:3: error: implicit declaration of function 'trace_kvm_write_tsc_offset' [-Werror=implicit-function-declaration]
include/linux/tracepoint.h:208:20: error: '__tracepoint_kvm_write_tsc_offset' undeclared here (not in a function)
arch/x86/kvm/vmx.c:2099:3: error: implicit declaration of function 'trace_kvm_write_tsc_offset' [-Werror=implicit-function-declaration]
drivers/misc/lkdtm.c:398:3: error: implicit declaration of function 'vmalloc' [-Werror=implicit-function-declaration]
drivers/misc/lkdtm.c:400:3: error: implicit declaration of function 'vfree' [-Werror=implicit-function-declaration]
drivers/block/nvme-core.c:1542:5: error: expected ';' before 'nvme_cancel_ios'

[warnings]
drivers/staging/imx-drm/ipu-v3/ipu-common.c:962:6: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/gpu/drm/drm_gem_cma_helper.c:527:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/mtd/map.h:414:2: warning: 'r' is used uninitialized in this function [-Wuninitialized]
include/linux/mtd/map.h:414:2: warning: 'r' is used uninitialized in this function [-Wuninitialized]
include/linux/mtd/map.h:414:2: warning: 'r' is used uninitialized in this function [-Wuninitialized]
drivers/misc/lkdtm.c:398:23: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/net/wireless/ath/ath10k/mac.c:230:3: warning: enumeration value 'NL80211_CHAN_WIDTH_5' not handled in switch [-Wswitch]
drivers/net/wireless/ath/ath10k/mac.c:230:3: warning: enumeration value 'NL80211_CHAN_WIDTH_10' not handled in switch [-Wswitch]
drivers/net/wireless/ath/ath10k/mac.c:248:3: warning: enumeration value 'NL80211_CHAN_WIDTH_5' not handled in switch [-Wswitch]
drivers/net/wireless/ath/ath10k/mac.c:248:3: warning: enumeration value 'NL80211_CHAN_WIDTH_10' not handled in switch [-Wswitch]

[coccinelle]
drivers/fmc/fmc-chardev.c:153:11-13: ERROR: reference preceded by free on line 148
drivers/fmc/fmc-chardev.c:154:3-5: ERROR: reference preceded by free on line 148

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
