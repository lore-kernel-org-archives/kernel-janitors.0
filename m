From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 13 Mar 2013 16:36:12 +0000
Subject: build regressions 2013-03-13
Message-Id: <5140aafc.cI8IDCcQGzql6srn%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
sound/soc/omap/omap-pcm.c:186:3: error: implicit declaration of function 'snd_dmaengine_generic_pcm_open' [-Werror=implicit-function-declaration]

[warnings]
arch/arm/mach-omap2/omap_device.c:1163:3: warning: return makes pointer from integer without a cast [enabled by default]
arch/arm/mach-omap2/omap_device.c:1168:3: warning: return makes pointer from integer without a cast [enabled by default]
drivers/staging/dwc2/hcd_intr.c:1539:13: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/dwc2/hcd_intr.c:1541:22: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/dwc2/hcd.c:1893:68: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/dwc2/hcd.c:2299:104: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/dwc2/hcd.c:2301:95: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/dwc2/hcd_intr.c:59:2: warning: #warning Compiling code to track missed SOFs [-Wcpp]
Warning(include/linux/mtd/nand.h:528): No description found for parameter 'write_byte'
drivers/acpi/scan.c:1616:8: warning: 'devid' may be used uninitialized in this function [-Wmaybe-uninitialized]
sound/soc/codecs/wm2000.c:543:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/delayacct.h:140:13: warning: 'struct taskstats' declared inside parameter list [enabled by default]
include/linux/delayacct.h:140:13: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/cgroup.h:747:13: warning: 'struct cgroupstats' declared inside parameter list [enabled by default]
include/linux/cgroup.h:747:13: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]

[sparse]
kernel/trace/trace_entries.h:247:1: sparse: symbol 'event_class_ftrace_bputs' was not declared. Should it be static?
kernel/trace/trace_entries.h:247:1: sparse: symbol '__event_bputs' was not declared. Should it be static?

[smatch]
sound/soc/codecs/tas5086.c:263 tas5086_hw_params() warn: unsigned 'val' is never less than zero.
sound/soc/codecs/tas5086.c:277 tas5086_hw_params() warn: unsigned 'val' is never less than zero.
drivers/leds/leds-lp5562.c:472 lp5562_store_engine_mux() error:  locking inconsistency.  We assume 'mutex:&chip->lock' is both locked and unlocked at the start.
drivers/leds/leds-lp5562.c:472 lp5562_store_engine_mux() warn: inconsistent returns mutex:&chip->lock: locked (459) unlocked (465,472)
security/integrity/ima/ima_api.c:100 ima_add_violation() warn: potential pointer math issue ('entry' is a 2208 bit pointer)
security/integrity/ima/ima_api.c:224 ima_store_measurement() warn: potential pointer math issue ('entry' is a 2208 bit pointer)
security/integrity/ima/ima_init.c:62 ima_add_boot_aggregate() warn: potential pointer math issue ('entry' is a 2208 bit pointer)
kernel/trace/trace_events.c:246 __ftrace_event_enable_disable() warn: bit shifter 'FTRACE_EVENT_FL_RECORDED_CMD_BIT' used for logical '&'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
