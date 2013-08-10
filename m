From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 10 Aug 2013 16:28:52 +0000
Subject: build regressions 2013-08-10
Message-Id: <52066a44.32PNkp70M1wKM/oA%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
cpu_pm.c:(.text+0x28640): undefined reference to `__aeabi_uldivmod'
hw_breakpoint.c:(.text+0x3ec58): undefined reference to `__aeabi_uldivmod'
clkdev.c:(.text+0x3f350): undefined reference to `display_entity_get_modes'
clkdev.c:(.text+0x3f418): undefined reference to `display_entity_get_size'
clkdev.c:(.text+0x3f444): undefined reference to `display_entity_get_params'
clkdev.c:(.text+0x40338): undefined reference to `display_entity_unregister_notifier'
clkdev.c:(.text+0x403e0): undefined reference to `display_entity_unregister'
clkdev.c:(.text+0x403f8): undefined reference to `display_entity_unregister'
clkdev.c:(.text+0x40400): undefined reference to `display_entity_cleanup'
clkdev.c:(.text+0x40408): undefined reference to `media_device_unregister'
clkdev.c:(.text+0x40528): undefined reference to `display_entity_init'
clkdev.c:(.text+0x40550): undefined reference to `display_of_entity_link_graph'
clkdev.c:(.text+0x40588): undefined reference to `media_device_register'
clkdev.c:(.text+0x405b8): undefined reference to `display_entity_register'
clkdev.c:(.text+0x405ec): undefined reference to `display_entity_register'
clkdev.c:(.text+0x4064c): undefined reference to `display_entity_link_graph'
clkdev.c:(.text+0x40734): undefined reference to `media_entity_create_link'
clkdev.c:(.text+0x40804): undefined reference to `display_of_entity_build_notifier'
clkdev.c:(.text+0x40818): undefined reference to `display_entity_register_notifier'
clkdev.c:(.text+0x40858): undefined reference to `display_entity_build_notifier'
clkdev.c:(.text+0x40a20): undefined reference to `display_entity_get_params'
clkdev.c:(.text+0x4116c): undefined reference to `media_entity_remote_pad'
cpu_pm.c:(.text+0x30460): undefined reference to `__udivdi3'
(.text+0x1e54c): undefined reference to `__avr32_udiv64'
drivers/mtd/nand/nand_base.c:216:2: error: implicit declaration of function 'iowrite8_rep' [-Werror=implicit-function-declaration]
drivers/mtd/nand/nand_base.c:231:2: error: implicit declaration of function 'ioread8_rep' [-Werror=implicit-function-declaration]
drivers/mtd/nand/nand_base.c:247:2: error: implicit declaration of function 'iowrite16_rep' [-Werror=implicit-function-declaration]
drivers/mtd/nand/nand_base.c:263:2: error: implicit declaration of function 'ioread16_rep' [-Werror=implicit-function-declaration]
drivers/net/wireless/rt2x00/rt2800usb.c:235:3: error: implicit declaration of function 'WARNING' [-Werror=implicit-function-declaration]
drivers/net/wireless/ath/ath9k/rc.c:1328:183: error: invalid type argument of '->' (have 'struct cfg80211_chan_def')
(.text+0x4b831): undefined reference to `__udivdi3'
drivers/net/wireless/mwifiex/cfg80211.c:2493:3: error: implicit declaration of function 'mwifiex_is_pattern_supported' [-Werror=implicit-function-declaration]
drivers/staging/lustre/include/linux/libcfs/linux/linux-mem.h:102:3: error: 'struct shrinker' has no member named 'shrink'
xt_socket.c:(.text+0x36eee): undefined reference to `udp6_lib_lookup'
xt_socket.c:(.init.text+0x1822): undefined reference to `nf_defrag_ipv6_enable'
include/linux/regmap.h:520:2: error: implicit declaration of function 'WARN_ONCE' [-Werror=implicit-function-declaration]

[warnings]
include/uapi/drm/i915_drm.h:796:0: warning: "I915_CACHING_CACHED" redefined [enabled by default]
include/uapi/drm/i915_drm.h:796:0: warning: "I915_CACHING_CACHED" redefined [enabled by default]
include/uapi/drm/i915_drm.h:796:0: warning: "I915_CACHING_CACHED" redefined [enabled by default]
include/uapi/drm/i915_drm.h:796:0: warning: "I915_CACHING_CACHED" redefined [enabled by default]
include/uapi/drm/i915_drm.h:796:0: warning: "I915_CACHING_CACHED" redefined [enabled by default]
include/uapi/drm/i915_drm.h:796:0: warning: "I915_CACHING_CACHED" redefined [enabled by default]
include/uapi/drm/i915_drm.h:796:0: warning: "I915_CACHING_CACHED" redefined [enabled by default]

[sparse]
fs/aio.c:478:15: sparse: incorrect type in assignment (different address spaces) @@    expected struct kioctx_table *table @@    got struct kioctx_tabstruct kioctx_table *table @@
fs/aio.c:506:21: sparse: incorrect type in assignment (different address spaces) @@    expected struct kioctx_table *old @@    got struct kioctx_tabstruct kioctx_table *old @@
fs/aio.c:630:23: sparse: incorrect type in assignment (different address spaces) @@    expected struct kioctx_table *table @@    got struct kioctx_tabstruct kioctx_table *table @@
drivers/staging/comedi/drivers/das16.c:855:27: sparse: cast to restricted __le16
drivers/net/ppp/pptp.c:125:34: sparse: restricted __be16 degrades to integer
drivers/net/ppp/pptp.c:146:51: sparse: incorrect type in assignment (different base types) @@    expected restricted __be16 [usertype] call_id @@    got inrestricted __be16 [usertype] call_id @@
drivers/net/ppp/pptp.c:147:20: sparse: incorrect type in argument 1 (different base types) @@    expected int [signed] nr @@    got restricted __be1int [signed] nr @@
drivers/net/ppp/pptp.c:147:20: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] nr @@    got restrunsigned int [unsigned] nr @@
drivers/net/ppp/pptp.c:150:42: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] nr @@    got restrunsigned int [unsigned] nr @@
drivers/net/ppp/pptp.c:151:9: sparse: restricted __be16 degrades to integer
drivers/net/ppp/pptp.c:164:44: sparse: incorrect type in argument 1 (different base types) @@    expected int [signed] nr @@    got restricted __be1int [signed] nr @@
drivers/net/ppp/pptp.c:165:9: sparse: restricted __be16 degrades to integer
drivers/net/ppp/pptp.c:243:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] protocol @@    got  short [unsigned] [usertype] protocol @@
drivers/net/ppp/pptp.c:244:28: sparse: cast from restricted __be16
drivers/net/ppp/pptp.c:244:28: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned short [unsigned] [usertype] val @@    got  short [unsigned] [usertype] val @@
drivers/net/ppp/pptp.c:244:28: sparse: cast from restricted __be16
drivers/net/ppp/pptp.c:244:28: sparse: cast from restricted __be16
drivers/net/ppp/pptp.c:244:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] call_id @@    got  short [unsigned] [usertype] call_id @@
drivers/net/ppp/pptp.c:247:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] seq @@    got ed int [unsigned] [usertype] seq @@
drivers/net/ppp/pptp.c:251:27: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] ack @@    got ed int [unsigned] [usertype] ack @@
drivers/net/ppp/pptp.c:254:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] payload_len @@    got  short [unsigned] [usertype] payload_len @@
drivers/net/ppp/pptp.c:323:23: sparse: cast to restricted __be32
drivers/net/ppp/pptp.c:323:23: sparse: cast to restricted __be32
drivers/net/ppp/pptp.c:323:23: sparse: cast to restricted __be32
drivers/net/ppp/pptp.c:323:23: sparse: cast to restricted __be32
drivers/net/ppp/pptp.c:323:23: sparse: cast to restricted __be32
drivers/net/ppp/pptp.c:323:23: sparse: cast to restricted __be32
drivers/net/ppp/pptp.c:337:23: sparse: cast to restricted __be16
drivers/net/ppp/pptp.c:337:23: sparse: cast to restricted __be16
drivers/net/ppp/pptp.c:337:23: sparse: cast to restricted __be16
drivers/net/ppp/pptp.c:337:23: sparse: cast to restricted __be16
drivers/net/ppp/pptp.c:338:23: sparse: cast to restricted __be32
drivers/net/ppp/pptp.c:338:23: sparse: cast to restricted __be32
drivers/net/ppp/pptp.c:338:23: sparse: cast to restricted __be32
drivers/net/ppp/pptp.c:338:23: sparse: cast to restricted __be32
drivers/net/ppp/pptp.c:338:23: sparse: cast to restricted __be32
drivers/net/ppp/pptp.c:338:23: sparse: cast to restricted __be32
drivers/net/ppp/pptp.c:395:13: sparse: cast to restricted __be16
drivers/net/ppp/pptp.c:395:13: sparse: cast to restricted __be16
drivers/net/ppp/pptp.c:395:13: sparse: cast to restricted __be16
drivers/net/ppp/pptp.c:395:13: sparse: cast to restricted __be16
drivers/net/ppp/pptp.c:403:26: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned short [unsigned] [usertype] call_id @@    got  short [unsigned] [usertype] call_id @@
drivers/net/ppp/pptp.c:447:45: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned short [unsigned] [usertype] call_id @@    got  short [unsigned] [usertype] call_id @@
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
include/linux/syscalls.h:805:5: sparse: undefined preprocessor identifier 'CONFIG_CLONE_BACKWARDS3'
drivers/clk/clk.c:1968:5: sparse: symbol '__clk_get' was not declared. Should it be static?
drivers/clk/clk.c:1981:6: sparse: symbol '__clk_put' was not declared. Should it be static?
drivers/net/wireless/rt2x00/rt2800lib.c:1816:6: sparse: symbol 'rt2800_update_aggr_stats' was not declared. Should it be static?
drivers/net/wireless/rt2x00/rt2800usb.c:235:17: sparse: undefined identifier 'WARNING'
include/uapi/drm/i915_drm.h:796:9: sparse: preprocessor token I915_CACHING_CACHED redefined

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
