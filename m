From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 21 Sep 2013 21:43:30 +0000
Subject: build regressions 2013-09-21
Message-Id: <523e1302.PNYWnlF3qlx+3356%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/net/ethernet/sfc/rx.c:877:22: error: dereferencing pointer to incomplete type
drivers/net/ethernet/sfc/rx.c:878:29: error: dereferencing pointer to incomplete type
drivers/net/ethernet/sfc/rx.c:878:48: error: dereferencing pointer to incomplete type
drivers/net/ethernet/sfc/rx.c:879:29: error: dereferencing pointer to incomplete type
drivers/net/ethernet/sfc/rx.c:879:48: error: dereferencing pointer to incomplete type
drivers/net/ethernet/sfc/rx.c:880:3: error: invalid use of undefined type 'struct ipv6hdr'
drivers/gpio/gpio-bcm-kona.c:482:2: error: implicit declaration of function 'set_irq_flags' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-bcm-kona.c:482:22: error: 'IRQF_VALID' undeclared (first use in this function)
drivers/gpio/gpio-bcm-kona.c:601:22: error: 'IRQF_VALID' undeclared (first use in this function)
drivers/gpio/gpio-bcm-kona.c:537:2: error: implicit declaration of function 'of_irq_count' [-Werror=implicit-function-declaration]
av7110_ir.c:(.text+0x2232d3): undefined reference to `input_event'
av7110_ir.c:(.text+0x2232ec): undefined reference to `input_event'
av7110_ir.c:(.text+0x2233cd): undefined reference to `input_event'
av7110_ir.c:(.text+0x22340e): undefined reference to `input_event'
av7110_ir.c:(.text+0x223420): undefined reference to `input_event'
ti_am335x_adc.c:(.text+0x11af33): undefined reference to `iio_kfifo_free'

[warnings]
drivers/net/ethernet/sfc/tx.c:432:1: warning: label 'finish_packet' defined but not used [-Wunused-label]
drivers/gpio/gpio-bcm-kona.c:586:2: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' [-Wformat=]
drivers/block/skd_main.c:4559:96: warning: format '%u' expects argument of type 'unsigned int', but argument 5 has type 'long unsigned int' [-Wformat=]
drivers/block/skd_main.c:4614:78: warning: format '%u' expects argument of type 'unsigned int', but argument 5 has type 'long unsigned int' [-Wformat=]
drivers/block/skd_main.c:4614:78: warning: format '%u' expects argument of type 'unsigned int', but argument 7 has type 'long unsigned int' [-Wformat=]
drivers/block/skd_main.c:4626:95: warning: format '%u' expects argument of type 'unsigned int', but argument 6 has type 'long unsigned int' [-Wformat=]
drivers/block/skd_main.c:4626:95: warning: format '%u' expects argument of type 'unsigned int', but argument 7 has type 'long unsigned int' [-Wformat=]
drivers/block/skd_main.c:4671:72: warning: format '%u' expects argument of type 'unsigned int', but argument 5 has type 'long unsigned int' [-Wformat=]
drivers/block/skd_main.c:4671:72: warning: format '%u' expects argument of type 'unsigned int', but argument 7 has type 'long unsigned int' [-Wformat=]

[sparse]
drivers/net/ethernet/sfc/ef10.c:344:9: sparse: Variable length array is used.
net/bridge/br_mdb.c:450:17: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct net_bridge_port_group *<noident> @@    got struct net_bridgestruct net_bridge_port_group *<noident> @@
drivers/net/bonding/bond_main.c:893:17: sparse: incorrect type in assignment (different address spaces) @@    expected struct slave *volatile <noident> @@    got struct sstruct slave *volatile <noident> @@
drivers/net/bonding/bond_main.c:1604:25: sparse: incorrect type in assignment (different address spaces) @@    expected struct slave *volatile <noident> @@    got struct sstruct slave *volatile <noident> @@
drivers/net/bonding/bond_main.c:1804:17: sparse: incorrect type in assignment (different address spaces) @@    expected struct slave *volatile <noident> @@    got struct slave *volatile <noident> @@
drivers/net/bonding/bond_alb.c:1670:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct slave *volatile <noident> @@    got struct sstruct slave *volatile <noident> @@
fs/binfmt_elf.c:2057:38: sparse: Using plain integer as NULL pointer
drivers/video/backlight/lm3630a_bl.c:94:68: sparse: mixing different enum types
drivers/video/aty/radeon_pm.c:2520:31: sparse: restricted pci_power_t degrades to integer
drivers/video/aty/radeon_pm.c:2522:65: sparse: restricted pci_power_t degrades to integer
drivers/iio/adc/ti_am335x_adc.c:229:5: sparse: symbol 'tiadc_iio_buffered_hardware_setup' was not declared. Should it be static?
drivers/net/ethernet/sfc/tx.c:529:9: sparse: undefined identifier 'trace_sfc_transmit'
drivers/net/ethernet/sfc/rx.c:463:9: sparse: undefined identifier 'trace_sfc_receive'
drivers/net/ethernet/sfc/ptp.c:347:17: sparse: undefined identifier 'trace_sfc_receive'
kernel/gcov/base.c:82:6: sparse: symbol '__gcov_merge_ior' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
