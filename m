From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 29 Oct 2012 00:00:42 +0000
Subject: build regressions 2012-10-28
Message-Id: <20121029000042.GA8944@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
sound/built-in.o:(.rodata+0x9dfa4): undefined reference to `wm_adsp1_event'
sound/built-in.o:(.rodata+0xd3e48): undefined reference to `wm_adsp2_event'
make[4]: *** No rule to make target `sound/soc/codecs/snd-soc-wm-adsp.o', needed by `sound/soc/codecs/built-in.o'.
drivers/tty/serial/8250/8250.c:42:27: fatal error: mach/platform.h: No such file or directory
mm/huge_memory.c:774:2: error: incompatible type for argument 3 of 'update_mmu_cache_pmd'
drivers/uio/uio_dmem_genirq.c:95:18: error: 'DMA_ERROR_CODE' undeclared (first use in this function)
mm/huge_memory.c:1543:2: error: implicit declaration of function 'pmd_mknotpresent' [-Werror=implicit-function-declaration]
mm/huge_memory.c:1543:2: error: incompatible type for argument 4 of 'set_pmd_at'
kernel/rcutree_plugin.h:2282:41: error: 'GFP_NOIO' undeclared (first use in this function)
make[4]: *** No rule to make target `sound/soc/codecs/snd-soc-wm-adsp.c', needed by `sound/soc/codecs/snd-soc-wm-adsp.o'.
ERROR: "arp_create" [net/batman-adv/batman-adv.ko] undefined!

[warnings]
arch/alpha/kernel/process.c:278:16: warning: unused variable 'settls' [-Wunused-variable]
kernel/rcutree_plugin.h:100:1: warning: the frame size of 20480 bytes is larger than 2048 bytes [-Wframe-larger-than=]
net/netfilter/nf_tables_api.c:1299:1: warning: the frame size of 1184 bytes is larger than 1024 bytes [-Wframe-larger-than=]
net/netfilter/nft_ct.c:77:46: warning: the omitted middle operand in ?: will always be 'true', suggest explicit middle operand [-Wparentheses]
WARNING: vmlinux.o(.text+0x10e75dc): Section mismatch in reference from the function .dlpar_add_slot() to the function .devinit.text:.init_phb_dynamic()
WARNING: vmlinux.o(.text+0x10e7ae4): Section mismatch in reference from the function .dlpar_remove_slot() to the function .devinit.text:.vio_unregister_device()
drivers/media/i2c/m5mols/m5mols_core.c:589:18: warning: 'type' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/video/m5mols/m5mols_core.c:515:18: warning: 'type' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/i915/i915_sysfs.c:371:17: warning: 'val' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/pci/saa7164/saa7164-encoder.c:377:5: warning: 'tsport' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/pci/saa7164/saa7164-vbi.c:349:5: warning: 'tsport' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/staging/ramster/zcache-main.c:1394:13: warning: 'cli' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/sched/fair.c:2889:3: warning: 'policy' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/mtd/map.h:393:11: warning: 'r' may be used uninitialized in this function [-Wuninitialized]

[sparse]
sound/soc/codecs/wm2200.c:2555:10: sparse: unknown field name in initializer
sound/soc/codecs/arizona.h:20:10: sparse: unable to open 'wm_adsp.h'
sound/soc/codecs/wm5102.c:464:1: sparse: cast truncates bits from constant value (1100 becomes 0)
drivers/hwmon/da9055-hwmon.c:43:1: sparse: Expected ; at the end of type declaration
drivers/hwmon/da9055-hwmon.c:43:1: sparse: got }
drivers/hwmon/da9055-hwmon.c:68:38: sparse: using member 'da9055' in incomplete struct da9055_hwmon
drivers/hwmon/da9055-hwmon.c:73:9: sparse: using member 'irq_lock' in incomplete struct da9055_hwmon
drivers/hwmon/da9055-hwmon.c:83:48: sparse: using member 'done' in incomplete struct da9055_hwmon
drivers/hwmon/da9055-hwmon.c:151:9: sparse: using member 'hwmon_lock' in incomplete struct da9055_hwmon
drivers/hwmon/da9055-hwmon.c:299:14: sparse: using member 'class_device' in incomplete struct da9055_hwmon
drivers/uio/uio_dmem_genirq.c:65:39: sparse: incorrect type in assignment (different address spaces)
drivers/uio/uio_dmem_genirq.c:93:17: sparse: incorrect type in argument 3 (different address spaces)
drivers/gpu/drm/i915/intel_display.c:3498:48: sparse: mixing different enum types
drivers/hwmon/da9055-hwmon.c:118:16: sparse: undefined identifier 'IRQ_HANDLED'
fs/notify/fdinfo.c:79:5: sparse: symbol 'inotify_show_fdinfo' was not declared. Should it be static?
fs/notify/fdinfo.c:115:5: sparse: symbol 'fanotify_show_fdinfo' was not declared. Should it be static?

[smatch]
drivers/uio/uio_dmem_genirq.c:286 uio_dmem_genirq_probe() warn: possible memory leak of 'uioinfo'

[coccinelle]
kernel/rcutree_trace.c:516:3-17: code aligned with following code on line 518

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
