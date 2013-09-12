From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 12 Sep 2013 22:15:02 +0000
Subject: build regressions 2013-09-12
Message-Id: <52323ce6.Zzmi+3gt9RB+9Uzm%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/block/skd_main.c:441:3: error: implicit declaration of function 'readq' [-Werror=implicit-function-declaration]
drivers/block/skd_main.c:455:3: error: implicit declaration of function 'writeq' [-Werror=implicit-function-declaration]
az6027.c:(.text+0x1ee857): undefined reference to `stb0899_attach'
az6027.c:(.text+0x1ee877): undefined reference to `stb6100_attach'
cxusb.c:(.text+0x1f5b7f): undefined reference to `dib7000p_get_i2c_master'
cxusb.c:(.text+0x1f5c62): undefined reference to `dib7000p_set_wbd_ref'
cxusb.c:(.text+0x1f5c89): undefined reference to `dib7000p_set_gpio'
cxusb.c:(.text+0x1f6500): undefined reference to `dib7000p_i2c_enumeration'
fs/sysfs/mount.c:110:8: error: 'type' undeclared (first use in this function)
include/linux/sysfs.h:428:1: error: expected identifier or '(' before '{' token
ERROR: "sysfs_get_dirent_ns" [drivers/md/md-mod.ko] undefined!

[warnings]
drivers/media/pci/zoran/zoran_device.c:451:3: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:114) [-Wdeprecated-declarations]
drivers/media/pci/zoran/zoran_device.c:453:3: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:114) [-Wdeprecated-declarations]
drivers/media/pci/zoran/zoran_device.c:796:2: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:114) [-Wdeprecated-declarations]
drivers/media/pci/zoran/zoran_driver.c:241:3: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:114) [-Wdeprecated-declarations]
drivers/media/pci/zoran/zoran_driver.c:245:3: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:114) [-Wdeprecated-declarations]
drivers/media/pci/zoran/zoran_driver.c:334:3: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:114) [-Wdeprecated-declarations]
drivers/media/pci/zoran/zoran_driver.c:347:5: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:114) [-Wdeprecated-declarations]
drivers/media/pci/zoran/zoran_driver.c:366:6: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:114) [-Wdeprecated-declarations]
Warning(include/linux/mtd/nand.h:587): Excess struct/union/enum/typedef member 'ecclayout' description in 'nand_chip'
drivers/block/skd_main.c:4584:17: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
drivers/block/skd_main.c:4584:17: warning: format '%lu' expects argument of type 'long unsigned int', but argument 7 has type 'unsigned int' [-Wformat=]
drivers/block/skd_main.c:4610:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/block/skd_main.c:4613:27: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/block/skd_main.c:4613:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/block/skd_main.c:4638:17: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
drivers/block/skd_main.c:4638:17: warning: format '%lu' expects argument of type 'long unsigned int', but argument 7 has type 'unsigned int' [-Wformat=]
drivers/block/skd_main.c:4649:42: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'unsigned int' [-Wformat=]
drivers/block/skd_main.c:4649:42: warning: format '%lu' expects argument of type 'long unsigned int', but argument 7 has type 'unsigned int' [-Wformat=]
drivers/block/skd_main.c:4695:17: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
drivers/block/skd_main.c:4695:17: warning: format '%lu' expects argument of type 'long unsigned int', but argument 7 has type 'unsigned int' [-Wformat=]
drivers/block/skd_main.c:1171:7: warning: unused variable 'cpu' [-Wunused-variable]
include/linux/sysfs.h:426:1: warning: 'sysfs_get_dirent_ns' used but never defined [enabled by default]
drivers/block/skd_main.c:5324:4: warning: passing argument 1 of 'iounmap' discards 'volatile' qualifier from pointer target type [enabled by default]
drivers/block/skd_main.c:5487:4: warning: passing argument 1 of 'iounmap' discards 'volatile' qualifier from pointer target type [enabled by default]
drivers/block/skd_main.c:1120:3: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 7 has type 'dma_addr_t' [-Wformat]
drivers/block/skd_main.c:1256:3: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 7 has type 'dma_addr_t' [-Wformat]
drivers/block/skd_main.c:1936:3: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 7 has type 'dma_addr_t' [-Wformat]
drivers/block/skd_main.c:2486:2: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'dma_addr_t' [-Wformat]
drivers/block/skd_main.c:2548:3: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 8 has type 'dma_addr_t' [-Wformat]
net/ipv6/ndisc.c:1730:1: warning: label 'out' defined but not used [-Wunused-label]

[sparse]
drivers/md/bcache/journal.c:660:29: sparse: context imbalance in 'journal_wait_for_write' - wrong count at exit
drivers/md/bcache/journal.c:741:9: sparse: context imbalance in 'bch_journal' - unexpected unlock
drivers/md/bcache/btree.c:2172:5: sparse: symbol 'btree_insert_fn' was not declared. Should it be static?
drivers/block/skd_main.c:384:19: sparse: symbol 'skd_flush_slab' was not declared. Should it be static?
drivers/block/skd_main.c:921:24: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] be_lba @@    got ed int [unsigned] [usertype] be_lba @@
drivers/block/skd_main.c:922:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] be_count @@    got ed int [unsigned] [usertype] be_count @@
drivers/block/skd_main.c:923:25: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] be_dmaa @@    got g long [unsigned] [usertype] be_dmaa @@
drivers/block/skd_main.c:978:49: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] sg_list_len_bytes @@    got ed int [unsigned] [usertype] sg_list_len_bytes @@
drivers/block/skd_main.c:2039:51: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] sg_list_dma_address @@    got g long [unsigned] [usertype] sg_list_dma_address @@
drivers/block/skd_main.c:2042:41: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] sg_list_len_bytes @@    got ed int [unsigned] [usertype] sg_list_len_bytes @@
drivers/block/skd_main.c:2112:18: sparse: cast to restricted __be32
drivers/block/skd_main.c:2112:18: sparse: cast to restricted __be32
drivers/block/skd_main.c:2112:18: sparse: cast to restricted __be32
drivers/block/skd_main.c:2112:18: sparse: cast to restricted __be32
drivers/block/skd_main.c:2112:18: sparse: cast to restricted __be32
drivers/block/skd_main.c:2112:18: sparse: cast to restricted __be32
drivers/block/skd_main.c:1626:27: sparse: incorrect type in initializer (different address spaces) @@    expected void [noderef] <asn:1>*p @@    got sn:1>*p @@
drivers/block/skd_main.c:2192:39: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] sg_list_dma_address @@    got g long [unsigned] [usertype] sg_list_dma_address @@
drivers/block/skd_main.c:2239:45: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] sg_list_len_bytes @@    got ed int [unsigned] [usertype] sg_list_len_bytes @@
drivers/block/skd_main.c:2248:45: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] sg_list_len_bytes @@    got ed int [unsigned] [usertype] sg_list_len_bytes @@
drivers/block/skd_main.c:2263:45: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] sg_list_len_bytes @@    got ed int [unsigned] [usertype] sg_list_len_bytes @@
drivers/block/skd_main.c:2275:45: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] sg_list_len_bytes @@    got ed int [unsigned] [usertype] sg_list_len_bytes @@
drivers/block/skd_main.c:2863:25: sparse: cast to restricted __be32
drivers/block/skd_main.c:2863:25: sparse: cast to restricted __be32
drivers/block/skd_main.c:2863:25: sparse: cast to restricted __be32
drivers/block/skd_main.c:2863:25: sparse: cast to restricted __be32
drivers/block/skd_main.c:2863:25: sparse: cast to restricted __be32
drivers/block/skd_main.c:2863:25: sparse: cast to restricted __be32
drivers/block/skd_main.c:2865:25: sparse: cast to restricted __be32
drivers/block/skd_main.c:2865:25: sparse: cast to restricted __be32
drivers/block/skd_main.c:2865:25: sparse: cast to restricted __be32
drivers/block/skd_main.c:2865:25: sparse: cast to restricted __be32
drivers/block/skd_main.c:2865:25: sparse: cast to restricted __be32
drivers/block/skd_main.c:2865:25: sparse: cast to restricted __be32
drivers/block/skd_main.c:2933:37: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [addressable] [assigned] [usertype] pcie_bus_number @@    got sable] [assigned] [usertype] pcie_bus_number @@
drivers/block/skd_main.c:2938:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [addressable] [assigned] [usertype] pcie_vendor_id @@    got sable] [assigned] [usertype] pcie_vendor_id @@
drivers/block/skd_main.c:2941:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [addressable] [assigned] [usertype] pcie_device_id @@    got sable] [assigned] [usertype] pcie_device_id @@
drivers/block/skd_main.c:2945:46: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [addressable] [assigned] [usertype] pcie_subsystem_vendor_id @@    got sable] [assigned] [usertype] pcie_subsystem_vendor_id @@
drivers/block/skd_main.c:2948:46: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [addressable] [assigned] [usertype] pcie_subsystem_device_id @@    got sable] [assigned] [usertype] pcie_subsystem_device_id @@
drivers/block/skd_main.c:2971:25: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [addressable] [assigned] [usertype] page_length @@    got sable] [assigned] [usertype] page_length @@
drivers/block/skd_main.c:2982:17: sparse: cast to restricted __be32
drivers/block/skd_main.c:2982:17: sparse: cast to restricted __be32
drivers/block/skd_main.c:2982:17: sparse: cast to restricted __be32
drivers/block/skd_main.c:2982:17: sparse: cast to restricted __be32
drivers/block/skd_main.c:2982:17: sparse: cast to restricted __be32
drivers/block/skd_main.c:2982:17: sparse: cast to restricted __be32
drivers/block/skd_main.c:3056:29: sparse: cast to restricted __be32
drivers/block/skd_main.c:3056:29: sparse: cast to restricted __be32
drivers/block/skd_main.c:3056:29: sparse: cast to restricted __be32
drivers/block/skd_main.c:3056:29: sparse: cast to restricted __be32
drivers/block/skd_main.c:3056:29: sparse: cast to restricted __be32
drivers/block/skd_main.c:3056:29: sparse: cast to restricted __be32
drivers/block/skd_main.c:5355:34: sparse: cast removes address space of expression
drivers/block/skd_main.c:5355:34: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/block/skd_main.c:5386:34: sparse: cast removes address space of expression
drivers/block/skd_main.c:5386:34: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/block/skd_main.c:5626:12: sparse: symbol 'skd_skmsg_state_to_str' was not declared. Should it be static?
drivers/block/skd_main.c:5638:12: sparse: symbol 'skd_skreq_state_to_str' was not declared. Should it be static?
drivers/gpu/drm/radeon/rs780_dpm.c:1003:5: sparse: symbol 'rs780_dpm_force_performance_level' was not declared. Should it be static?
drivers/gpu/drm/radeon/trinity_dpm.c:1071:6: sparse: symbol 'trinity_dpm_enable_bapm' was not declared. Should it be static?
fs/sysfs/mount.c:110:48: sparse: undefined identifier 'type'

[coccinelle]
drivers/block/skd_main.c:4938:9-14: ERROR: reference preceded by free on line 4936
drivers/md/bcache/journal.c:679:3-9: preceding lock on line 668
drivers/md/bcache/journal.c:679:3-9: preceding lock on line 668
drivers/md/bcache/journal.c:679:3-9: preceding lock on line 707
drivers/md/bcache/request.c:935:1-7: Replace memcpy with struct assignment

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
