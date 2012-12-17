From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 17 Dec 2012 17:15:19 +0000
Subject: build regressions 2012-12-17
Message-Id: <50cf5327.bJ1BqieHzxUiaK1H%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
make[2]: *** No rule to make target `firmware/sdma-imx51.bin', needed by `firmware/sdma-imx51.bin.gen.o'.
drivers/regulator/tps65090-regulator.c:169:29: error: 'struct tps65090_platform_data' has no member named 'reg_pdata'
drivers/usb/chipidea/core.c:523:2: error: implicit declaration of function 'of_get_property' [-Werror=implicit-function-declaration]
drivers/usb/chipidea/core.c:544:2: error: implicit declaration of function 'of_get_usbphy_mode' [-Werror=implicit-function-declaration]
mm/compaction.c:306:18: error: 'COMPACTFREE_SCANNED' undeclared (first use in this function)
mm/compaction.c:308:19: error: 'COMPACTISOLATED' undeclared (first use in this function)
mm/compaction.c:616:18: error: 'COMPACTMIGRATE_SCANNED' undeclared (first use in this function)
net/netfilter/nfnetlink_log.c:494:25: error: 'ARPHRD_SIT' undeclared (first use in this function)
drivers/usb/chipidea/ci13xxx_imx.c:238:41: error: 'pdata' undeclared (first use in this function)
drivers/usb/chipidea/otg.c:54:4: error: 'struct ci13xxx' has no member named 'otg'
kernel/sched/fair.c:877:55: error: call to '__build_bug_failed' declared with attribute error: BUILD_BUG failed

[warnings]
warning: (ARCH_MVEBU && ARCH_BCM && ARCH_HIGHBANK && ARCH_MXC && ARCH_PICOXCELL && ARCH_SOCFPGA && ARCH_SUNXI && ARCH_ZYNQ && ARCH_MULTIPLATFORM && ARCH_INTEGRATOR && ARCH_BCM2835 && ARCH_CLPS711X && ARCH_MXS && ARCH_MMP && ARCH_TEGRA && ARCH_PXA && ARCH_SHMOBILE && ARCH_SA1100 && ARCH_U300 && ARCH_U8500 && ARCH_NOMADIK && ARCH_VT8500_SINGLE && SOC_AT91SAM9 && SOC_AT91RM9200 && ARCH_AT91X40 && ARCH_OMAP2PLUS) selects SPARSE_IRQ which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS && (IRQ_DOMAIN && DEBUG_FS || MAY_HAVE_SPARSE_IRQ))
drivers/pwm/pwm-imx.c:281:7: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
mm/memory.c:3545: warning: no return statement in function returning non-void
drivers/usb/chipidea/core.c:523:10: warning: assignment makes pointer from integer without a cast [enabled by default]
warning: (USB_CHIPIDEA) selects USB_ULPI_VIEWPORT which has unmet direct dependencies (USB_SUPPORT && (USB || USB_GADGET) && USB_ULPI)
drivers/scsi/ipr.c:8700:16: warning: array subscript is above array bounds [-Warray-bounds]
warning: (PPC) selects SPARSE_IRQ which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS && (IRQ_DOMAIN && DEBUG_FS || MAY_HAVE_SPARSE_IRQ))
drivers/usb/chipidea/ci.h:183:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/usb/chipidea/core.c:323:4: warning: large integer implicitly truncated to unsigned type [-Woverflow]
kernel/sched/fair.c:4342:23: warning: unused variable 'child' [-Wunused-variable]
drivers/extcon/extcon-max77693.c:485:30: warning: 'path' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/acpi/acpi_memhotplug.c:160:14: warning: unused variable 'status' [-Wunused-variable]
warning: (X86) selects SPARSE_IRQ which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS && (IRQ_DOMAIN && DEBUG_FS || MAY_HAVE_SPARSE_IRQ))
fs/nfsd/nfs4state.c:1052:19: warning: unused variable 'nn' [-Wunused-variable]
drivers/usb/chipidea/core.c:417:5: warning: 'ret' may be used uninitialized in this function [-Wuninitialized]

[sparse]
drivers/usb/chipidea/core.c:219:6: sparse: symbol 'hw_portsc_configure' was not declared. Should it be static?
mm/memory.c:3452:5: sparse: symbol 'numa_migrate_prep' was not declared. Should it be static?
mm/hugetlb_cgroup.c:381:38: sparse: non-ANSI function declaration of function 'hugetlb_cgroup_file_init'
drivers/gpu/drm/i915/intel_fb.c:163:17: sparse: incorrect type in argument 1 (different address spaces)
drivers/scsi/ipr.c:4883:17: sparse: context imbalance in '__ipr_eh_dev_reset' - different lock contexts for basic block
drivers/scsi/ipr.c:6484:21: sparse: context imbalance in 'ipr_qc_issue' - different lock contexts for basic block
drivers/scsi/fnic/fnic_scsi.c:183:35: sparse: invalid assignment: &drivers/usb/chipidea/core.c:544:25: sparse: undefined identifier 'of_get_usbphy_mode'
drivers/usb/chipidea/core.c:571:19: sparse: undefined identifier 'of_get_property'
drivers/usb/chipidea/otg.c:51:5: sparse: symbol 'ci_hdrc_otg_init' was not declared. Should it be static?
drivers/acpi/pci_root.c:667:12: sparse: symbol 'acpi_pci_root_init' was not declared. Should it be static?
drivers/regulator/tps65090-regulator.c:169:43: sparse: no member 'reg_pdata' in struct tps65090_platform_data
drivers/scsi/fnic/fnic_scsi.c:173:1: sparse: symbol '__fnic_set_state_flags' redeclared with different type (originally declared at drivers/scsi/fnic/fnic.h:311) - incompatible argument 2 (different base types)

[smatch]
drivers/staging/bcm/CmHost.c:1298 DumpCmControlPacket() debug: remove_pools: nr_children over 4000 (8256). (psfCSType->cCPacketClassificationRule.u8ProtocolSourcePortRange s32min-s32max)
drivers/gpu/drm/nouveau/core/subdev/therm/fan.c:61 nouveau_fan_update() warn: always true condition '(duty >= 0) => (0-u32max >= 0)'
drivers/staging/bcm/CmHost.c:1234 DumpCmControlPacket() debug: remove_pools: nr_children over 4000 (8255). (psfCSType->cCPacketClassificationRule.u8IPTypeOfService s32min-s32max)
drivers/media/pci/bt8xx/dst.c:97 dst_gpio_outb() info: why not propagate 'err' from bt878_device_control() instead of (-121)?
drivers/media/pci/bt8xx/dst.c:123 dst_gpio_inb() info: why not propagate 'err' from bt878_device_control() instead of (-121)?
drivers/media/pci/bt8xx/dst.c:282 write_dst() info: why not propagate 'err' from i2c_transfer() instead of (-1)?
drivers/media/pci/bt8xx/dst.c:313 read_dst() info: why not propagate 'err' from i2c_transfer() instead of (-1)?
drivers/input/misc/da9055_onkey.c:87 da9055_onkey_probe() info: why not propagate 'irq' from platform_get_irq_byname() instead of (-22)?
drivers/hwmon/it87.c:777 set_fan() error: buffer overflow 'data->fan_div' 3 <= 3
drivers/char/virtio_console.c:846 port_fops_splice_write() internal bug:  pop_val popping empty list
drivers/edac/i82975x_edac.c:370 i82975x_process_error_info() warn: always true condition '(row >= 0) => (0-u32max >= 0)'
drivers/staging/bcm/CmHost.c:1277 DumpCmControlPacket() debug: remove_pools: nr_children over 4000 (8255). (psfCSType->cCPacketClassificationRule.u8EthernetDestMacAddress s32min-s32max)
drivers/extcon/extcon-max77693.c:490 max77693_muic_dock_handler() info: why not propagate 'ret' from max77693_muic_set_path() instead of (-22)?
drivers/extcon/extcon-max77693.c:846 max77693_muic_chg_handler() info: why not propagate 'ret' from max77693_muic_set_path() instead of (-22)?
drivers/scsi/ipr.c:6568 ipr_qc_issue() warn: inconsistent returns spin_lock:&ipr_cmd->hrrq->_lock: locked (6562) unlocked (6499,6507,6568)
drivers/scsi/qla2xxx/qla_os.c:364 qla2x00_free_req_que() info: redundant null check on req->outstanding_cmds calling kfree()
drivers/scsi/fnic/fnic_scsi.c:1260 fnic_rport_exch_reset() error: we previously assumed 'sc->device' could be null (see line 1237)
drivers/scsi/fnic/fnic_scsi.c:1325 fnic_terminate_rport_io() error: we previously assumed 'sc->device' could be null (see line 1314)
drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c:4137 brcmf_set_management_ie() warn: unsigned 'remained_buf_len' is never less than zero.
fs/btrfs/extent_io.c:4107 alloc_dummy_extent_buffer() warn: always true condition '(i >= 0) => (0-u32max >= 0)'
drivers/staging/bcm/CmHost.c:1258 DumpCmControlPacket() debug: remove_pools: nr_children over 4000 (8255). (psfCSType->cCPacketClassificationRule.u8IPDestinationAddress s32min-s32max)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
