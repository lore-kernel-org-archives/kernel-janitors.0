From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 16 Feb 2013 20:48:37 +0000
Subject: build regressions 2013-02-16
Message-Id: <511ff0a5.0iy8n0oSfDTTrIaN%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/linux/frontswap.h:100:24: error: 'frontswap_key' undeclared (first use in this function)
include/linux/frontswap.h:109:24: error: 'frontswap_key' undeclared (first use in this function)
include/linux/cleancache.h:95:24: error: called object '0' is not a function
include/linux/cleancache.h:102:24: error: called object '0' is not a function
include/linux/cleancache.h:110:24: error: called object '0' is not a function
include/linux/cleancache.h:116:24: error: called object '0' is not a function
drivers/mfd/as3711.c:136:3: error: implicit declaration of function 'of_device_is_available' [-Werror=implicit-function-declaration]
arch/ia64/kernel/init_task.c:38:11: error: 'RR_TIMESLICE' undeclared here (not in a function)
arch/ia64/kernel/init_task.c:38:11: error: 'MAX_PRIO' undeclared here (not in a function)
/c/kernel-tests/src/sparc64/include/linux/list_lru.h:75:1: error: expected identifier or '(' before '{' token
drivers/pinctrl/sh-pfc/pfc-sh7269.c:1457:2: error: 'GPIO_PORTPA1' undeclared here (not in a function)
drivers/pinctrl/sh-pfc/pfc-sh7269.c:1457:2: error: array index in initializer not of integer type
drivers/pinctrl/sh-pfc/pfc-sh7269.c:1457:2: error: 'PORTPA1_DATA' undeclared here (not in a function)
drivers/pinctrl/sh-pfc/pfc-sh7269.c:1458:2: error: 'GPIO_PORTPA0' undeclared here (not in a function)
drivers/pinctrl/sh-pfc/pfc-sh7269.c:1458:2: error: array index in initializer not of integer type
drivers/pinctrl/sh-pfc/pfc-sh7269.c:1458:2: error: 'PORTPA0_DATA' undeclared here (not in a function)
drivers/pinctrl/sh-pfc/pfc-sh7269.c:1461:2: error: 'GPIO_PORTPB22' undeclared here (not in a function)
drivers/pinctrl/sh-pfc/pfc-sh7269.c:1461:2: error: array index in initializer not of integer type
drivers/pinctrl/sh-pfc/pfc-sh7269.c:1461:2: error: 'PORTPB22_DATA' undeclared here (not in a function)
drivers/pinctrl/sh-pfc/pfc-sh7269.c:1462:2: error: 'GPIO_PORTPB21' undeclared here (not in a function)
drivers/pinctrl/sh-pfc/pfc-sh7269.c:1462:2: error: array index in initializer not of integer type
drivers/pinctrl/sh-pfc/pfc-sh7269.c:1462:2: error: 'PORTPB21_DATA' undeclared here (not in a function)
drivers/pinctrl/sh-pfc/pfc-sh7269.c:1463:2: error: 'GPIO_PORTPB20' undeclared here (not in a function)
drivers/pinctrl/sh-pfc/pfc-sh7269.c:1463:2: error: array index in initializer not of integer type
drivers/pinctrl/sh-pfc/pfc-sh7269.c:1463:2: error: 'PORTPB20_DATA' undeclared here (not in a function)
include/linux/memcontrol.h:655:2: error: implicit declaration of function 'page_to_nid' [-Werror=implicit-function-declaration]
include/linux/mm.h:690:19: error: static declaration of 'page_to_nid' follows non-static declaration
arch/sparc/include/asm/pgtable_32.h:357:40: error: unknown type name 'swp_entry_t'
arch/sparc/include/asm/pgtable_32.h:362:42: error: unknown type name 'swp_entry_t'
arch/sparc/include/asm/pgtable_32.h:367:1: error: unknown type name 'swp_entry_t'
arch/sparc/include/asm/pgtable_32.h:369:10: error: 'swp_entry_t' undeclared (first use in this function)
arch/sparc/include/asm/pgtable_32.h:369:23: error: expected ';' before '{' token
arch/sparc/include/asm/pgtable_32.h:357:40: error: unknown type name 'swp_entry_t'
arch/sparc/include/asm/pgtable_32.h:362:42: error: unknown type name 'swp_entry_t'
arch/sparc/include/asm/pgtable_32.h:367:1: error: unknown type name 'swp_entry_t'
arch/sparc/include/asm/pgtable_32.h:369:10: error: 'swp_entry_t' undeclared (first use in this function)
arch/sparc/include/asm/pgtable_32.h:369:23: error: expected ';' before '{' token
include/linux/mm.h:308:17: error: 'VMALLOC_START' undeclared (first use in this function)
include/linux/mm.h:308:41: error: 'VMALLOC_END' undeclared (first use in this function)
include/linux/mm.h:514:3: error: implicit declaration of function 'pte_mkwrite' [-Werror=implicit-function-declaration]
arch/sparc/include/asm/pgtable_32.h:251:21: error: conflicting types for 'pte_mkwrite'
include/linux/mm.h:308:17: error: 'VMALLOC_START' undeclared (first use in this function)
include/linux/mm.h:308:41: error: 'VMALLOC_END' undeclared (first use in this function)
include/linux/mm.h:514:3: error: implicit declaration of function 'pte_mkwrite' [-Werror=implicit-function-declaration]
arch/sparc/include/asm/pgtable_32.h:251:21: error: conflicting types for 'pte_mkwrite'
include/linux/list_lru.h:74:1: error: 'lru_node_of_index' declared 'static' but never defined [-Werror=unused-function]
include/linux/memcontrol.h:655:2: error: implicit declaration of function 'page_to_nid' [-Werror=implicit-function-declaration]
include/linux/mm.h:690:19: error: static declaration of 'page_to_nid' follows non-static declaration
include/linux/list_lru.h:74:1: error: 'lru_node_of_index' declared 'static' but never defined [-Werror=unused-function]
include/linux/list_lru.h:74:1: error: 'lru_node_of_index' declared 'static' but never defined [-Werror=unused-function]
arch/sparc/include/asm/pgtable_32.h:357:40: error: unknown type name 'swp_entry_t'
arch/sparc/include/asm/pgtable_32.h:362:42: error: unknown type name 'swp_entry_t'
arch/sparc/include/asm/pgtable_32.h:367:1: error: unknown type name 'swp_entry_t'
arch/sparc/include/asm/pgtable_32.h:369:10: error: 'swp_entry_t' undeclared (first use in this function)
arch/sparc/include/asm/pgtable_32.h:369:23: error: expected ';' before '{' token
(.text+0x2aa56): undefined reference to `__frontswap_init'
(.text+0x2c2a8): undefined reference to `__frontswap_invalidate_area'
arch/x86/mm/extable.c:61:21: error: 'cpu' undeclared (first use in this function)
/c/kernel-tests/src/stable/include/linux/list_lru.h:75:1: error: expected identifier or '(' before '{' token
(.text+0x5ff3): undefined reference to `__cleancache_invalidate_fs'
super.c:(.text+0x9fa8d): undefined reference to `__cleancache_init_fs'
super.c:(.text+0xdd576): undefined reference to `__cleancache_init_fs'

[warnings]
drivers/mmc/core/host.c:327: warning: 'bus_width' is used uninitialized in this function
drivers/firmware/efi-capsule.c:179:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'unsigned int' [-Wformat]
drivers/firmware/efi-capsule.c:189:12: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/firmware/efi-capsule.c:238:15: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/firmware/efi-capsule.c:247:15: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/video/backlight/as3711_bl.c:356:3: warning: suggest parentheses around comparison in operand of '^' [-Wparentheses]
drivers/mmc/core/host.c:327:2: warning: 'bus_width' may be used uninitialized in this function [-Wuninitialized]
net/netfilter/nf_conntrack_sip.c:709:5: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/nfsd/nfscache.c:266:9: warning: comparison of distinct pointer types lacks a cast [enabled by default]
net/ipv4/xfrm4_mode_tunnel.c:145:2: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
net/ipv6/xfrm6_mode_tunnel.c:72:2: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
/c/kernel-tests/src/sparc64/include/linux/memcontrol.h:396:1: warning: no return statement in function returning non-void [-Wreturn-type]
drivers/staging/rtl8187se/r8185b_init.c:870:28: warning: unused variable 'ieee' [-Wunused-variable]
mm/cleancache.c:139:1: warning: label 'out' defined but not used [-Wunused-label]
WARNING: drivers/staging/zcache/zcache.o(.text+0x810f): Section mismatch in reference from the function ramster_init() to the variable .init.data:use_frontswap_selfshrink
/c/kernel-tests/src/stable/include/linux/memcontrol.h:396:1: warning: no return statement in function returning non-void [-Wreturn-type]
fs/btrfs/volumes.c:1508:1: warning: label 'error_close' defined but not used [-Wunused-label]
drivers/xen/tmem.c:234:13: warning: 'disable_selfballooning' defined but not used [-Wunused-variable]
WARNING: drivers/staging/zcache/zcache.o(.text+0x1448): Section mismatch in reference from the (unknown reference) (unknown) to the variable .init.data:use_frontswap_selfshrink

[sparse]
kernel/power/console.c:18:1: sparse: symbol 'vt_switch_mutex' was not declared. Should it be static?
kernel/power/console.c:26:1: sparse: symbol 'pm_vt_switch_list' was not declared. Should it be static?
drivers/vfio/pci/vfio_pci_config.c:600:49: sparse: incorrect type in argument 2 (different base types)

[smatch]
net/mac80211/iface.c:758 ieee80211_do_stop() error: we previously assumed 'sdata->dev' could be null (see line 736)
mm/cleancache.c:221 get_poolid_from_fake() error: buffer overflow 'fs_poolid_map' 32 <= 999
mm/cleancache.c:386 __cleancache_invalidate_fs() error: buffer overflow 'fs_poolid_map' 32 <= 999
mm/cleancache.c:387 __cleancache_invalidate_fs() error: buffer overflow 'fs_poolid_map' 32 <= 999

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
