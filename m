From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 13 Feb 2013 19:31:44 +0000
Subject: build regressions 2013-02-13
Message-Id: <511bea20.0iyZ+vhgGDaemnZj%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mach-shmobile/board-marzen.c:107:15: error: 'MMC_CAP_SD_HIGHSPEED' undeclared here (not in a function)
timer-marco.c:(.init.text+0x2e4): multiple definition of `v7_invalidate_l1'
arch/arm/mm/built-in.o:cache-l2x0.c:(.text+0x36e0): first defined here
drivers/base/dd.c:298:5: error: 'struct device' has no member named 'pins'
drivers/base/dd.c:502:6: error: 'struct device' has no member named 'pins'
mshyperv.c:(.init.text+0x3c88): undefined reference to `first_system_vector'
mshyperv.c:(.init.text+0x3c94): undefined reference to `first_system_vector'
net/core/skbuff.c:126:2: error: called object 'panic' is not a function
drivers/net/wireless/iwlwifi/mvm/d3.c:775:9: error: variable 'wakeup' has initializer but incomplete type
drivers/net/wireless/iwlwifi/mvm/d3.c:776:3: error: unknown field 'pattern_idx' specified in initializer
drivers/net/wireless/iwlwifi/mvm/d3.c:775:32: error: storage size of 'wakeup' isn't known
drivers/net/wireless/iwlwifi/mvm/d3.c:797:4: error: implicit declaration of function 'ieee80211_report_wowlan_wakeup' [-Werror=implicit-function-declaration]
(.text+0x2f8c02): undefined reference to `au8522_attach'
(.text+0x2f8c4a): undefined reference to `au8522_attach'
(.text+0x2f8c92): undefined reference to `au8522_attach'
(.text+0x2f8cd2): undefined reference to `au8522_attach'

[warnings]
drivers/gpio/gpio-samsung.c:1126:5: warning: suggest explicit braces to avoid ambiguous 'else' [-Wparentheses]
arch/x86/include/uapi/asm/swab.h:9:2: warning: 'addr[0]' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/wireless/iwlwifi/mvm/d3.c:776:3: warning: excess elements in struct initializer [enabled by default]
drivers/net/wireless/iwlwifi/mvm/d3.c:776:3: warning: (near initialization for 'wakeup') [enabled by default]
drivers/net/wireless/iwlwifi/mvm/d3.c:775:32: warning: unused variable 'wakeup' [-Wunused-variable]
WARNING: drivers/staging/built-in.o(.data+0x6f70): Section mismatch in reference from the variable tpci200_pci_drv to the function .devexit.text:lirc_parallel_remove()

[sparse]
drivers/dma/ioat/dma_v3.c:371:6: sparse: symbol 'ioat3_timer_event' was not declared. Should it be static?
net/802/mrp.c:845:9: sparse: dereference of noderef expression
drivers/gpu/drm/nouveau/core/subdev/gpio/nve0.c:32:1: sparse: symbol 'nve0_gpio_intr' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/subdev/gpio/nve0.c:51:1: sparse: symbol 'nve0_gpio_intr_enable' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/subdev/gpio/nve0.c:60:1: sparse: symbol 'nve0_gpio_intr_disable' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/subdev/gpio/nve0.c:69:1: sparse: symbol 'nve0_gpio_fini' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/subdev/gpio/nve0.c:78:1: sparse: symbol 'nve0_gpio_init' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/subdev/gpio/nve0.c:93:1: sparse: symbol 'nve0_gpio_dtor' was not declared. Should it be static?
drivers/base/dd.c:305:12: sparse: no member 'pins' in struct device

[smatch]
drivers/misc/mei/bus.c:161 mei_add_device() error: dereferencing freed memory 'device'
drivers/gpu/drm/i915/intel_pm.c:2829 ironlake_enable_rc6() error: double lock 'mutex:&dev->struct_mutex'
drivers/gpu/drm/i915/intel_pm.c:2829 ironlake_enable_rc6() warn: inconsistent returns mutex:&dev->struct_mutex: locked (2829) unlocked (2778)
net/core/netpoll.c:243 netpoll_poll_dev() warn: inconsistent returns mutex:&ni->dev_lock: locked (213,217) unlocked (210,243)
drivers/regulator/core.c:639 regulator_use_count_show() warn: always true condition '(ret >= 0) => (0-u32max >= 0)'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
