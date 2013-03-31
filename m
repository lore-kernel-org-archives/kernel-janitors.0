From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 31 Mar 2013 17:24:00 +0000
Subject: build regressions 2013-03-31
Message-Id: <51587130.LZAIQere6SXUVdnb%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
ERROR: Input tree has errors, aborting (use -f to force output)
drivers/media/v4l2-core/videobuf2-dma-contig.c:194:2: error: implicit declaration of function 'dma_mmap_coherent' [-Werror=implicit-function-declaration]
drivers/media/v4l2-core/videobuf2-dma-contig.c:387:2: error: implicit declaration of function 'dma_get_sgtable' [-Werror=implicit-function-declaration]
drivers/scsi/atari_NCR5380.c:736:2: error: implicit declaration of function 'atari_scsi_proc_info' [-Werror=implicit-function-declaration]
drivers/scsi/atari_NCR5380.c:765:12: error: static declaration of 'atari_scsi_proc_info' follows non-static declaration
(.rodata+0x1a78): undefined reference to `sys_fork'
include/linux/namei.h:114:19: error: 'ESTALE' undeclared (first use in this function)
/c/kernel-tests/src/tip/include/asm-generic/pgtable.h:462:9: error: implicit declaration of function 'page_to_section' [-Werror=implicit-function-declaration]
/c/kernel-tests/src/tip/include/linux/mm.h:708:29: error: conflicting types for 'page_to_section'
fs/namespace.c:2296:1: error: unknown type name 'atomic64_t'
fs/namespace.c:2296:1: error: implicit declaration of function 'ATOMIC64_INIT' [-Werror=implicit-function-declaration]
fs/namespace.c:2296:1: error: initializer element is not constant
fs/namespace.c:2305:2: error: implicit declaration of function 'atomic64_add_return' [-Werror=implicit-function-declaration]
drivers/staging/sb105x/sb_pci_mp.h:22:25: fatal error: asm/segment.h: No such file or directory
drivers/pci/quirks.c:88:7: error: 'isa_dma_bridge_buggy' undeclared (first use in this function)
drivers/atm/iphase.h:639:25: error: conflicting type qualifiers for 'freg_t'
drivers/staging/sb105x/sb_pci_mp.h:23:24: fatal error: asm/serial.h: No such file or directory
fs/f2fs/segment.c:628:4: error: implicit declaration of function 'prefetchw' [-Werror=implicit-function-declaration]
fs/f2fs/data.c:311:4: error: implicit declaration of function 'prefetchw' [-Werror=implicit-function-declaration]
drivers/message/i2o/i2o_proc.c:2001:2: error: implicit declaration of function 'remove_proc_subtree' [-Werror=implicit-function-declaration]
make[2]: *** No rule to make target `drivers/tty/serial/8250/8250.c', needed by `Documentation/DocBook/device-drivers.xml'.
Error: no ID for constraint linkend: V4L2-PIX-FMT-NV12MT-16X16.

[warnings]
fs/proc/generic.c:682:10: warning: unused variable 'nlink' [-Wunused-variable]
fs/proc/generic.c:712:10: warning: unused variable 'nlink' [-Wunused-variable]
drivers/gpu/drm/gma500/mdfld_dsi_dpi.c:833:35: warning: array subscript is below array bounds [-Warray-bounds]
drivers/gpu/drm/gma500/mdfld_dsi_dpi.c:834:33: warning: array subscript is below array bounds [-Warray-bounds]
drivers/scsi/advansys.c:3350:6: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'long unsigned int' [-Wformat]
drivers/scsi/advansys.c:3364:6: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'ulong' [-Wformat]
drivers/scsi/advansys.c:3364:6: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'long unsigned int' [-Wformat]
drivers/scsi/advansys.c:3366:2: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'long unsigned int' [-Wformat]
drivers/scsi/advansys.c:3544:6: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'void *' [-Wformat]
drivers/scsi/advansys.c:3673:6: warning: format '%d' expects a matching 'int' argument [-Wformat]
drivers/scsi/advansys.c:3716:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3716:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3716:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3716:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3721:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3721:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3721:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3721:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3721:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 7 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3726:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3726:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3726:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3726:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3733:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3733:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3736:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3736:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3741:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3741:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3745:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3745:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3749:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type '__u32' [-Wformat]
drivers/scsi/advansys.c:3749:7: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__u32' [-Wformat]
drivers/staging/dgrp/dgrp_specproc.c:66:31: warning: 'config_proc_file_ops' defined but not used [-Wunused-variable]
drivers/staging/dgrp/dgrp_specproc.c:75:31: warning: 'info_proc_file_ops' defined but not used [-Wunused-variable]
drivers/staging/dgrp/dgrp_specproc.c:83:31: warning: 'nodeinfo_proc_file_ops' defined but not used [-Wunused-variable]
Warning(kernel/signal.c:2679): No description found for parameter 'uset'
Warning(kernel/signal.c:2679): Excess function parameter 'set' description in 'sys_rt_sigpending'
Warning(fs/dcache.c:870): No description found for parameter 'nr_to_scan'
Warning(fs/dcache.c:870): Excess function parameter 'count' description in 'prune_dcache_sb'
Warning(fs/dcache.c:886): No description found for parameter 'nodes_to_walk'
Warning(fs/dcache.c:886): No description found for parameter 'memcg'
Warning(include/linux/hsi/hsi.h:136): Excess struct/union/enum/typedef member 'e_handler' description in 'hsi_client'
Warning(include/linux/hsi/hsi.h:136): Excess struct/union/enum/typedef member 'pclaimed' description in 'hsi_client'
Warning(include/linux/hsi/hsi.h:136): Excess struct/union/enum/typedef member 'nb' description in 'hsi_client'
Warning(drivers/hsi/hsi.c:434): No description found for parameter 'handler'
Warning(drivers/hsi/hsi.c:434): Excess function parameter 'cb' description in 'hsi_register_port_event'
Warning(include/linux/spi/spi.h:104): No description found for parameter 'cs_gpio'
Warning(include/linux/spi/spi.h:368): No description found for parameter 'cs_gpios'

[sparse]
fs/inode.c:716:17: sparse: context imbalance in 'inode_lru_isolate' - unexpected unlock
lib/list_lru.c:139:1: sparse: symbol 'list_lru_dispose_all_node' was not declared. Should it be static?
lib/list_lru.c:88:18: sparse: context imbalance in 'list_lru_walk_node' - different lock contexts for basic block
fs/xfs/xfs_buf.c:1487:43: sparse: context imbalance in 'xfs_buftarg_wait_rele' - unexpected unlock
include/linux/rcupdate.h:326:30: sparse: context imbalance in 'lowmem_scan' - unexpected unlock
include/linux/version.h:1:9: sparse: preprocessor token UTS_RELEASE redefined
include/generated/utsrelease.h:1:9: sparse: preprocessor token UTS_RELEASE redefined
fs/read_write.c:1004:1: sparse: symbol 'compat_sys_preadv64' was not declared. Should it be static?
fs/read_write.c:1070:1: sparse: symbol 'compat_sys_pwritev64' was not declared. Should it be static?

[coccinelle]
drivers/acpi/power.c:859:2-12: second lock on line 859
drivers/block/loop.c:1460:1-7: preceding lock on line 1436
drivers/block/loop.c:780:8-15: ERROR: PTR_ERR applied after initialization to constant on line 772

[cppcheck]
drivers/scsi/sym53c8xx_2/sym_hipd.h:1118: error: "Unsupported DMA addressing mode"

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
