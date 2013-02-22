From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 22 Feb 2013 19:07:24 +0000
Subject: build regressions 2013-02-22
Message-Id: <5127c1ec.VlnrN3AX5zsaIyFv%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/softirq.c:890:0: error: unterminated argument list invoking macro "WARN_ON_ONCE"
kernel/softirq.c:349:2: error: 'WARN_ON_ONCE' undeclared (first use in this function)
kernel/softirq.c:349:2: error: expected ';' at end of input
kernel/softirq.c:349:2: error: expected declaration or statement at end of input
drivers/gpio/gpio-generic.c:180:19: error: 'bgpio_read8' undeclared (first use in this function)
drivers/gpio/gpio-generic.c:181:20: error: 'bgpio_write8' undeclared (first use in this function)
drivers/gpio/gpio-generic.c:184:19: error: 'bgpio_read16' undeclared (first use in this function)
drivers/gpio/gpio-generic.c:185:20: error: 'bgpio_write16' undeclared (first use in this function)
drivers/gpio/gpio-generic.c:188:19: error: 'bgpio_read32' undeclared (first use in this function)
drivers/gpio/gpio-generic.c:189:20: error: 'bgpio_write32' undeclared (first use in this function)
drivers/gpio/gpio-generic.c:202:23: error: 'bgpio_pin2mask_be' undeclared (first use in this function)
drivers/gpio/gpio-generic.c:202:43: error: 'bgpio_pin2mask' undeclared (first use in this function)
drivers/gpio/gpio-generic.c:242:17: error: 'bgpio_set_with_clear' undeclared (first use in this function)
drivers/gpio/gpio-generic.c:245:17: error: 'bgpio_set' undeclared (first use in this function)
drivers/gpio/gpio-generic.c:251:16: error: 'bgpio_get' undeclared (first use in this function)
drivers/gpio/gpio-generic.c:264:30: error: 'bgpio_dir_out' undeclared (first use in this function)
drivers/gpio/gpio-generic.c:265:29: error: 'bgpio_dir_in' undeclared (first use in this function)
drivers/gpio/gpio-generic.c:268:30: error: 'bgpio_dir_out_inv' undeclared (first use in this function)
drivers/gpio/gpio-generic.c:269:29: error: 'bgpio_dir_in_inv' undeclared (first use in this function)
drivers/gpio/gpio-generic.c:321:21: error: 'bgpio_set_set' undeclared (first use in this function)
arch/s390/appldata/appldata_os.c:125:3: error: implicit declaration of function 'atomci64_read' [-Werror=implicit-function-declaration]
drivers/thermal/intel_powerclamp.c:53:28: fatal error: linux/sched/rt.h: No such file or directory
drivers/gpio/gpio-generic.c:157:1: error: implicit declaration of function 'ioread64' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-generic.c:157:1: error: implicit declaration of function 'iowrite64' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-generic.c:193:19: error: 'bgpio_read64' undeclared (first use in this function)
drivers/gpio/gpio-generic.c:194:20: error: 'bgpio_write64' undeclared (first use in this function)
drivers/xen/xen-acpi-memhotplug.c:191:2: error: implicit declaration of function 'acpi_bus_add' [-Werror=implicit-function-declaration]
drivers/xen/xen-acpi-cpuhotplug.c:254:2: error: implicit declaration of function 'acpi_bus_add' [-Werror=implicit-function-declaration]
ld: cannot open linker script file drivers/acpi/.tmp_pci_root.ver: No such file or directory
objdump: 'drivers/acpi/.tmp_pci_link.o': No such file
mv: cannot stat `drivers/acpi/.tmp_pci_link.o': No such file or directory
objdump: 'drivers/acpi/.tmp_pci_irq.o': No such file
mv: cannot stat `drivers/acpi/.tmp_pci_irq.o': No such file or directory
objdump: 'drivers/acpi/.tmp_event.o': No such file
mv: cannot stat `drivers/acpi/.tmp_event.o': No such file or directory
objdump: 'drivers/acpi/.tmp_sysfs.o': No such file
mv: cannot stat `drivers/acpi/.tmp_sysfs.o': No such file or directory
objdump: 'drivers/acpi/.tmp_processor_perflib.o': No such file
mv: cannot stat `drivers/acpi/.tmp_processor_perflib.o': No such file or directory
objdump: 'fs/ext4/.tmp_balloc.o': No such file
mv: cannot stat `fs/ext4/.tmp_balloc.o': No such file or directory
objdump: 'fs/ext4/.tmp_inline.o': No such file
mv: cannot stat `fs/ext4/.tmp_inline.o': No such file or directory
objdump: 'fs/ext4/.tmp_xattr_user.o': No such file
mv: cannot stat `fs/ext4/.tmp_xattr_user.o': No such file or directory
objdump: 'fs/ext4/.tmp_xattr.o': No such file
mv: cannot stat `fs/ext4/.tmp_xattr.o': No such file or directory
objdump: 'net/ipv4/.tmp_xfrm4_state.o': No such file
mv: cannot stat `net/ipv4/.tmp_xfrm4_state.o': No such file or directory
objdump: 'net/ipv4/.tmp_xfrm4_input.o': No such file
mv: cannot stat `net/ipv4/.tmp_xfrm4_input.o': No such file or directory
objdump: 'drivers/acpi/.tmp_ec.o': No such file
mv: cannot stat `drivers/acpi/.tmp_ec.o': No such file or directory
objdump: 'drivers/acpi/.tmp_dock.o': No such file
mv: cannot stat `drivers/acpi/.tmp_dock.o': No such file or directory
ld: cannot open linker script file drivers/acpi/.tmp_debugfs.ver: No such file or directory
objdump: 'drivers/acpi/.tmp_cm_sbs.o': No such file
mv: cannot stat `drivers/acpi/.tmp_cm_sbs.o': No such file or directory
objdump: 'drivers/acpi/.tmp_video_detect.o': No such file
mv: cannot stat `drivers/acpi/.tmp_video_detect.o': No such file or directory
objdump: 'drivers/acpi/.tmp_processor_driver.o': No such file
mv: cannot stat `drivers/acpi/.tmp_processor_driver.o': No such file or directory
objdump: 'drivers/acpi/.tmp_processor_throttling.o': No such file
mv: cannot stat `drivers/acpi/.tmp_processor_throttling.o': No such file or directory
objdump: 'drivers/acpi/acpica/.tmp_evxfregn.o': No such file
mv: cannot stat `drivers/acpi/acpica/.tmp_evxfregn.o': No such file or directory
objdump: 'drivers/acpi/acpica/.tmp_evgpe.o': No such file
mv: cannot stat `drivers/acpi/acpica/.tmp_evgpe.o': No such file or directory
mv: cannot stat `drivers/acpi/acpica/.evevent.o.tmp': No such file or directory
fixdep: error opening depfile: arch/x86/video/.fbdev.o.d: No such file or directory
fixdep: error opening depfile: drivers/acpi/acpica/.dswscope.o.d: No such file or directory
fixdep: error opening depfile: arch/x86/oprofile/.init.o.d: No such file or directory
mv: cannot stat `arch/x86/oprofile/.nmi_int.o.tmp': No such file or directory
fixdep: error opening depfile: arch/x86/oprofile/.backtrace.o.d: No such file or directory

[warnings]
drivers/thermal/cpu_cooling.c:171:11: warning: 'level' may be used uninitialized in this function [-Wuninitialized]
drivers/iio/common/st_sensors/st_sensors_core.c:209:15: warning: 'odr_out.hz' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/usb/dvb-usb-v2/af9015.c:430:1: warning: 'af9015_eeprom_hash' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/stb6100.c:216:1: warning: 'stb6100_write_reg_range.constprop.3' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/stv0367.c:791:1: warning: 'stv0367_writeregs.constprop.4' uses dynamic stack allocation [enabled by default]
drivers/media/tuners/e4000.c:81:1: warning: 'e4000_rd_regs.constprop.0' uses dynamic stack allocation [enabled by default]
drivers/media/tuners/fc2580.c:98:1: warning: 'fc2580_rd_regs.constprop.0' uses dynamic stack allocation [enabled by default]
drivers/media/tuners/fc2580.c:66:1: warning: 'fc2580_wr_regs.constprop.1' uses dynamic stack allocation [enabled by default]
drivers/media/tuners/tda18212.c:90:1: warning: 'tda18212_rd_regs.constprop.0' uses dynamic stack allocation [enabled by default]
drivers/media/tuners/tda18218.c:92:1: warning: 'tda18218_rd_regs.constprop.0' uses dynamic stack allocation [enabled by default]
drivers/net/wireless/mwifiex/pcie.c:1157:9: warning: 'desc2' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/wireless/mwifiex/pcie.c:1159:9: warning: 'desc' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/cpufreq/cpufreq_conservative.c:244:54: sparse: incorrect type in assignment (different base types)
net/nfc/llcp/commands.c:341:50: sparse: restricted __be16 degrades to integer
net/nfc/llcp/commands.c:396:50: sparse: restricted __be16 degrades to integer

[smatch]
kernel/posix-timers.c:661 __lock_timer() warn: inconsistent returns spin_lock:&timr->it_lock: locked (655) unlocked (647,661)
kernel/posix-timers.c:661 __lock_timer() warn: inconsistent returns irqsave:*flags: locked (655) unlocked (647,661)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
