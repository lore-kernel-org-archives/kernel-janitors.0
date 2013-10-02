From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 02 Oct 2013 16:30:04 +0000
Subject: build regressions 2013-10-02
Message-Id: <524c4a0c.6fPfGcIFjaZSNxIT%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
security/modpin/modpin.c:93:2: error: implicit declaration of function 'blkdev_get_by_dev' [-Werror=implicit-function-declaration]
security/modpin/modpin.c:101:2: error: implicit declaration of function 'bdev_read_only' [-Werror=implicit-function-declaration]
security/modpin/modpin.c:102:2: error: implicit declaration of function 'blkdev_put' [-Werror=implicit-function-declaration]
drivers/net/wireless/iwlwifi/mvm/power.c:652:30: error: 'iwl_mvm_power_update_device' undeclared here (not in a function)
drivers/tty/serial/pch_uart.c:1091:35: error: expected ')' before 'error_msg'
arch/x86/include/asm/spinlock.h:81:2: error: implicit declaration of function 'elide_lock_adapt' [-Werror=implicit-function-declaration]
arch/x86/include/asm/spinlock.h:83:7: error: 'arch_spinlock_t' has no member named 'elision_adapt'
arch/x86/include/asm/spinlock.h:191:2: error: implicit declaration of function 'elide_abort' [-Werror=implicit-function-declaration]
drivers/usb/core/port.c:76:39: error: 'struct usb_port' has no member named 'pair_pdev'
drivers/usb/core/port.c:133:14: error: 'struct usb_port' has no member named 'pair_pdev'
drivers/usb/core/port.c:155:14: error: 'struct usb_port' has no member named 'pair_pdev'
aslr.c:(.text+0x184): undefined reference to `rdrand_long'

[warnings]
drivers/net/wireless/ath/ath10k/core.c:406: warning: format '%d' expects type 'int', but argument 2 has type 'size_t'
drivers/net/wireless/ath/ath10k/core.c:433: warning: format '%d' expects type 'int', but argument 3 has type 'size_t'
drivers/net/wireless/ath/ath10k/core.c:433: warning: format '%d' expects type 'int', but argument 4 has type 'size_t'
drivers/cpufreq/intel_pstate.c:398:3: warning: left shift count >= width of type [enabled by default]
drivers/cpufreq/intel_pstate.c:398:3: warning: left shift count >= width of type [enabled by default]
security/modpin/modpin.c:93:7: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/tty/serial/pch_uart.c:1091:35: warning: format '%s' expects a matching 'char *' argument [-Wformat=]

[sparse]
drivers/tty/serial/pch_uart.c:1091:56: sparse: Expected ) in function call
drivers/tty/serial/pch_uart.c:1091:56: sparse: got error_msg
drivers/gpu/drm/drm_atomic_helper.c:170:6: sparse: symbol 'drm_atomic_helper_init_plane_state' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
