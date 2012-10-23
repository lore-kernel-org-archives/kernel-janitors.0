From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 23 Oct 2012 17:03:22 +0000
Subject: build regressions 2012-10-23
Message-Id: <20121023170322.GA31879@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

This is the first daily summary from the 0day build test system.
Ideas on better format/contents are warmly welcome!

[errors]
drivers/usb/host/ohci-sm501.c:241:2: error: implicit declaration of function 'ohci_finish_controller_resume' [-Werror=implicit-function-declaration]
arch/x86/xen/smp.c:329:7: error: 'struct vcpu_guest_context' has no member named 'u'
drivers/staging/dgrp/dgrp_net_ops.c:216:27: error: 'struct tty_struct' has no member named 'real_raw'
drivers/staging/dgrp/dgrp_net_ops.c:229:8: error: 'struct tty_struct' has no member named 'read_cnt'
include/linux/tick.h:148:48: error: 'return' with a value, in function returning void [-Werror]
(.ref.text+0x7a1): undefined reference to `zone_pcp_reset'
arch/powerpc/platforms/wsp/chroma.c:55:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/wsp/psr2.c:66:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
kernel/printk/printk_syslog.c:245:18: error: 'VERIFY_WRITE' undeclared (first use in this function)
arch/powerpc/platforms/85xx/p5020_ds.c:94:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/embedded6xx/linkstation.c:35:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/embedded6xx/ls_uart.c:142:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/cell/beat_iommu.c:115:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/cell/celleb_setup.c:118:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/cell/iommu.c:1233:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/cell/pmu.c:405:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/cell/qpace_setup.c:94:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/cell/setup.c:185:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/maple/setup.c:392:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/pasemi/idle.c:88:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/pasemi/setup.c:184:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/powermac/low_i2c.c:1482:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/powermac/pfunc_base.c:366:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/powermac/setup.c:360:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/pseries/dlpar.c:563:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/pseries/hotplug-memory.c:242:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/pseries/io_event_irq.c:164:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/pseries/iommu.c:820:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/pseries/nvram.c:472:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/pseries/setup.c:415:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
drivers/staging/ced1401/usb1401.c:1386:11: error: 'THIS_MODULE' undeclared here (not in a function)
drivers/staging/ced1401/usb1401.c:1394:2: error: unknown field 'ioctl' specified in initializer
drivers/staging/ced1401/usb1401.c:1637:16: error: expected declaration specifiers or '...' before string constant
drivers/staging/silicom/bp_mod.c:5915:2: error: unknown field 'ioctl' specified in initializer
kernel/printk/kmsg_dump.c:23:5: error: redefinition of 'kmsg_dump_register'
kernel/printk/kmsg_dump.c:52:5: error: redefinition of 'kmsg_dump_unregister'
kernel/printk/kmsg_dump.c:81:6: error: redefinition of 'kmsg_dump'
kernel/printk/kmsg_dump.c:132:6: error: conflicting types for 'kmsg_dump_get_line_nolock'
kernel/printk/kmsg_dump.c:181:6: error: conflicting types for 'kmsg_dump_get_line'
kernel/printk/kmsg_dump.c:214:6: error: redefinition of 'kmsg_dump_get_buffer'
kernel/printk/kmsg_dump.c:304:6: error: redefinition of 'kmsg_dump_rewind_nolock'
kernel/printk/kmsg_dump.c:320:6: error: redefinition of 'kmsg_dump_rewind'
kernel/irq_work.c:64: error: implicit declaration of function 'arch_irq_work_raise'
kernel/irq_work.c:72: error: implicit declaration of function 'arch_irq_work_has_ipi'
kernel/time/tick-sched.c:292: error: implicit declaration of function 'irq_work_needs_cpu'
include/linux/llist.h:160:3: error: implicit declaration of function 'cmpxchg_local'

[warnings]
drivers/usb/core/hub.c:1216:3: warning: 'flush_work_sync' is deprecated (declared at include/linux/workqueue.h:448) [-Wdeprecated-declarations]
arch/x86/xen/setup.c:261:6: warning: unused variable 'xlated_phys' [-Wunused-variable]
drivers/staging/et131x/et131x.c:3608:5: warning: left shift count >= width of type [enabled by default]
drivers/staging/et131x/et131x.c:2383:11: warning: passing argument 2 of 'et131x_align_allocated_memory' from incompatible pointer type [enabled by default]
drivers/bluetooth/btwilink.c:178:3: warning: overflow in implicit constant conversion [-Woverflow]
include/linux/tick.h:148:48: warning: 'return' with a value, in function returning void [enabled by default]
drivers/base/power/sysfs.c:286:6: warning: unused variable 'value' [-Wunused-variable]
drivers/cpuidle/cpuidle.h:26:41: warning: 'struct device' declared inside parameter list [enabled by default]
drivers/cpuidle/cpuidle.h:26:41: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
drivers/devfreq/devfreq.c:505:1: warning: label 'out' defined but not used [-Wunused-label]
drivers/cpuidle/governors/menu.c:268:2: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/char/random.c:1141:3: warning: format '%zd' expects argument of type 'signed size_t', but argument 5 has type 'long int' [-Wformat]
drivers/char/random.c:1145:3: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'long unsigned int' [-Wformat]
kernel/printk/printk.c:1465:0: warning: "PRINTK_LOG_LINE_MAX" redefined [enabled by default]
kernel/printk/printk.c:1466:0: warning: "PRINTK_PREFIX_MAX" redefined [enabled by default]
arch/powerpc/platforms/cell/beat_iommu.c:115:1: warning: data definition has no type or storage class [enabled by default]
arch/powerpc/platforms/cell/beat_iommu.c:115:1: warning: type defaults to 'int' in declaration of '__define_initcall' [-Wimplicit-int]
arch/powerpc/platforms/cell/celleb_setup.c:118:1: warning: data definition has no type or storage class [enabled by default]
arch/powerpc/platforms/cell/celleb_setup.c:118:1: warning: type defaults to 'int' in declaration of '__define_initcall' [-Wimplicit-int]
arch/powerpc/platforms/cell/iommu.c:1233:1: warning: data definition has no type or storage class [enabled by default]
arch/powerpc/platforms/cell/iommu.c:1233:1: warning: type defaults to 'int' in declaration of '__define_initcall' [-Wimplicit-int]
arch/powerpc/platforms/cell/pmu.c:405:1: warning: data definition has no type or storage class [enabled by default]
arch/powerpc/platforms/cell/pmu.c:405:1: warning: type defaults to 'int' in declaration of '__define_initcall' [-Wimplicit-int]
arch/powerpc/platforms/cell/qpace_setup.c:94:1: warning: data definition has no type or storage class [enabled by default]
arch/powerpc/platforms/cell/qpace_setup.c:94:1: warning: type defaults to 'int' in declaration of '__define_initcall' [-Wimplicit-int]
arch/powerpc/platforms/cell/setup.c:185:1: warning: data definition has no type or storage class [enabled by default]
arch/powerpc/platforms/cell/setup.c:185:1: warning: type defaults to 'int' in declaration of '__define_initcall' [-Wimplicit-int]
arch/powerpc/platforms/maple/setup.c:392:1: warning: data definition has no type or storage class [enabled by default]
arch/powerpc/platforms/maple/setup.c:392:1: warning: type defaults to 'int' in declaration of '__define_initcall' [-Wimplicit-int]
arch/powerpc/platforms/pasemi/idle.c:88:1: warning: data definition has no type or storage class [enabled by default]
arch/powerpc/platforms/pasemi/idle.c:88:1: warning: type defaults to 'int' in declaration of '__define_initcall' [-Wimplicit-int]
arch/powerpc/platforms/pasemi/setup.c:184:1: warning: data definition has no type or storage class [enabled by default]
arch/powerpc/platforms/pasemi/setup.c:184:1: warning: type defaults to 'int' in declaration of '__define_initcall' [-Wimplicit-int]
arch/powerpc/platforms/powermac/low_i2c.c:1482:1: warning: data definition has no type or storage class [enabled by default]
arch/powerpc/platforms/powermac/low_i2c.c:1482:1: warning: type defaults to 'int' in declaration of '__define_initcall' [-Wimplicit-int]
arch/powerpc/platforms/powermac/pfunc_base.c:366:1: warning: data definition has no type or storage class [enabled by default]
arch/powerpc/platforms/powermac/pfunc_base.c:366:1: warning: type defaults to 'int' in declaration of '__define_initcall' [-Wimplicit-int]
arch/powerpc/platforms/powermac/setup.c:360:1: warning: data definition has no type or storage class [enabled by default]
arch/powerpc/platforms/powermac/setup.c:360:1: warning: type defaults to 'int' in declaration of '__define_initcall' [-Wimplicit-int]
arch/powerpc/platforms/pseries/dlpar.c:563:1: warning: data definition has no type or storage class [enabled by default]
arch/powerpc/platforms/pseries/dlpar.c:563:1: warning: type defaults to 'int' in declaration of '__define_initcall' [-Wimplicit-int]
arch/powerpc/platforms/pseries/hotplug-memory.c:242:1: warning: data definition has no type or storage class [enabled by default]
arch/powerpc/platforms/pseries/hotplug-memory.c:242:1: warning: type defaults to 'int' in declaration of '__define_initcall' [-Wimplicit-int]
arch/powerpc/platforms/pseries/io_event_irq.c:164:1: warning: data definition has no type or storage class [enabled by default]
arch/powerpc/platforms/pseries/io_event_irq.c:164:1: warning: type defaults to 'int' in declaration of '__define_initcall' [-Wimplicit-int]
arch/powerpc/platforms/pseries/iommu.c:820:1: warning: data definition has no type or storage class [enabled by default]
arch/powerpc/platforms/pseries/iommu.c:820:1: warning: type defaults to 'int' in declaration of '__define_initcall' [-Wimplicit-int]
arch/powerpc/platforms/pseries/nvram.c:472:1: warning: data definition has no type or storage class [enabled by default]
arch/powerpc/platforms/pseries/nvram.c:472:1: warning: type defaults to 'int' in declaration of '__define_initcall' [-Wimplicit-int]
arch/powerpc/platforms/pseries/setup.c:415:1: warning: data definition has no type or storage class [enabled by default]
arch/powerpc/platforms/pseries/setup.c:415:1: warning: type defaults to 'int' in declaration of '__define_initcall' [-Wimplicit-int]
drivers/staging/ced1401/usb1401.c:113:1: warning: data definition has no type or storage class [enabled by default]
drivers/staging/ced1401/usb1401.c:113:1: warning: type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE' [-Wimplicit-int]
drivers/staging/ced1401/usb1401.c:113:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/staging/ced1401/usb1401.c:1394:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/staging/ced1401/usb1401.c:1394:2: warning: (near initialization for 'ced_fops.read') [enabled by default]
drivers/staging/ced1401/usb1401.c:1420:6: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/staging/ced1401/usb1401.c:1636:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/staging/silicom/bp_mod.c:5915:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/staging/silicom/bp_mod.c:5915:2: warning: (near initialization for 'Fops.llseek') [enabled by default]
arch/s390/include/asm/cputime.h:192:0: warning: "arch_needs_cpu" redefined [enabled by default]
include/linux/llist.h:160:9: warning: assignment makes pointer from integer without a cast

[sparse]
drivers/base/power/qos.c:330:5: sparse: symbol '__dev_pm_qos_update_request' was not declared. Should it be static?
drivers/cpufreq/cpufreq_governor.c:46:53: sparse: incorrect type in argument 2 (different modifiers)
drivers/cpufreq/cpufreq_governor.c:46:53: sparse: implicit cast from nocast type
drivers/devfreq/governor_simpleondemand.c:92:5: sparse: symbol 'devfreq_simple_ondemand_handler' was not declared. Should it be static?
drivers/devfreq/governor_userspace.c:119:5: sparse: symbol 'devfreq_userspace_handler' was not declared. Should it be static?
drivers/video/backlight/lms283gf05.c:162:47: sparse: dubious: x | !y
net/ipv6/route.c:400:13: sparse: invalid assignment: ^
[smatch]
drivers/staging/comedi/drivers/cb_pcidas64.c:1733 attach() warn: 'devpriv->dio_counter_iobase' was not released on error
drivers/staging/comedi/drivers/cb_pcidas64.c:1733 attach() warn: 'devpriv->main_iobase' was not released on error
drivers/staging/comedi/drivers/cb_pcidas64.c:1733 attach() warn: 'devpriv->plx9080_iobase' was not released on error
drivers/staging/comedi/drivers/gsc_hpdi.c:545 hpdi_attach() warn: 'devpriv->hpdi_iobase' was not released on error
drivers/staging/comedi/drivers/gsc_hpdi.c:545 hpdi_attach() warn: 'devpriv->plx9080_iobase' was not released on error
drivers/staging/comedi/drivers/addi-data/addi_common.c:1670 i_ADDI_Attach() warn: 'devpriv->dw_AiBase' was not released on error
drivers/staging/comedi/drivers/dt3000.c:835 dt3000_attach() warn: 'devpriv->io_addr' was not released on error
drivers/staging/comedi/drivers/das16.c:1234 das16_attach() error: potential null dereference 'devpriv->user_ai_range_table'.  (kmalloc returns null)
drivers/staging/comedi/drivers/das16.c:1247 das16_attach() error: potential null dereference 'devpriv->user_ao_range_table'.  (kmalloc returns null)
drivers/staging/comedi/drivers/me_daq.c:705 me_attach_pci() warn: 'dev_private->plx_regbase' was not released on error
drivers/staging/comedi/drivers/me_daq.c:739 me_attach_pci() warn: 'dev_private->me_regbase' was not released on error
drivers/staging/comedi/drivers/me_daq.c:800 me_detach() error: we previously assumed 'dev_private' could be null (see line 791)
drivers/staging/comedi/drivers/pcmmio.c:1180 pcmmio_detach() info: redundant null check on devpriv->sprivs calling kfree()
drivers/staging/comedi/drivers/ni_pcidio.c:449 nidio_interrupt() error: we previously assumed 'devpriv->di_mite_chan' could be null (see line 438)
drivers/staging/comedi/drivers/pcmuio.c:915 pcmuio_detach() warn: variable dereferenced before check 'devpriv' (see line 913)
drivers/staging/comedi/drivers/pcmuio.c:916 pcmuio_detach() info: redundant null check on devpriv->sprivs calling kfree()
drivers/staging/comedi/drivers/pcl818.c:1939 pcl818_detach() error: we previously assumed 'devpriv' could be null (see line 1915)
drivers/staging/comedi/drivers/ni_mio_common.c:4694 ni_E_init() error: potential null dereference 'devpriv->counter_dev'.  (ni_gpct_device_construct returns null)
drivers/staging/comedi/drivers/addi-data/hwdrv_apci3120.c:293 i_APCI3120_InsnReadAnalogInput() warn: assigning -4097 to unsigned variable 'devpriv->us_OutputRegister'
drivers/staging/comedi/drivers/s626.c:2728 s626_attach_pci() warn: 'devpriv->base_addr' was not released on error
drivers/base/power/qos.c:373 dev_pm_qos_add_notifier() error: we previously assumed 'dev->power.qos' could be null (see line 367)
drivers/base/power/qos.c:584 dev_pm_qos_expose_latency_limit() error: we previously assumed 'dev->power.qos' could be null (see line 573)
drivers/base/power/qos.c:630 dev_pm_qos_expose_flags() error: we previously assumed 'dev->power.qos' could be null (see line 619)
drivers/staging/comedi/drivers/cb_pcidas64.c:3470 prep_ao_dma() warn: if();
kernel/printk/printk.c:1936 console_trylock() warn: inconsistent returns sem:&console_sem: locked (1936) unlocked (1929,1932)
drivers/gpu/drm/drm_edid.c:175 drm_edid_block_valid() warn: if();

[coccinelle]
drivers/base/firmware_class.c:1252:6-9: ERROR: iterator variable bound on line 1238 cannot be NULL

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
