From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 03 Jul 2013 16:32:38 +0000
Subject: build regressions 2013-07-03
Message-Id: <51d45226.jBYFCUL396VZ20wc%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
memcontrol.c:(.text+0x3dddf): undefined reference to `mem_cgroup_sockets_destroy'
usb.c:(.text+0x114895): undefined reference to `usb_kill_anchored_urbs'
usb.c:(.text+0x114964): undefined reference to `usb_kill_anchored_urbs'
usb.c:(.text+0x11497c): undefined reference to `usb_kill_anchored_urbs'
usb.c:(.text+0x115056): undefined reference to `usb_anchor_urb'
usb.c:(.text+0x11508f): undefined reference to `usb_kill_anchored_urbs'
usb.c:(.text+0x1153f8): undefined reference to `usb_anchor_urb'
usb.c:(.text+0x11542b): undefined reference to `usb_unanchor_urb'
usb.c:(.text+0x116069): undefined reference to `usb_anchor_urb'
usb.c:(.text+0x1160b7): undefined reference to `usb_unanchor_urb'
usb.c:(.text+0x11c1f6): undefined reference to `usb_get_from_anchor'
tps6507x-ts.c:(.text+0x20b411): undefined reference to `input_unregister_polled_device'
tps6507x-ts.c:(.text+0x20b426): undefined reference to `input_free_polled_device'
tps6507x-ts.c:(.text+0x20bbc3): undefined reference to `input_allocate_polled_device'
tps6507x-ts.c:(.text+0x20bd1a): undefined reference to `input_free_polled_device'
tps6507x-ts.c:(.text+0x20bd62): undefined reference to `input_register_polled_device'
ERROR: "crc32_le" [lib/xz/xz_dec_test.ko] undefined!
ERROR: "crc32_le" [lib/xz/xz_dec.ko] undefined!
ERROR: "crc32_le" [drivers/net/tun.ko] undefined!
ERROR: "crc32_le" [drivers/mtd/ubi/ubi.ko] undefined!
ERROR: "crc32_le" [crypto/crc32.ko] undefined!
ERROR: "__crc32c_le" [crypto/crc32c.ko] undefined!
ERROR: "_restvr_20" undefined!
ERROR: "_savevr_20" undefined!
ERROR: "devm_request_threaded_irq" [drivers/media/platform/vsp1/vsp1.ko] undefined!
fs/select.c:406:2: error: implicit declaration of function 'll_start_time' [-Werror=implicit-function-declaration]
fs/select.c:407:2: error: implicit declaration of function 'll_run_time' [-Werror=implicit-function-declaration]
fs/select.c:502:3: error: too many arguments to function 'can_poll_ll'
fs/select.c:824:3: error: too many arguments to function 'can_poll_ll'
toshiba_acpi.c:(.text+0x314bb0): undefined reference to `i8042_remove_filter'
toshiba_acpi.c:(.devinit.text+0xb822): undefined reference to `i8042_install_filter'
toshiba_acpi.c:(.devinit.text+0xb98b): undefined reference to `i8042_remove_filter'
arch/xtensa/kernel/time.c:139:53: error: 'ccount_freq' undeclared (first use in this function)

[warnings]
drivers/md/dm-mpath.c:1564:1: warning: label 'again' defined but not used [-Wunused-label]
drivers/char/dtlk.c:203:36: warning: division by zero [-Wdiv-by-zero]
drivers/usb/serial/mos7720.c:1865:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/usb/serial/mos7840.c:2093:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/usb/serial/ssu100.c:333:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/usb/serial/whiteheat.c:470:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/usb/serial/whiteheat.c:471:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/usb/serial/quatech2.c:476:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/net/usb/cdc_subset.c:221:2: warning: #warning You need to configure some hardware for this driver [-Wcpp]
drivers/usb/serial/opticon.c:358:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/usb/serial/io_edgeport.c:1585:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/ide/ide-floppy.c:493:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]
WARNING: mm/built-in.o(.meminit.text+0xec0): Section mismatch in reference from the function .free_area_init_node() to the function .init.text:.set_pageblock_order()
net/netfilter/nf_conntrack_proto_sctp.c:47:15: warning: integer overflow in expression [-Woverflow]
fs/cifs/connect.c:3435:3: warning: 'xid' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/netfilter/nf_conntrack_proto_tcp.c:72:34: warning: integer overflow in expression [-Woverflow]

[sparse]
drivers/gpu/drm/radeon/radeon_cs.c:639:35: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned long [unsigned] [usertype] size @@    got ned] [usertype] size @@
drivers/gpu/drm/radeon/radeon_cs.c:639:66: sparse: incorrect type in argument 2 (different base types) @@    expected restricted gfp_t [usertype] flags @@    got t [usertype] flags @@
drivers/net/ethernet/alx/alx_main.c:638:26: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_main.c:640:28: sparse: invalid assignment: &drivers/net/ethernet/alx/alx_main.c:642:21: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_main.c:642:21: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_main.c:661:21: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_main.c:661:21: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_main.c:670:26: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_main.c:676:33: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_main.c:681:40: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_main.c:694:24: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_main.c:695:35: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_main.c:695:35: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_main.c:695:35: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_main.c:695:35: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_main.c:695:35: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_main.c:695:35: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_main.c:695:35: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_main.c:695:35: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_main.c:696:73: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_main.c:696:73: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_main.c:696:73: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_main.c:696:73: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_main.c:698:24: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_main.c:2069:22: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2070:22: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2071:22: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2101:30: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2102:30: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2106:38: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2107:38: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2110:30: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2111:30: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2122:30: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2126:43: sparse: incorrect type in assignment (different base types) @@    expected restricted __be16 [usertype] payload_len @@    got 6 [usertype] payload_len @@
drivers/net/ethernet/alx/alx_main.c:2129:38: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2130:38: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2134:39: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [usertype] pkt_len @@    got icted __le32 [usertype] pkt_len @@
drivers/net/ethernet/alx/alx_main.c:2135:30: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2136:30: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2137:30: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2156:16: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_main.c:2173:9: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_main.c:2173:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [usertype] word0 @@    got  [usertype] word0 @@
drivers/net/ethernet/alx/alx_main.c:2194:17: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_main.c:2194:17: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [usertype] word0 @@    got  [usertype] word0 @@
drivers/net/ethernet/alx/alx_main.c:2197:20: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2262:30: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2263:33: sparse: restricted __be16 degrades to integer
drivers/net/ethernet/alx/alx_main.c:2263:30: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2266:30: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:2268:30: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_main.c:363:9: sparse: context imbalance in 'alx_free_rxring_buf' - different lock contexts for basic block
drivers/net/ethernet/alx/alx_main.c:701:35: sparse: context imbalance in 'alx_dispatch_skb' - different lock contexts for basic block
drivers/net/ethernet/alx/alx_main.c:363:9: sparse: context imbalance in 'alx_clean_rx_irq' - different lock contexts for basic block
drivers/net/ethernet/alx/alx_main.c:1346:9: sparse: cast truncates bits from constant value (ffffffff7fffffff becomes 7fffffff)
drivers/net/ethernet/alx/alx_main.c:1392:9: sparse: cast truncates bits from constant value (ffffffff7fffffff becomes 7fffffff)
drivers/net/ethernet/alx/alx_ethtool.c:446:21: sparse: symbol 'ar816x_regs_a' was not declared. Should it be static?
drivers/net/ethernet/alx/alx_ethtool.c:539:21: sparse: symbol 'ar816x_regs_b' was not declared. Should it be static?
drivers/net/ethernet/alx/alx_ethtool.c:632:21: sparse: symbol 'ar816x_regs_c' was not declared. Should it be static?
drivers/net/ethernet/alx/alx_ethtool.c:1270:43: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/ethernet/alx/alx_ethtool.c:1307:34: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_ethtool.c:1307:34: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_ethtool.c:1307:34: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_ethtool.c:1307:34: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_ethtool.c:1313:34: sparse: cast to restricted __be32
drivers/net/ethernet/alx/alx_ethtool.c:1313:34: sparse: cast to restricted __be32
drivers/net/ethernet/alx/alx_ethtool.c:1313:34: sparse: cast to restricted __be32
drivers/net/ethernet/alx/alx_ethtool.c:1313:34: sparse: cast to restricted __be32
drivers/net/ethernet/alx/alx_ethtool.c:1313:34: sparse: cast to restricted __be32
drivers/net/ethernet/alx/alx_ethtool.c:1313:34: sparse: cast to restricted __be32
drivers/net/ethernet/alx/alx_ethtool.c:1314:34: sparse: cast to restricted __be32
drivers/net/ethernet/alx/alx_ethtool.c:1314:34: sparse: cast to restricted __be32
drivers/net/ethernet/alx/alx_ethtool.c:1314:34: sparse: cast to restricted __be32
drivers/net/ethernet/alx/alx_ethtool.c:1314:34: sparse: cast to restricted __be32
drivers/net/ethernet/alx/alx_ethtool.c:1314:34: sparse: cast to restricted __be32
drivers/net/ethernet/alx/alx_ethtool.c:1314:34: sparse: cast to restricted __be32
drivers/net/ethernet/alx/alx_ethtool.c:1315:34: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_ethtool.c:1315:34: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_ethtool.c:1315:34: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_ethtool.c:1315:34: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_ethtool.c:1316:35: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_ethtool.c:1316:35: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_ethtool.c:1316:35: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_ethtool.c:1316:35: sparse: cast to restricted __be16
drivers/net/ethernet/alx/alx_ethtool.c:1349:18: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_ethtool.c:1352:20: sparse: invalid assignment: &drivers/net/ethernet/alx/alx_ethtool.c:1353:13: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_ethtool.c:1353:13: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_ethtool.c:1369:13: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_ethtool.c:1369:13: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_ethtool.c:1377:18: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_ethtool.c:1379:17: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_ethtool.c:1384:24: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_ethtool.c:1394:16: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_ethtool.c:1484:36: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_ethtool.c:1485:36: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_ethtool.c:1486:36: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_ethtool.c:1487:36: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_ethtool.c:1493:17: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/alx/alx_ethtool.c:1493:17: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [usertype] word0 @@    got  [usertype] word0 @@
drivers/net/ethernet/alx/alx_ethtool.c:1494:28: sparse: invalid assignment: |drivers/net/ethernet/alx/alx_hw.c:798:6: sparse: symbol '__alx_wait_mdio_idle' was not declared. Should it be static?
drivers/net/ethernet/alx/alx_hw.c:812:6: sparse: symbol '__alx_stop_phy_polling' was not declared. Should it be static?
drivers/net/ethernet/alx/alx_hw.c:847:5: sparse: symbol '__alx_read_phy_core' was not declared. Should it be static?
drivers/net/ethernet/alx/alx_hw.c:899:5: sparse: symbol '__alx_write_phy_core' was not declared. Should it be static?
arch/x86/kernel/microcode_xen.c:187:45: sparse: incorrect type in initializer (different argument counts) @@    expected int enum ucode_state ( *request_microcode_fw )( ... ) @@    got int enum ucode_staint enum ucode_state ( *request_microcode_fw )( ... ) @@
drivers/net/ethernet/renesas/sh_eth.c:482:37: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2>*<noident> @@    got sn:2>*<noident> @@
drivers/net/ethernet/renesas/sh_eth.c:483:37: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2>*<noident> @@    got sn:2>*<noident> @@
drivers/net/ethernet/renesas/sh_eth.c:487:33: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2>*<noident> @@    got sn:2>*<noident> @@
drivers/net/ethernet/renesas/sh_eth.c:492:37: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2>*<noident> @@    got sn:2>*<noident> @@
drivers/net/ethernet/renesas/sh_eth.c:493:37: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2>*<noident> @@    got sn:2>*<noident> @@
drivers/net/ethernet/renesas/sh_eth.c:870:28: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2>*<noident> @@    got sn:2>*<noident> @@
drivers/net/ethernet/renesas/sh_eth.c:870:41: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2>*<noident> @@    got sn:2>*<noident> @@
drivers/net/ethernet/renesas/sh_eth.c:876:29: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2>*<noident> @@    got sn:2>*<noident> @@
drivers/net/ethernet/renesas/sh_eth.c:876:44: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2>*<noident> @@    got sn:2>*<noident> @@
drivers/net/ethernet/renesas/sh_eth.c:882:26: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2>*<noident> @@    got sn:2>*<noident> @@
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces) @@    expected void * @@    got void [noderef] <avoid * @@
drivers/net/ethernet/renesas/sh_eth.c:2034:24: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2>*<noident> @@    got noderef] <asn:2>*<noident> @@
drivers/net/ethernet/renesas/sh_eth.c:2035:62: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2>*<noident> @@    got noderef] <asn:2>*<noident> @@
drivers/net/ethernet/renesas/sh_eth.c:2049:24: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2>*<noident> @@    got noderef] <asn:2>*<noident> @@
drivers/net/ethernet/renesas/sh_eth.c:2050:37: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2>*<noident> @@    got noderef] <asn:2>*<noident> @@
drivers/net/ethernet/renesas/sh_eth.c:2079:24: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2>*<noident> @@    got sn:2>*<noident> @@
drivers/net/ethernet/renesas/sh_eth.c:2084:28: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2>*<noident> @@    got sn:2>*<noident> @@
drivers/net/ethernet/renesas/sh_eth.c:2095:24: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2>*<noident> @@    got sn:2>*<noident> @@
drivers/net/ethernet/renesas/sh_eth.c:2100:28: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2>*<noident> @@    got sn:2>*<noident> @@
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces) @@    expected void * @@    got void [noderef] <avoid * @@
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces) @@    expected void * @@    got void [noderef] <avoid * @@
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces) @@    expected void * @@    got void [noderef] <avoid * @@
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces) @@    expected void * @@    got void [noderef] <avoid * @@
drivers/net/ethernet/renesas/sh_eth.c:2415:23: sparse: incorrect type in assignment (different address spaces) @@    expected void *addr @@    got void [noderef] <avoid *addr @@
drivers/media/platform/vsp1/vsp1_drv.c:422:21: sparse: cast removes address space of expression
drivers/media/platform/vsp1/vsp1_drv.c:424:33: sparse: cast removes address space of expression
drivers/net/wireless/zd1211rw/zd_usb.c:396:24: sparse: implicit cast from nocast type
drivers/net/wireless/zd1211rw/zd_usb.c:432:24: sparse: implicit cast from nocast type
kernel/trace/trace.c:359:6: sparse: symbol 'tracer_tracing_on' was not declared. Should it be static?
kernel/trace/trace.c:578:6: sparse: symbol 'tracer_tracing_off' was not declared. Should it be static?
kernel/trace/trace.c:621:5: sparse: symbol 'tracer_tracing_is_on' was not declared. Should it be static?
kernel/trace/trace.c:207:5: sparse: symbol 'trace_array_get' was not declared. Should it be static?
kernel/trace/trace.c:231:6: sparse: symbol 'trace_array_put' was not declared. Should it be static?
kernel/trace/trace.c:2972:5: sparse: symbol 'tracing_open_generic_tr' was not declared. Should it be static?
kernel/trace/trace.c:2988:5: sparse: symbol 'tracing_open_generic_tc' was not declared. Should it be static?
drivers/net/ethernet/via/via-velocity.c:97:26: sparse: incorrect type in initializer (different address spaces) @@    expected void *addr @@    got struct mac_regs [noderef] <avoid *addr @@
drivers/net/ethernet/via/via-velocity.c:100:49: sparse: incorrect type in argument 2 (different base types) @@    expected restricted pci_power_t [usertype] state @@    got _t [usertype] state @@
drivers/net/ethernet/via/via-velocity.c:102:36: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/net/ethernet/via/via-velocity.c:2256:40: sparse: incorrect type in argument 2 (different base types) @@    expected char [signed] state @@    got restricted pci_powerchar [signed] state @@
drivers/net/ethernet/via/via-velocity.c:2264:48: sparse: incorrect type in argument 2 (different base types) @@    expected char [signed] state @@    got restricted pci_powerchar [signed] state @@
drivers/net/ethernet/via/via-velocity.c:2437:48: sparse: incorrect type in argument 2 (different base types) @@    expected char [signed] state @@    got restricted pci_powerchar [signed] state @@
drivers/net/ethernet/via/via-velocity.c:2450:48: sparse: incorrect type in argument 2 (different base types) @@    expected char [signed] state @@    got restricted pci_powerchar [signed] state @@
drivers/net/ethernet/via/via-velocity.c:2881:40: sparse: incorrect type in argument 2 (different base types) @@    expected char [signed] state @@    got restricted pci_powerchar [signed] state @@
drivers/net/ethernet/via/via-velocity.c:3153:48: sparse: incorrect type in argument 2 (different base types) @@    expected char [signed] state @@    got restricted pci_powerchar [signed] state @@
drivers/net/ethernet/via/via-velocity.c:3159:48: sparse: incorrect type in argument 2 (different base types) @@    expected char [signed] state @@    got restricted pci_powerchar [signed] state @@
drivers/net/ethernet/via/via-velocity.c:3211:40: sparse: incorrect type in argument 2 (different base types) @@    expected char [signed] state @@    got restricted pci_powerchar [signed] state @@
drivers/net/ethernet/via/via-velocity.c:3278:48: sparse: incorrect type in argument 2 (different base types) @@    expected char [signed] state @@    got restricted pci_powerchar [signed] state @@
drivers/net/ethernet/via/via-velocity.c:3293:48: sparse: incorrect type in argument 2 (different base types) @@    expected char [signed] state @@    got restricted pci_powerchar [signed] state @@
net/ipv6/icmp.c:99:47: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned int [unsigned] [usertype] info @@    got ed int [unsigned] [usertype] info @@
drivers/net/wireless/cw1200/hwio.h:236:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.h:236:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.h:236:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.h:236:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.h:236:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.h:200:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.h:200:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.h:200:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.h:200:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.h:236:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.h:236:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.h:185:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] tmp @@    got ed int [unsigned] [usertype] tmp @@
drivers/net/wireless/cw1200/hwio.h:200:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.h:200:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.h:185:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] tmp @@    got ed int [unsigned] [usertype] tmp @@
drivers/net/wireless/cw1200/txrx.c:617:64: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] listen_interval @@    got unsignrestricted __le16 [usertype] listen_interval @@
drivers/net/wireless/cw1200/hwio.c:80:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.c:80:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.c:80:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.c:80:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.c:95:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] val @@    got  short [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.h:185:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] tmp @@    got ed int [unsigned] [usertype] tmp @@
drivers/net/wireless/cw1200/hwio.h:185:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] tmp @@    got ed int [unsigned] [usertype] tmp @@
drivers/net/wireless/cw1200/hwio.h:185:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] tmp @@    got ed int [unsigned] [usertype] tmp @@
drivers/net/wireless/cw1200/hwio.h:200:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/net/wireless/cw1200/hwio.h:185:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] tmp @@    got ed int [unsigned] [usertype] tmp @@
drivers/net/wireless/cw1200/wsm.c:117:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:118:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:119:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:122:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:123:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:125:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:176:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:206:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:207:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:258:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:259:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:313:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:320:17: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:321:17: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:322:17: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:323:17: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:324:17: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:328:17: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:441:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:443:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:448:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:450:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:451:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:480:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:481:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:527:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:555:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:556:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:557:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:581:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:582:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:583:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:584:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:586:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:587:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:588:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:589:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:596:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:597:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:598:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:599:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:601:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:602:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:603:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:604:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:628:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:682:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:683:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:684:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:690:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:714:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:764:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:786:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.c:787:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.h:1480:23: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.h:1480:23: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.h:1480:23: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.h:1480:23: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/sta.c:66:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] cwmin @@    got e] cwmin @@
drivers/net/wireless/cw1200/sta.c:66:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] cwmax @@    got e] cwmax @@
drivers/net/wireless/cw1200/sta.c:66:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] aifns @@    got e] aifns @@
drivers/net/wireless/cw1200/sta.c:66:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] txop_limit @@    got e] txop_limit @@
drivers/net/wireless/cw1200/sta.c:66:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [usertype] max_rx_lifetime @@    got e] max_rx_lifetime @@
drivers/net/wireless/cw1200/sta.c:67:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] cwmin @@    got e] cwmin @@
drivers/net/wireless/cw1200/sta.c:67:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] cwmax @@    got e] cwmax @@
drivers/net/wireless/cw1200/sta.c:67:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] aifns @@    got e] aifns @@
drivers/net/wireless/cw1200/sta.c:67:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] txop_limit @@    got e] txop_limit @@
drivers/net/wireless/cw1200/sta.c:67:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [usertype] max_rx_lifetime @@    got e] max_rx_lifetime @@
drivers/net/wireless/cw1200/sta.c:68:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] cwmin @@    got e] cwmin @@
drivers/net/wireless/cw1200/sta.c:68:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] cwmax @@    got e] cwmax @@
drivers/net/wireless/cw1200/sta.c:68:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] aifns @@    got e] aifns @@
drivers/net/wireless/cw1200/sta.c:68:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] txop_limit @@    got e] txop_limit @@
drivers/net/wireless/cw1200/sta.c:68:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [usertype] max_rx_lifetime @@    got e] max_rx_lifetime @@
drivers/net/wireless/cw1200/sta.c:69:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] cwmin @@    got e] cwmin @@
drivers/net/wireless/cw1200/sta.c:69:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] cwmax @@    got e] cwmax @@
drivers/net/wireless/cw1200/sta.c:69:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] aifns @@    got e] aifns @@
drivers/net/wireless/cw1200/sta.c:69:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] txop_limit @@    got e] txop_limit @@
drivers/net/wireless/cw1200/sta.c:69:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [usertype] max_rx_lifetime @@    got e] max_rx_lifetime @@
drivers/net/wireless/cw1200/sta.c:625:33: sparse: incorrect type in assignment (different base types) @@    expected bool [unsigned] [usertype] old_uapsd_flags @@    got rebool [unsigned] [usertype] old_uapsd_flags @@
drivers/net/wireless/cw1200/sta.c:635:17: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] cwmin @@    got unsigned shortrestricted __le16 [usertype] cwmin @@
drivers/net/wireless/cw1200/sta.c:635:17: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] cwmax @@    got unsigned shortrestricted __le16 [usertype] cwmax @@
drivers/net/wireless/cw1200/sta.c:635:17: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] aifns @@    got unsigned charrestricted __le16 [usertype] aifns @@
drivers/net/wireless/cw1200/sta.c:635:17: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] txop_limit @@    got e] txop_limit @@
drivers/net/wireless/cw1200/sta.c:635:17: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [usertype] max_rx_lifetime @@    got e] max_rx_lifetime @@
drivers/net/wireless/cw1200/sta.c:1790:75: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned long [unsigned] word @@    got restunsigned long [unsigned] word @@
drivers/net/wireless/cw1200/sta.c:1792:73: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned long [unsigned] word @@    got restunsigned long [unsigned] word @@
drivers/net/wireless/cw1200/sta.c:1950:29: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [assigned] [usertype] val @@    got igned] [assigned] [usertype] val @@
drivers/net/wireless/cw1200/wsm.h:1480:23: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/wsm.h:1480:23: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/net/wireless/cw1200/cw1200_spi.c:82:17: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [addressable] [assigned] [usertype] regaddr @@    got sable] [assigned] [usertype] regaddr @@
drivers/net/wireless/cw1200/cw1200_spi.c:142:17: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [addressable] [assigned] [usertype] regaddr @@    got sable] [assigned] [usertype] regaddr @@
drivers/net/can/c_can/c_can_platform.c:205:32: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const *ptr @@    got unsigned int [noderef] [usertyvoid const *ptr @@
drivers/net/ethernet/sfc/ethtool.c:1117:5: sparse: symbol 'efx_ethtool_get_ts_info' was not declared. Should it be static?
drivers/net/vxlan.c:178:16: sparse: incompatible types in comparison expression (different address spaces)
drivers/net/vxlan.c:178:16: sparse: incompatible types in comparison expression (different address spaces)
drivers/net/vxlan.c:178:16: sparse: incompatible types in comparison expression (different address spaces)
drivers/net/vxlan.c:178:16: sparse: incompatible types in comparison expression (different address spaces)
net/ipv4/ipip.c:253:27: sparse: incorrect type in assignment (different base types) @@    expected restricted __be32 [addressable] [usertype] o_key @@    got restricted __be32 [addressable] [usertype] o_key @@
drivers/usb/gadget/rndis.c:1145:5: sparse: symbol 'rndis_init' was not declared. Should it be static?
drivers/usb/gadget/rndis.c:1179:6: sparse: symbol 'rndis_exit' was not declared. Should it be static?

[coccinelle]
drivers/input/touchscreen/cyttsp4_core.c:1454:14-17: ERROR: cd is NULL but dereferenced.
drivers/input/touchscreen/cyttsp4_core.c:2081:6-26: ERROR: Threaded IRQ with no primary handler requested without IRQF_ONESHOT
drivers/input/touchscreen/cyttsp4_i2c.c:53:1-3: WARNING: PTR_RET can be used
drivers/input/touchscreen/cyttsp4_spi.c:176:1-3: WARNING: PTR_RET can be used

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
