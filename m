From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 04 Nov 2012 00:46:25 +0000
Subject: build regressions 2012-11-03
Message-Id: <20121104004625.GA7304@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/usb/chipidea/../host/ehci.h:665:2: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]
drivers/usb/chipidea/../host/ehci.h:677:2: error: implicit declaration of function 'writel' [-Werror=implicit-function-declaration]
kernel/trace/trace.h:392: error: 'struct task_struct' has no member named 'trace_recursion'
drivers/power/power_seq/power_seq.c:369:26: error: 'power_seq_of_parse_regulator' undeclared here (not in a function)
make[3]: *** No rule to make target `drivers/rtc/rtc-tps6586x.o', needed by `drivers/rtc/built-in.o'.
drivers/power/power_seq/power_seq.c:370:20: error: 'power_seq_of_parse_pwm' undeclared here (not in a function)
drivers/power/power_seq/power_seq.c:371:21: error: 'power_seq_of_parse_gpio' undeclared here (not in a function)
drivers/usb/chipidea/../host/ehci.h:662:3: error: implicit declaration of function 'readl_be' [-Werror=implicit-function-declaration]
drivers/usb/chipidea/../host/ehci.h:674:3: error: implicit declaration of function 'writel_be' [-Werror=implicit-function-declaration]
arch/powerpc/include/asm/io-defs.h:6:1: error: conflicting types for 'readl'
arch/powerpc/include/asm/io-defs.h:8:1: error: conflicting types for 'readl_be'
arch/powerpc/include/asm/io-defs.h:11:1: error: static declaration of 'writel' follows non-static declaration
arch/powerpc/include/asm/io-defs.h:13:1: error: static declaration of 'writel_be' follows non-static declaration
drivers/of/of_pci.c:69:3: error: implicit declaration of function 'of_translate_address' [-Werror=implicit-function-declaration]
drivers/input/misc/sx8634.c:580:2: error: implicit declaration of function 'of_get_next_child' [-Werror=implicit-function-declaration]
drivers/input/misc/sx8634.c:635:22: error: 'NO_IRQ' undeclared (first use in this function)

[warnings]
arch/arm/mach-s3c24xx/mach-rx1950.c:487:2: warning: 'pwm_request' is deprecated (declared at include/linux/pwm.h:14) [-Wdeprecated-declarations]
arch/arm/mach-s3c24xx/mach-rx1950.c:504:2: warning: 'pwm_free' is deprecated (declared at include/linux/pwm.h:19) [-Wdeprecated-declarations]
arch/powerpc/include/asm/io-defs.h:11:1: warning: conflicting types for 'writel' [enabled by default]
arch/powerpc/include/asm/io-defs.h:13:1: warning: conflicting types for 'writel_be' [enabled by default]
drivers/pci/of.c:12:0: warning: "DEBUG" redefined [enabled by default]
WARNING: vmlinux.o(.text+0x10aa130): Section mismatch in reference from the function .dlpar_add_slot() to the function .devinit.text:.init_phb_dynamic()
drivers/of/of_pci.c:82:4: warning: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'resource_size_t' [-Wformat]
WARNING: drivers/spi/built-in.o(.devinit.text+0x1cc4): Section mismatch in reference from the function rspi_probe() to the function .devexit.text:spidev_remove()
drivers/memstick/core/ms_block.c:679:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/input/misc/sx8634.c:178:6: warning: format '%d' expects argument of type 'int', but argument 3 has type 'ssize_t' [-Wformat]
drivers/input/misc/sx8634.c:580:16: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/pwm/core.c:320:1: warning: 'pwm_request' is deprecated (declared at drivers/pwm/core.c:295) [-Wdeprecated-declarations]
drivers/pwm/core.c:364:1: warning: 'pwm_free' is deprecated (declared at drivers/pwm/core.c:360) [-Wdeprecated-declarations]
drivers/video/backlight/pwm_bl.c:220:3: warning: 'pwm_request' is deprecated (declared at include/linux/pwm.h:14) [-Wdeprecated-declarations]
WARNING: vmlinux.o(.text+0x12c232): Section mismatch in reference from the function pci_scan_child_bus() to the function .devinit.text:pcibios_fixup_bus()

[sparse]
kernel/trace/trace.c:1145:14: sparse: expression using sizeof bool
block/partitions/nvtegra.c:88:6: sparse: symbol 'hidden_parts_str' was not declared. Should it be static?
block/partitions/tegrapart.c:34:6: sparse: symbol 'partition_list' was not declared. Should it be static?
block/partitions/tegrapart.c:36:10: sparse: symbol 'strtohex' was not declared. Should it be static?
block/partitions/tegrapart.c:167:5: sparse: symbol 'tegra_msdos_parse' was not declared. Should it be static?
block/partitions/tegrapart.c:238:5: sparse: symbol 'parse_tegrapart' was not declared. Should it be static?
block/partitions/tegrapart.c:324:5: sparse: symbol 'tegrapart_partition' was not declared. Should it be static?
drivers/power/power_seq/power_seq.c:254:5: sparse: symbol 'power_seq_add_sequence' was not declared. Should it be static?
drivers/power/power_seq/power_seq.c:369:33: sparse: undefined identifier 'power_seq_of_parse_regulator'
drivers/power/power_seq/power_seq.c:370:27: sparse: undefined identifier 'power_seq_of_parse_pwm'
drivers/power/power_seq/power_seq.c:371:28: sparse: undefined identifier 'power_seq_of_parse_gpio'
drivers/input/misc/sx8634.c:580:25: sparse: undefined identifier 'of_get_next_child'
drivers/input/misc/sx8634.c:635:36: sparse: undefined identifier 'NO_IRQ'

[coccinelle]
drivers/gpu/drm/i915/intel_ringbuffer.c:1478:3-25: duplicated argument to & or |
drivers/staging/media/lirc/lirc_igorplugusb.c:472:9-14: ERROR: driver is NULL but dereferenced.
drivers/staging/media/lirc/lirc_igorplugusb.c:461:7-13: ERROR: ir is NULL but dereferenced.

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
