From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 15 Nov 2012 17:09:43 +0000
Subject: build regressions 2012-11-15
Message-Id: <50a521d7.j3iFgdYyLL65TrdJ%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/linux/acpi.h:463:68: error: 'ENODEV' undeclared (first use in this function)
drivers/net/wireless/rtlwifi/rtl8723ae/trx.c:324:21: error: 'RX_FLAG_MACTIME_MPDU' undeclared (first use in this function)
arch/mips/math-emu/dsemul.c:104:10: error: 'MM_BRK_MEMU' undeclared (first use in this function)
arch/mips/kernel/traps.c:822:7: error: 'MM_BRK_MEMU' undeclared (first use in this function)
mm/huge_memory.c:716:2: error: implicit declaration of function 'pfn_pmd' [-Werror=implicit-function-declaration]
mm/huge_memory.c:716:8: error: incompatible types when assigning to type 'pmd_t' from type 'int'
(.init.text+0x1f28): undefined reference to `except_vec3_r4000'
{standard input}:118: Error: opcode not supported on this processor: loongson2e (mips3) `ldx $2,$2($3)'
lib/pSeries-reconfig-notifier-error-inject.c:4:34: fatal error: asm/pSeries_reconfig.h: No such file or directory
ERROR: ".of_reconfig_notifier_register" undefined!
ERROR: ".of_reconfig_notifier_unregister" undefined!
mm/huge_memory.c:1015:25: error: 'pte_t' has no member named 'lru'

[warnings]
drivers/regulator/tps6586x-regulator.c:361:8: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
mm/huge_memory.c:1018:20: warning: assignment from incompatible pointer type [enabled by default]
drivers/acpi/acpica/psloop.c:139:4: warning: format '%X' expects argument of type 'unsigned int', but argument 5 has type 'long unsigned int' [-Wformat]
fs/btrfs/volumes.c:1505:1: warning: label 'error_close' defined but not used [-Wunused-label]
arch/x86/kernel/smpboot.c:1348:15: warning: unused variable 'timeout' [-Wunused-variable]
drivers/regulator/tps6586x-regulator.c:392:2: warning: 'id' may be used uninitialized in this function [-Wuninitialized]
drivers/gpu/drm/i915/i915_drv.h:1545:2: warning: '______f' is static but declared in inline function 'i915_gem_chipset_flush' which is not static [enabled by default]
drivers/regulator/tps6586x-regulator.c:392:2: warning: 'id' is used uninitialized in this function [-Wuninitialized]

[sparse]
drivers/scsi/be2iscsi/be_main.c:155:1: sparse: symbol 'dev_attr_beiscsi_adapter_family' was not declared. Should it be static?
kernel/rcutree_plugin.h:2389:36: sparse: context imbalance in 'rcu_nocb_wait_gp' - different lock contexts for basic block
drivers/base/firmware_class.c:249:9: sparse: context imbalance in '__fw_free_buf' - unexpected unlock
drivers/base/firmware_class.c:267:9: sparse: context imbalance in 'fw_free_buf' - wrong count at exit
net/ipv6/ip6_tunnel.c:1571:33: sparse: incorrect type in assignment (different base types)
net/ipv4/ipip.c:867:34: sparse: incorrect type in assignment (different base types)
net/ipv6/sit.c:1232:52: sparse: incorrect type in argument 3 (different base types)
net/ipv6/sit.c:1243:34: sparse: incorrect type in assignment (different base types)
drivers/firmware/efivars.c:912:5: sparse: symbol 'efivarfs_fill_super' was not declared. Should it be static?
mm/huge_memory.c:1007:11: sparse: symbol 'get_pmd_huge_pte' was not declared. Should it be static?
mm/huge_memory.c:1442:27: sparse: context imbalance in 'change_huge_pmd' - unexpected unlock
drivers/net/wireless/rtlwifi/rtl8723ae/trx.c:324:28: sparse: undefined identifier 'RX_FLAG_MACTIME_MPDU'
drivers/regulator/da9055-regulator.c:541:16: sparse: undefined identifier 'IRQ_HANDLED'

[smatch]
drivers/net/wireless/rtlwifi/rtl8723ae/phy.c:1189 _phy_sw_chnl_step_by_step() error: potential NULL dereference 'currentcmd'.
drivers/net/wireless/rtlwifi/rtl8723ae/phy.c:1152 _phy_sw_chnl_step_by_step() warn: function puts 794 bytes on stack

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
