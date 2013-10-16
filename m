From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 16 Oct 2013 16:07:30 +0000
Subject: build regressions 2013-10-16
Message-Id: <525eb9c2.PXLlyhR49SQNil8K%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/ata/ahci.h:40:27: error: linux/phy/phy.h: No such file or directory
drivers/ata/ahci_platform.c:144: error: implicit declaration of function 'devm_phy_get'
drivers/ata/ahci_platform.c:155: error: implicit declaration of function 'phy_init'
drivers/ata/ahci_platform.c:156: error: implicit declaration of function 'phy_power_on'
drivers/ata/ahci_platform.c:240: error: implicit declaration of function 'phy_power_off'
drivers/ata/ahci_platform.c:241: error: implicit declaration of function 'phy_exit'
drivers/ata/ahci.h:40:27: error: linux/phy/phy.h: No such file or directory
drivers/ata/ahci.h:40:27: fatal error: linux/phy/phy.h: No such file or directory
include/../drivers/ata/ahci.h:40:27: fatal error: linux/phy/phy.h: No such file or directory
drivers/staging/mt29f_spinand/mt29f_spinand.c:665:9: error: implicit declaration of function 'mtd_to_state' [-Werror=implicit-function-declaration]
drivers/mfd/tc3589x.c:367:1: error: duplicate 'static'
include/linux/kref.h:47:2: error: implicit declaration of function '__WARN' [-Werror=implicit-function-declaration]
drivers/gpu/drm/tegra/bus.c:52:2: error: implicit declaration of function 'drm_dev_alloc' [-Werror=implicit-function-declaration]
drivers/gpu/drm/tegra/bus.c:56:2: error: implicit declaration of function 'drm_dev_register' [-Werror=implicit-function-declaration]
drivers/gpu/drm/tegra/bus.c:67:2: error: implicit declaration of function 'drm_dev_free' [-Werror=implicit-function-declaration]
drivers/gpu/drm/tegra/gem.c:97:2: error: implicit declaration of function 'dma_free_writecombine' [-Werror=implicit-function-declaration]
drivers/gpu/drm/tegra/gem.c:112:2: error: implicit declaration of function 'dma_alloc_writecombine' [-Werror=implicit-function-declaration]
drivers/gpu/drm/tegra/output.c:285:15: error: 'DRM_MODE_CONNECTOR_DSI' undeclared (first use in this function)
drivers/gpu/drm/tegra/output.c:286:13: error: 'DRM_MODE_ENCODER_DSI' undeclared (first use in this function)
net/openvswitch/flow.c:1413:4: error: expected '}' before 'else'
net/openvswitch/flow.c:1419:35: error: 'tci' undeclared (first use in this function)
net/openvswitch/flow.c:1421:4: error: expected identifier or '(' before 'else'
net/openvswitch/flow.c:91:4: error: expected identifier or '(' before 'while'
net/openvswitch/flow.c:1424:2: error: expected identifier or '(' before 'if'
net/openvswitch/flow.c:1439:4: error: expected identifier or '(' before 'else'
net/openvswitch/flow.c:1443:2: error: expected identifier or '(' before 'if'
net/openvswitch/flow.c:1467:2: error: expected identifier or '(' before 'if'
net/openvswitch/flow.c:1498:2: error: expected identifier or '(' before 'if'
net/openvswitch/flow.c:1522:2: error: expected identifier or '(' before 'if'
net/openvswitch/flow.c:1540:2: error: expected identifier or '(' before 'if'
net/openvswitch/flow.c:1558:2: error: expected identifier or '(' before 'if'
net/openvswitch/flow.c:1576:2: error: expected identifier or '(' before 'if'
net/openvswitch/flow.c:1587:2: error: expected identifier or '(' before 'if'
net/openvswitch/flow.c:1598:2: error: expected identifier or '(' before 'if'
net/openvswitch/flow.c:1613:2: error: expected identifier or '(' before 'if'
net/openvswitch/flow.c:1616:2: error: expected identifier or '(' before 'return'
net/openvswitch/flow.c:1617:1: error: expected identifier or '(' before '}' token
include/linux/compiler.h:148:3: error: expected identifier or '(' before ')' token
include/linux/compiler.h:134:2: error: expected identifier or '(' before 'if'
include/linux/compiler.h:148:3: error: expected identifier or '(' before ')' token
include/linux/compiler.h:148:3: error: expected identifier or '(' before ')' token
include/linux/compiler.h:134:2: error: expected identifier or '(' before 'if'
include/linux/compiler.h:148:3: error: expected identifier or '(' before ')' token
include/linux/compiler.h:134:2: error: expected identifier or '(' before 'if'
include/linux/compiler.h:148:3: error: expected identifier or '(' before ')' token
include/linux/compiler.h:134:2: error: expected identifier or '(' before 'if'
include/linux/compiler.h:148:3: error: expected identifier or '(' before ')' token
include/linux/compiler.h:134:2: error: expected identifier or '(' before 'if'
include/linux/compiler.h:148:3: error: expected identifier or '(' before ')' token
include/linux/compiler.h:134:2: error: expected identifier or '(' before 'if'
include/linux/compiler.h:148:3: error: expected identifier or '(' before ')' token
include/linux/compiler.h:134:2: error: expected identifier or '(' before 'if'
include/linux/compiler.h:148:3: error: expected identifier or '(' before ')' token
include/linux/compiler.h:134:2: error: expected identifier or '(' before 'if'
include/linux/compiler.h:148:3: error: expected identifier or '(' before ')' token
include/linux/compiler.h:134:2: error: expected identifier or '(' before 'if'
include/linux/compiler.h:148:3: error: expected identifier or '(' before ')' token
include/linux/compiler.h:134:2: error: expected identifier or '(' before 'if'
include/linux/compiler.h:148:3: error: expected identifier or '(' before ')' token
include/linux/compiler.h:134:2: error: expected identifier or '(' before 'if'
include/linux/compiler.h:148:3: error: expected identifier or '(' before ')' token
drivers/gpu/drm/i915/i915_drv.h:1228:29: error: field 'source' has incomplete type

[warnings]
drivers/gpu/drm/tegra/hdmi.c:527:42: warning: comparison of distinct pointer types lacks a cast [enabled by default]
include/linux/reset.h:12:9: warning: 'struct device_node' declared inside parameter list [enabled by default]
include/linux/reset.h:12:9: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
drivers/gpu/drm/tegra/hdmi.c:508: warning: format '%d' expects type 'int', but argument 3 has type 'ssize_t'
drivers/ata/ahci_platform.c:144: warning: assignment makes pointer from integer without a cast
drivers/cpufreq/intel_pstate.c:640:22: warning: unused variable 'max_pstate' [-Wunused-variable]
drivers/cpufreq/intel_pstate.c:640:10: warning: unused variable 'min_pstate' [-Wunused-variable]
drivers/gpu/drm/tegra/dc.c:261:24: warning: argument to 'sizeof' in '__builtin_memset' call is the same expression as the destination; did you mean to dereference it? [-Wsizeof-pointer-memaccess]
drivers/staging/mt29f_spinand/mt29f_spinand.c:665:32: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/staging/mt29f_spinand/mt29f_spinand.c:700:32: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/staging/mt29f_spinand/mt29f_spinand.c:707:32: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/gpu/drm/tegra/bus.c:52:6: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/gpu/drm/tegra/gem.c:112:12: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/gpu/drm/tegra/output.c:162:2: warning: passing argument 3 of 'of_get_property' from incompatible pointer type [enabled by default]
drivers/gpu/drm/tegra/hdmi.c:508:4: warning: format '%d' expects argument of type 'int', but argument 3 has type 'ssize_t' [-Wformat=]
drivers/gpu/drm/tegra/dc.c:261:24: warning: argument to 'sizeof' in 'memset' call is the same expression as the destination; did you mean to dereference it? [-Wsizeof-pointer-memaccess]
drivers/gpu/drm/tegra/drm.c:190:40: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/gpu/drm/tegra/drm.c:191:40: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
include/linux/gpio.h:226:4: warning: 'struct pinctrl_dev' declared inside parameter list [enabled by default]
include/linux/gpio.h:226:4: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
net/openvswitch/flow.c:1389:6: warning: unused variable 'orig_attrs' [-Wunused-variable]
net/openvswitch/flow.c:1421:2: warning: control reaches end of non-void function [-Wreturn-type]

[sparse]
drivers/leds/leds-pca9685.c:86:42: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/leds/leds-pca9685.c:91:42: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/leds/leds-pca9685.c:95:42: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
net/openvswitch/flow.c:1421:11: sparse: Trying to use reserved word 'else' as identifier
net/openvswitch/flow.c:1422:17: sparse: Trying to use reserved word 'if' as identifier
net/openvswitch/flow.c:1422:17: sparse: Trying to use reserved word 'else' as identifier
net/openvswitch/flow.c:1424:9: sparse: Trying to use reserved word 'if' as identifier
net/openvswitch/flow.c:1428:17: sparse: Trying to use reserved word 'if' as identifier
net/openvswitch/flow.c:1431:19: sparse: Trying to use reserved word 'else' as identifier
net/openvswitch/flow.c:1432:25: sparse: Trying to use reserved word 'if' as identifier
net/openvswitch/flow.c:1434:25: sparse: Trying to use reserved word 'return' as identifier
net/openvswitch/flow.c:1437:17: sparse: Trying to use reserved word 'if' as identifier
net/openvswitch/flow.c:1437:17: sparse: Trying to use reserved word 'else' as identifier
net/openvswitch/flow.c:1440:17: sparse: Trying to use reserved word 'if' as identifier
net/openvswitch/flow.c:1440:17: sparse: Trying to use reserved word 'else' as identifier
net/openvswitch/flow.c:1447:17: sparse: Trying to use reserved word 'if' as identifier
net/openvswitch/flow.c:1448:25: sparse: Trying to use reserved word 'if' as identifier
net/openvswitch/flow.c:1450:25: sparse: Trying to use reserved word 'return' as identifier
net/openvswitch/flow.c:1452:17: sparse: Trying to use reserved word 'if' as identifier
net/openvswitch/flow.c:1452:17: sparse: Trying to use reserved word 'else' as identifier
net/openvswitch/flow.c:1454:17: sparse: Trying to use reserved word 'do' as identifier
net/openvswitch/flow.c:1454:17: sparse: Trying to use reserved word 'if' as identifier
net/openvswitch/flow.c:1454:17: sparse: Trying to use reserved word 'else' as identifier
net/openvswitch/flow.c:1456:17: sparse: Trying to use reserved word 'do' as identifier
net/openvswitch/flow.c:1456:17: sparse: Trying to use reserved word 'if' as identifier
net/openvswitch/flow.c:1456:17: sparse: Trying to use reserved word 'else' as identifier
net/openvswitch/flow.c:1458:17: sparse: Trying to use reserved word 'do' as identifier
net/openvswitch/flow.c:1458:17: sparse: Trying to use reserved word 'if' as identifier
net/openvswitch/flow.c:1458:17: sparse: Trying to use reserved word 'else' as identifier
net/openvswitch/flow.c:1460:17: sparse: Trying to use reserved word 'do' as identifier
net/openvswitch/flow.c:1460:17: sparse: too many errors
kernel/hrtimer.c:1247:36: sparse: context imbalance in '__run_hrtimer' - unexpected unlock
drivers/gpu/drm/tegra/drm.c:418:19: sparse: symbol 'tegra_drm_driver' was not declared. Should it be static?
drivers/gpu/drm/tegra/fb.c:230:27: sparse: incorrect type in assignment (different address spaces) @@    expected char [noderef] <asn:2>*screen_base @@    got sn:2>*screen_base @@
drivers/gpu/drm/tegra/output.c:162:73: sparse: incorrect type in argument 3 (different type sizes) @@    expected int *lenp @@    got unsigned lint *lenp @@
drivers/gpu/drm/tegra/hdmi.c:527:49: sparse: incompatible types in comparison expression (different type sizes)
drivers/gpu/drm/tegra/drm.c:138:18: sparse: incorrect type in initializer (different address spaces) @@    expected struct drm_tegra_cmdbuf [noderef] <asn:1>*cmdbufs @@    got dbuf [noderef] <asn:1>*cmdbufs @@
drivers/gpu/drm/tegra/drm.c:140:18: sparse: incorrect type in initializer (different address spaces) @@    expected struct drm_tegra_reloc [noderef] <asn:1>*relocs @@    got eloc [noderef] <asn:1>*relocs @@
drivers/gpu/drm/tegra/drm.c:142:18: sparse: incorrect type in initializer (different address spaces) @@    expected struct drm_tegra_waitchk [noderef] <asn:1>*waitchks @@    got tchk [noderef] <asn:1>*waitchks @@
drivers/gpu/drm/tegra/drm.c:207:40: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*from @@    got onst [noderef] <asn:1>*from @@
net/openvswitch/flow.c:1414:33: sparse: Expected ) in function call
net/openvswitch/flow.c:1414:33: sparse: got {
net/openvswitch/flow.c:1414:33: sparse: Expected ; at end of statement
net/openvswitch/flow.c:1414:33: sparse: got )
net/openvswitch/flow.c:1421:16: sparse: Expected ; at end of declaration
net/openvswitch/flow.c:1421:16: sparse: got if
net/openvswitch/flow.c:1422:17: sparse: Expected ; at the end of type declaration
net/openvswitch/flow.c:1424:19: sparse: Expected ) in function declarator
drivers/gpu/drm/tegra/bus.c:52:15: sparse: undefined identifier 'drm_dev_alloc'
drivers/gpu/drm/tegra/bus.c:56:15: sparse: undefined identifier 'drm_dev_register'
drivers/gpu/drm/tegra/bus.c:67:9: sparse: undefined identifier 'drm_dev_free'
drivers/gpu/drm/tegra/gem.c:99:9: sparse: undefined identifier 'dma_free_writecombine'
drivers/gpu/drm/tegra/gem.c:115:21: sparse: undefined identifier 'dma_alloc_writecombine'
drivers/gpu/drm/tegra/output.c:285:29: sparse: undefined identifier 'DRM_MODE_CONNECTOR_DSI'
drivers/gpu/drm/tegra/output.c:286:27: sparse: undefined identifier 'DRM_MODE_ENCODER_DSI'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
