From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 17 Sep 2013 16:00:23 +0000
Subject: build regressions 2013-09-17
Message-Id: <52387c97.XyZ5ywQntvdZ2CI2%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/tty/serial/sh-sci.c:2545:2: error: format not a string literal and no format arguments [-Werror=format-security]
arch/blackfin/kernel/traps.c:436:4: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/gpio/gpio-pcf857x.c:206:2: error: implicit declaration of function 'set_irq_flags' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-pcf857x.c:206:22: error: 'IRQF_VALID' undeclared (first use in this function)
drivers/scsi/aha1542.c:908:3: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/scsi/aha1542.c:938:4: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/gpu/drm/ttm/ttm_memory.c:303:3: error: format not a string literal and no format arguments [-Werror=format-security]
sound/isa/es1688/es1688_lib.c:747:2: error: format not a string literal and no format arguments [-Werror=format-security]
(.data+0x60484): undefined reference to `vb2_ops_wait_prepare'
(.data+0x60488): undefined reference to `vb2_ops_wait_finish'
arch/ia64/kernel/mca.c:220:3: error: format not a string literal and no format arguments [-Werror=format-security]
arch/ia64/kernel/mca.c:271:4: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/char/ds1302.c:324:3: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/net/ethernet/cirrus/mac89x0.c:262:3: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/char/dsp56k.c:515:2: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/input/keyboard/amikbd.c:181:3: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/net/ethernet/amd/atarilance.c:630:3: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/net/ethernet/amd/sun3lance.c:407:3: error: format not a string literal and no format arguments [-Werror=format-security]
kernel/debug/kdb/kdb_main.c:1251:3: error: format not a string literal and no format arguments [-Werror=format-security]
arch/mips/kernel/traps.c:1836:3: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/net/ethernet/8390/lib8390.c:969:3: error: format not a string literal and no format arguments [-Werror=format-security]
arch/parisc/kernel/traps.c:489:2: error: format not a string literal and no format arguments [-Werror=format-security]
arch/parisc/kernel/drivers.c:409:2: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/char/bsr.c:261:7: error: format not a string literal and no format arguments [-Werror=format-security]
arch/powerpc/xmon/nonstdio.c:125:3: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/spi/spi.c:949:3: error: format not a string literal and no format arguments [-Werror=format-security]
arch/s390/kernel/dis.c:1849:3: error: format not a string literal and no format arguments [-Werror=format-security]
arch/s390/kernel/dis.c:1876:3: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/s390/block/dcssblk.c:596:2: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/s390/char/vmlogrdr.c:764:3: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/s390/crypto/zcrypt_api.c:357:3: error: format not a string literal and no format arguments [-Werror=format-security]
arch/sh/kernel/dumpstack.c:118:2: error: format not a string literal and no format arguments [-Werror=format-security]
arch/sparc/kernel/unaligned_32.c:165:2: error: format not a string literal and no format arguments [-Werror=format-security]
include/linux/kthread.h:33:9: error: format not a string literal and no format arguments [-Werror=format-security]
include/linux/kthread.h:33:9: error: format not a string literal and no format arguments [-Werror=format-security]
include/linux/kthread.h:33:9: error: format not a string literal and no format arguments [-Werror=format-security]
include/linux/kthread.h:33:9: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/net/xen-netback/interface.c:408:2: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/md/bcache/super.c:1647:2: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/staging/dgap/dgap_driver.c:477:17: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/staging/dgap/dgap_driver.c:631:2: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/staging/dgap/dgap_driver.c:969:3: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/staging/xillybus/xillybus_core.c:2057:12: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/staging/dgnc/dgnc_driver.c:457:3: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/staging/dgnc/dgnc_driver.c:713:2: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/media/rc/rc-main.c:61:3: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/usb/gadget/tcm_usb_gadget.c:1616:2: error: format not a string literal and no format arguments [-Werror=format-security]
include/linux/kthread.h:33:9: error: format not a string literal and no format arguments [-Werror=format-security]
include/linux/kthread.h:33:9: error: format not a string literal and no format arguments [-Werror=format-security]
include/linux/kthread.h:33:9: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/scsi/esas2r/esas2r_log.c:174:3: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/media/dvb-frontends/dib9000.c:652:3: error: format not a string literal and no format arguments [-Werror=format-security]
drivers/gpu/drm/drm_fb_helper.c:1629:3: error: format not a string literal and no format arguments [-Werror=format-security]
include/linux/compiler.h:137:17: error: format not a string literal and no format arguments [-Werror=format-security]

[warnings]
arch/arm/kernel/devtree.c:179:38: warning: initialization discards 'const' qualifier from pointer target type [enabled by default]
arch/arm/kernel/devtree.c:212:2: warning: passing argument 1 of 'of_flat_dt_match_machine' discards 'const' qualifier from pointer target type [enabled by default]
drivers/phy/phy-omap-pipe3.c:61:30: warning: 'dpll_map_usb' defined but not used [-Wunused-variable]
drivers/phy/phy-omap-pipe3.c:71:30: warning: 'dpll_map_sata' defined but not used [-Wunused-variable]
warning: (OMAP_PIPE3) selects OMAP_OCP2SCP which has unmet direct dependencies (ARCH_OMAP2PLUS)
warning: (OMAP_PIPE3) selects OMAP_OCP2SCP which has unmet direct dependencies (ARCH_OMAP2PLUS)
warning: (OMAP_PIPE3) selects OMAP_OCP2SCP which has unmet direct dependencies (ARCH_OMAP2PLUS)
drivers/gpu/drm/virtio/virtgpu_vq.c:113:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/gpu/drm/virtio/virtgpu_vq.c:119:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/namespace.c:2805:2: warning: passing argument 1 of 'drop_collected_mounts' from incompatible pointer type [enabled by default]
drivers/irqchip/percpu-mux.c:71:24: warning: 'percpu_mux' defined but not used [-Wunused-variable]

[sparse]
drivers/gpu/drm/virtio/virtgpu_vq.c:13:24: sparse: symbol 'virtgpu_allocate_vbuf' was not declared. Should it be static?
drivers/gpu/drm/virtio/virtgpu_vq.c:74:5: sparse: symbol 'virtgpu_queue_ctrl_buffer' was not declared. Should it be static?
drivers/gpu/drm/virtio/virtgpu_vq.c:105:5: sparse: symbol 'virtgpu_cmd_create_resource' was not declared. Should it be static?
drivers/gpu/drm/virtio/virtgpu_vq.c:115:5: sparse: symbol 'virtgpu_cmd_attach_status_page' was not declared. Should it be static?
drivers/gpu/drm/nouveau/dispnv04/overlay.c:315:1: sparse: symbol 'nouveau_overlay_init' was not declared. Should it be static?
fs/nfs/direct.c:128:9: sparse: undefined identifier 'nter'

[coccinelle]
drivers/media/usb/pvrusb2/pvrusb2-std.c:300:1-7: Replace memcpy with struct assignment
drivers/hwmon/nct6775.c:3866:1-3: WARNING: PTR_RET can be used
drivers/hwmon/ds1621.c:381:1-3: WARNING: PTR_RET can be used
drivers/hwmon/max6642.c:299:1-3: WARNING: PTR_RET can be used
drivers/hwmon/max6697.c:649:1-3: WARNING: PTR_RET can be used

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
