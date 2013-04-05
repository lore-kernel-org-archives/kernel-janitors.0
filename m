From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 05 Apr 2013 16:49:27 +0000
Subject: build regressions 2013-04-05
Message-Id: <515f0097.zNB7D989UJZR+mNT%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/dma/dmatest.c:572:28: error: 'struct dev_archdata' has no member named 'mapping'
drivers/dma/dmatest.c:573:51: error: 'struct dev_archdata' has no member named 'mapping'
drivers/dma/dmatest.c:574:25: error: 'struct dev_archdata' has no member named 'mapping'
drivers/dma/dmatest.c:640:29: error: 'struct dev_archdata' has no member named 'mapping'
drivers/scsi/virtio_scsi.c:633: error: invalid type argument of 'unary *'
drivers/scsi/virtio_scsi.c:633: error: invalid type argument of 'unary *'
drivers/scsi/virtio_scsi.c:633: error: invalid type argument of 'unary *'
drivers/scsi/virtio_scsi.c:633: error: invalid type argument of 'unary *'
drivers/scsi/virtio_scsi.c:633: error: invalid type argument of 'unary *'
drivers/scsi/virtio_scsi.c:633: error: invalid type argument of 'unary *'
drivers/scsi/virtio_scsi.c:633: error: invalid type argument of 'unary *'
drivers/scsi/virtio_scsi.c:634: error: invalid type argument of 'unary *'
drivers/scsi/virtio_scsi.c:634: error: invalid type argument of 'unary *'
drivers/scsi/virtio_scsi.c:634: error: invalid type argument of 'unary *'
drivers/scsi/virtio_scsi.c:634: error: invalid type argument of 'unary *'
drivers/scsi/virtio_scsi.c:634: error: invalid type argument of 'unary *'
drivers/scsi/virtio_scsi.c:634: error: invalid type argument of 'unary *'
drivers/scsi/virtio_scsi.c:634: error: invalid type argument of 'unary *'
fs/aio.c:1024:6: error: 'opcode' undeclared (first use in this function)
drivers/dma/xilinx/xilinx_axidma.c:952:2: error: implicit declaration of function 'irq_dispose_mapping' [-Werror=implicit-function-declaration]
drivers/dma/xilinx/xilinx_axivdma.c:1041:2: error: implicit declaration of function 'irq_dispose_mapping' [-Werror=implicit-function-declaration]
drivers/dma/xilinx/xilinx_axicdma.c:850:2: error: implicit declaration of function 'irq_dispose_mapping' [-Werror=implicit-function-declaration]
drivers/video/xylon/xylonfb/platform/../core/xylonfb.c:742:3: error: implicit declaration of function 'dma_alloc_writecombine' [-Werror=implicit-function-declaration]
drivers/virtio/virtio_pci.c:106:13: error: conflicting types for '__raw_writeq'
drivers/virtio/virtio_pci.c:113:12: error: conflicting types for '__raw_readq'
drivers/virtio/virtio_pci.c:190:2: error: implicit declaration of function 'ioread64' [-Werror=implicit-function-declaration]
drivers/virtio/virtio_pci.c:197:2: error: implicit declaration of function 'iowrite64' [-Werror=implicit-function-declaration]
drivers/remoteproc/remoteproc_core.c:861:2: error: implicit declaration of function 'rproc_handle_resource' [-Werror=implicit-function-declaration]
arch/x86/kvm/../../../virt/kvm/ioapic.c:139:16: error: 'union kvm_ioapic_redirect_entry' has no member named 'fileds'
drivers/dma/dmatest.c:23:27: fatal error: asm/dma-iommu.h: No such file or directory

[warnings]
WARNING: mm/built-in.o(.text+0x3f5b0): Section mismatch in reference from the function page_cgroup_init() to the function .init.text:alloc_node_page_cgroup()
drivers/acpi/osl.c:651:36: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
Warning(drivers/mtd/nand/nand_base.c:2038): No description found for parameter 'offset'
Warning(drivers/mtd/nand/nand_base.c:2038): No description found for parameter 'data_buf'
Warning(drivers/mtd/nand/nand_base.c:2038): Excess function parameter 'column' description in 'nand_write_subpage_hwecc'
Warning(drivers/mtd/nand/nand_base.c:2038): No description found for parameter 'offset'
Warning(drivers/mtd/nand/nand_base.c:2038): No description found for parameter 'data_buf'
Warning(drivers/mtd/nand/nand_base.c:2038): Excess function parameter 'column' description in 'nand_write_subpage_hwecc'
drivers/misc/si570.c:454:14: warning: 'tmp' may be used uninitialized in this function [-Wuninitialized]
drivers/dma/xilinx/vdmatest.c:277:4: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'dma_addr_t' [-Wformat]
drivers/dma/xilinx/vdmatest.c:288:4: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'dma_addr_t' [-Wformat]
drivers/video/xylon/xylonfb/platform/../core/xylonfb.c:742:23: warning: assignment makes pointer from integer without a cast [enabled by default]
fs/namei.c:609:24: warning: 'cookie' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/namei.c:609:24: warning: 'cookie' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/namei.c:609:24: warning: 'cookie' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/trace/trace_events_filter.c:2074:8: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/common/tuners/tda18212.c:248:2: warning: 'val' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/pstore/ram.c:292:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'size_t' [-Wformat]
drivers/scsi/qla4xxx/ql4_nx.c:1867:2: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'uint32_t' [-Wformat]
drivers/usb/c67x00/c67x00-drv.c:148:3: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
mm/frontswap.c:299:14: warning: 'type' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/common/tuners/xc4000.c:1106:2: warning: 'fw_minor' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/common/tuners/xc4000.c:1106:2: warning: 'fw_major' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/common/tuners/xc4000.c:1106:2: warning: 'hw_minor' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/common/tuners/xc4000.c:1106:2: warning: 'hw_major' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/staging/zcache/zcache-main.c:1702:3: warning: 'idr_pre_get' is deprecated (declared at include/linux/idr.h:147) [-Wdeprecated-declarations]
drivers/staging/zcache/zcache-main.c:1708:3: warning: 'idr_get_new' is deprecated (declared at include/linux/idr.h:177) [-Wdeprecated-declarations]
drivers/video/xylon/xylonfb/platform/../core/xylonfb.c:751:3: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/video/xylon/xylonfb/platform/../core/xylonfb.c:751:3: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/pmods/pmodoled-gpio.c:153:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/pmods/pmodoled-gpio.c:207:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/pmods/pmodoled-gpio.c:657:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/dma/xilinx/vdmatest.c:277:4: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/dma/xilinx/vdmatest.c:288:4: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/dma/xilinx/xilinx_axicdma.c:527:4: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/dma/xilinx/xilinx_axidma.c:377:3: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/dma/xilinx/xilinx_axidma.c:403:3: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/dma/xilinx/xilinx_axidma.c:609:4: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/dma/xilinx/xilinx_axidma.c:1027:37: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/dma/xilinx/xilinx_axidma.c:1027:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/dma/xilinx/xilinx_axivdma.c:398:3: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/dma/xilinx/xilinx_axivdma.c:424:3: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/dma/xilinx/xilinx_axivdma.c:647:5: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/dma/xilinx/xilinx_axivdma.c:1110:9: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/dma/xilinx/xilinx_axivdma.c:1109:22: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/dma/xilinx/xilinx_axivdma.c:1123:9: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/dma/xilinx/xilinx_axivdma.c:1122:22: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/dma/xilinx/xilinx_axivdma.c:1137:38: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/dma/xilinx/xilinx_axivdma.c:1137:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
warning: (PPC_E500MC && PPC_BOOK3S_32 && PPC_BOOK3S_64 && PPC_BOOK3E_64 && ISS4xx && 440EP && 440EPX && 460EX && 460SX && 476FPE && APM821xx) selects PPC_FPU which has unmet direct dependencies (XILINX_VIRTEX_5_FXT)
warning: (PPC_E500MC && PPC_BOOK3S_32 && PPC_BOOK3S_64 && PPC_BOOK3E_64 && ISS4xx && 440EP && 440EPX && 460EX && 460SX && 476FPE && APM821xx) selects PPC_FPU which has unmet direct dependencies (XILINX_VIRTEX_5_FXT)
warning: (PPC_E500MC && PPC_BOOK3S_32 && PPC_BOOK3S_64 && PPC_BOOK3E_64 && ISS4xx && 440EP && 440EPX && 460EX && 460SX && 476FPE && APM821xx) selects PPC_FPU which has unmet direct dependencies (XILINX_VIRTEX_5_FXT)
warning: (PPC_E500MC && PPC_BOOK3S_32 && PPC_BOOK3S_64 && PPC_BOOK3E_64 && ISS4xx && 440EP && 440EPX && 460EX && 460SX && 476FPE && APM821xx) selects PPC_FPU which has unmet direct dependencies (XILINX_VIRTEX_5_FXT)
drivers/regulator/twl-regulator.c:662:29: warning: 'twl6030_fixed_resource' defined but not used [-Wunused-variable]
drivers/net/virtio_net.c:1481:8: warning: 'max_queue_pairs' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/block/virtio_blk.c:613:2: warning: 'writeback' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/block/virtio_blk.c:994:1: warning: 'blk_size' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/block/virtio_blk.c:790:29: warning: 'v' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/block/virtio_blk.c:702:11: warning: 'sg_elems' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sched/sch_qfq.c:852:11: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/regulator/core.c:2170:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
mm/page_cgroup.c:14:22: warning: 'total_usage' defined but not used [-Wunused-variable]
WARNING: vmlinux.o(.text+0x1891e2): Section mismatch in reference from the function page_cgroup_init() to the variable .meminit.data:page_cgroup_callback_mem_nb.28706
drivers/net/ethernet/brocade/bna/bnad.c:3070:5: warning: 'using_dac' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/video/hdpvr/hdpvr-video.c:1223:29: warning: "CONFIG_I2C_MODULE" is not defined [-Wundef]
drivers/media/video/hdpvr/hdpvr-core.c:407:1: warning: label 'reg_fail' defined but not used [-Wunused-label]
drivers/media/video/hdpvr/hdpvr-core.c:286:21: warning: unused variable 'client' [-Wunused-variable]
drivers/mfd/rc5t583-irq.c:258:10: warning: 'master_int' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/mfd/rc5t583.c:105:15: warning: 'sleepseq_val' may be used uninitialized in this function [-Wmaybe-uninitialized]

[smatch]
drivers/firmware/efi/vars.c:554 efivar_entry_delete() warn: inconsistent returns spin_lock:&__efivars->lock: locked (554) unlocked (550)
drivers/firmware/efi/vars.c:554 efivar_entry_delete() warn: inconsistent returns irq:: locked (554) unlocked (550)
drivers/firmware/efi/vars.c:648 efivar_entry_set_safe() warn: inconsistent returns irqsave:flags: locked (634) unlocked (631,641,648)
drivers/firmware/efi/vars.c:648 efivar_entry_set_safe() warn: inconsistent returns spin_lock:&__efivars->lock: locked (634) unlocked (631,641,648)
drivers/spi/spi-xilinx.c:318 xilinx_spi_txrx_bufs() warn: add some parenthesis here?
drivers/dma/xilinx/xilinx_axidma.c:829 xilinx_dma_prep_slave_sg() error: potential NULL dereference 'prev'.
drivers/dma/xilinx/xilinx_axidma.c:845 xilinx_dma_prep_slave_sg() error: potential NULL dereference 'first'.
drivers/dma/xilinx/xilinx_axidma.c:845 xilinx_dma_prep_slave_sg() error: potential NULL dereference 'hw'.
drivers/dma/xilinx/xilinx_axidma.c:851 xilinx_dma_prep_slave_sg() warn: variable dereferenced before check 'first' (see line 845)
drivers/dma/xilinx/xilinx_axivdma.c:862 xilinx_vdma_prep_slave_sg() error: potential NULL dereference 'prev'.
drivers/dma/xilinx/xilinx_axivdma.c:876 xilinx_vdma_prep_slave_sg() error: potential NULL dereference 'first'.
drivers/dma/xilinx/xilinx_axivdma.c:876 xilinx_vdma_prep_slave_sg() error: potential NULL dereference 'hw'.
drivers/dma/xilinx/xilinx_axivdma.c:878 xilinx_vdma_prep_slave_sg() warn: variable dereferenced before check 'first' (see line 876)
drivers/dma/xilinx/vdmatest.c:490 vdmatest_add_slave_threads() error: potential null dereference 'thread'.  (kzalloc returns null)
drivers/dma/xilinx/vdmatest.c:490 vdmatest_add_slave_threads() error: we previously assumed 'thread' could be null (see line 484)
drivers/dma/xilinx/vdmatest.c:504 vdmatest_add_slave_threads() error: dereferencing freed memory 'thread'
drivers/dma/xilinx/vdmatest.c:528 vdmatest_add_slave_channels() warn: possible memory leak of 'tx_dtc'
drivers/dma/xilinx/xilinx_axicdma.c:747 xilinx_cdma_prep_memcpy() error: potential NULL dereference 'prev'.
drivers/dma/xilinx/xilinx_axidma.c:829 xilinx_dma_prep_slave_sg() error: potential NULL dereference 'prev'.
drivers/dma/xilinx/xilinx_axidma.c:845 xilinx_dma_prep_slave_sg() error: potential NULL dereference 'first'.
drivers/dma/xilinx/xilinx_axidma.c:845 xilinx_dma_prep_slave_sg() error: potential NULL dereference 'hw'.
drivers/dma/xilinx/xilinx_axidma.c:851 xilinx_dma_prep_slave_sg() warn: variable dereferenced before check 'first' (see line 845)
drivers/dma/xilinx/xilinx_axivdma.c:862 xilinx_vdma_prep_slave_sg() error: potential NULL dereference 'prev'.
drivers/dma/xilinx/xilinx_axivdma.c:876 xilinx_vdma_prep_slave_sg() error: potential NULL dereference 'first'.
drivers/dma/xilinx/xilinx_axivdma.c:876 xilinx_vdma_prep_slave_sg() error: potential NULL dereference 'hw'.
drivers/dma/xilinx/xilinx_axivdma.c:878 xilinx_vdma_prep_slave_sg() warn: variable dereferenced before check 'first' (see line 876)
drivers/dma/xilinx/xilinx_axicdma.c:747 xilinx_cdma_prep_memcpy() error: potential NULL dereference 'prev'.
drivers/dma/xilinx/axidmatest.c:515 dmatest_add_slave_threads() error: potential null dereference 'thread'.  (kzalloc returns null)
drivers/dma/xilinx/axidmatest.c:515 dmatest_add_slave_threads() error: we previously assumed 'thread' could be null (see line 509)
drivers/dma/xilinx/axidmatest.c:529 dmatest_add_slave_threads() error: dereferencing freed memory 'thread'
drivers/dma/xilinx/axidmatest.c:553 dmatest_add_slave_channels() warn: possible memory leak of 'tx_dtc'
drivers/video/xylon/xylonfb/platform/../core/xylonfb.c:595 xylonfb_pan_display() warn: unsigned 'var->xoffset' is never less than zero.
drivers/video/xylon/xylonfb/platform/../core/xylonfb.c:597 xylonfb_pan_display() warn: unsigned 'var->yoffset' is never less than zero.
drivers/video/xylon/xylonfb/platform/../core/xylonfb.c:1289 xylonfb_init_driver() warn: consider using resource_size() here

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
