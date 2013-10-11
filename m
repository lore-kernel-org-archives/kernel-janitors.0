From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 11 Oct 2013 16:03:59 +0000
Subject: build regressions 2013-10-11
Message-Id: <5258216f.MUpP56mNqpGuH/tr%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/thermal/thermal_core.c:947:30: error: 'const struct thermal_zone_device' has no member named 'type'
drivers/thermal/thermal_core.c:993:25: error: 'struct thermal_zone_device' has no member named 'type'
include/linux/init.h:298:27: error: invalid storage class for function '__inittest'
include/linux/init.h:304:27: error: invalid storage class for function '__exittest'
arch/x86/kernel/cpu/mshyperv.c:89:3: error: 'lapic_timer_frequency' undeclared (first use in this function)
drivers/bluetooth/btsdio.c:162:23: error: 'hdev' undeclared (first use in this function)
make[3]: *** No rule to make target `fs/btrfs/tests/btrfs-tests.o', needed by `fs/btrfs/btrfs.o'.
drivers/acpi/ac.c:55:1: error: expected identifier or '(' before '<<' token
drivers/acpi/ac.c:76:1: error: expected identifier or '(' before '>>' token
drivers/acpi/ac.c:138:1: error: expected identifier or '(' before '<<' token
drivers/acpi/ac.c:259:2: error: 'ac_sleep_before_get_state_ms' undeclared (first use in this function)
drivers/acpi/ac.c:302:1: error: expected expression before '<<' token
drivers/acpi/ac.c:309:1: error: expected expression before '=' token
drivers/acpi/ac.c:311:1: error: expected expression before '>>' token
drivers/acpi/ac.c:321:24: error: 'acpi_ac_notify_handler' undeclared (first use in this function)
drivers/acpi/ac.c:331:1: error: expected expression before '<<' token
drivers/acpi/ac.c:368:12: error: invalid storage class for function 'acpi_ac_remove'
drivers/acpi/ac.c:381:1: error: expected expression before '<<' token
drivers/acpi/ac.c:402:2: error: initializer element is not constant
drivers/acpi/ac.c:406:14: error: 'acpi_ac_pm_ops' undeclared (first use in this function)
drivers/acpi/ac.c:411:19: error: invalid storage class for function 'acpi_ac_init'
drivers/acpi/ac.c:418:1: error: expected expression before '<<' token
drivers/acpi/ac.c:430:1: error: expected expression before '=' token
drivers/acpi/ac.c:433:1: error: expected expression before '>>' token
drivers/acpi/ac.c:439:20: error: invalid storage class for function 'acpi_ac_exit'
drivers/acpi/ac.c:441:1: error: expected expression before '<<' token
drivers/acpi/ac.c:446:1: error: expected expression before '=' token
drivers/acpi/ac.c:450:1: error: expected expression before '>>' token
drivers/acpi/ac.c:453:1: error: initializer element is not constant
drivers/acpi/ac.c:453:1: error: expected declaration or statement at end of input
drivers/acpi/ac.c:453:1: error: expected declaration or statement at end of input

[warnings]
drivers/staging/btmtk_usb/btmtk_usb.c:1583:17: warning: assignment from incompatible pointer type [enabled by default]
arch/x86/kernel/cpu/mshyperv.c:72:6: warning: unused variable 'hv_lapic_frequency' [-Wunused-variable]
drivers/acpi/ac.c:398:21: warning: 'alias' attribute ignored [-Wattributes]
drivers/acpi/ac.c:452:1: warning: 'alias' attribute ignored [-Wattributes]
drivers/acpi/ac.c:453:1: warning: 'alias' attribute ignored [-Wattributes]
drivers/acpi/ac.c:73:12: warning: 'acpi_ac_resume' used but never defined [enabled by default]
drivers/gpu/drm/i915/intel_panel.c:709:8: warning: passing argument 2 of 'backlight_device_register' from incompatible pointer type [enabled by default]
fs/ext4/xattr.c:1355:9: warning: assignment from incompatible pointer type [enabled by default]
drivers/acpi/ac.c:368:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/acpi/ac.c:400:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/acpi/ac.c:439:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
include/linux/init.h:217:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/acpi/ac.c:400:31: warning: unused variable 'acpi_ac_driver' [-Wunused-variable]
drivers/acpi/ac.c:263:29: warning: 'ac_dmi_table' defined but not used [-Wunused-variable]
net/wireless/util.c:1289:21: warning: 'radar_required' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/net/wireless/ath/wcn36xx/wcn36xx.h:88:24: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/net/wireless/ath/wcn36xx/wcn36xx.h:88:24: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/gpu/drm/i915/intel_panel.c:708:44: sparse: incorrect type in argument 2 (different base types) @@    expected struct device *dev @@    got sstruct device *dev @@
drivers/acpi/ac.c:55:1: sparse: missing identifier in declaration
drivers/acpi/ac.c:226:9: sparse: Trying to use reserved word 'if' as identifier
drivers/acpi/ac.c:229:9: sparse: Trying to use reserved word 'switch' as identifier
drivers/acpi/ac.c:230:9: sparse: not in switch scope
drivers/acpi/ac.c:233:9: sparse: not in switch scope
drivers/acpi/ac.c:234:9: sparse: not in switch scope
drivers/acpi/ac.c:235:9: sparse: not in switch scope
drivers/acpi/ac.c:254:9: sparse: Trying to use reserved word 'return' as identifier
drivers/acpi/ac.c:260:9: sparse: Trying to use reserved word 'return' as identifier
net/mac80211/aes_ccm.c:28:65: sparse: Variable length array is used.
net/mac80211/aes_ccm.c:52:65: sparse: Variable length array is used.
drivers/acpi/ac.c:55:1: sparse: Expected ; at the end of type declaration
drivers/acpi/ac.c:55:1: sparse: got <<
drivers/acpi/ac.c:226:13: sparse: Expected ) in function declarator
drivers/acpi/ac.c:260:16: sparse: Expected ; at end of declaration
drivers/acpi/ac.c:302:1: sparse: Expected ; at end of statement
drivers/acpi/ac.c:376:45: sparse: undefined identifier 'acpi_ac_notify_handler'
drivers/acpi/ac.c:246:35: sparse: undefined identifier 'ac'
drivers/acpi/ac.c:341:26: sparse: undefined identifier 'ac_dmi_table'
drivers/acpi/ac.c:368:12: sparse: symbol 'acpi_ac_remove' redeclared with different type (originally declared at drivers/acpi/ac.c:63) - incompatible argument 1 (different base types)

[coccinelle]
drivers/net/wireless/ath/wcn36xx/smd.c:1330:2-8: preceding lock on line 1324
drivers/net/wireless/ath/wcn36xx/debug.c:27:11-31: WARNING opportunity for simple_open, see also structure on line 106
drivers/net/wireless/ath/wcn36xx/debug.c:27:11-31: WARNING opportunity for simple_open, see also structure on line 148

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
