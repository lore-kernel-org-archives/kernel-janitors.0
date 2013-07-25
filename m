From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 25 Jul 2013 23:48:34 +0000
Subject: build regressions 2013-07-25
Message-Id: <51f1b952.HPqPg1OYXU+j57yW%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/drm/drm_mm.h:67:2: error: unknown type name 'spinlock_t'
include/drm/drm_mm.h:100:2: error: implicit declaration of function 'BUG_ON' [-Werror=implicit-function-declaration]
include/drm/drm_mm.h:67:2: error: unknown type name 'spinlock_t'
include/drm/drm_mm.h:100:2: error: implicit declaration of function 'BUG_ON' [-Werror=implicit-function-declaration]
include/drm/drm_mm.h:106:2: error: implicit declaration of function 'container_of' [-Werror=implicit-function-declaration]
include/drm/drm_mm.h:107:6: error: expected expression before 'struct'
drivers/staging/comedi/drivers/mite.h:76:2: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
dumpstack.c:(.kprobes.text+0x600): undefined reference to `.Ldo_extint'
drivers/char/tile-srom.c:308:2: error: initializer element is not computable at load time
drivers/power/Kconfig:266: syntax error
drivers/power/Kconfig:265: unknown option "Say"
drivers/power/Kconfig:266: unknown option "The"
drivers/power/Kconfig:267: unknown option "pins"
drivers/power/Kconfig:268: unknown option "handlers"
drivers/power/Kconfig:266: syntax error
drivers/power/Kconfig:265: unknown option "Say"
drivers/power/Kconfig:266: unknown option "The"
drivers/power/Kconfig:267: unknown option "pins"
drivers/power/Kconfig:268: unknown option "handlers"

[warnings]
arch/arm/include/asm/spinlock.h:150:2: warning: passing argument 1 of '__builtin_prefetch' discards 'volatile' qualifier from pointer target type [enabled by default]
arch/arm/include/asm/spinlock.h:169:2: warning: passing argument 1 of '__builtin_prefetch' discards 'volatile' qualifier from pointer target type [enabled by default]
arch/arm/include/asm/spinlock.h:218:2: warning: passing argument 1 of '__builtin_prefetch' discards 'volatile' qualifier from pointer target type [enabled by default]
arch/arm/include/asm/spinlock.h:239:2: warning: passing argument 1 of '__builtin_prefetch' discards 'volatile' qualifier from pointer target type [enabled by default]
arch/arm/include/asm/spinlock.h:258:2: warning: passing argument 1 of '__builtin_prefetch' discards 'volatile' qualifier from pointer target type [enabled by default]
drivers/usb/host/xhci.c:1184: warning: 'xhci' is used uninitialized in this function
drivers/regulator/pfuze100-regulator.c:298:2: warning: return makes integer from pointer without a cast [enabled by default]
drivers/char/tile-srom.c:307:2: warning: missing braces around initializer [-Wmissing-braces]
drivers/char/tile-srom.c:307:2: warning: (near initialization for 'srom_dev_attrs[0]') [-Wmissing-braces]
drivers/char/tile-srom.c:307:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/char/tile-srom.c:307:2: warning: (near initialization for 'srom_dev_attrs[0].name') [enabled by default]
drivers/char/tile-srom.c:308:2: warning: initialization makes integer from pointer without a cast [enabled by default]
drivers/char/tile-srom.c:308:2: warning: (near initialization for 'srom_dev_attrs[0].mode') [enabled by default]
drivers/char/tile-srom.c:309:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/char/tile-srom.c:309:2: warning: (near initialization for 'srom_dev_attrs[1].name') [enabled by default]
drivers/char/tile-srom.c:310:2: warning: initialization makes integer from pointer without a cast [enabled by default]
drivers/char/tile-srom.c:310:2: warning: (near initialization for 'srom_dev_attrs[1].mode') [enabled by default]
drivers/char/tile-srom.c:312:1: warning: initialization from incompatible pointer type [enabled by default]
drivers/char/tile-srom.c:312:1: warning: (near initialization for 'srom_dev_group.attrs') [enabled by default]
Warning(drivers/s390/cio/airq.c:104): No description found for parameter 'flags'

[sparse]
drivers/regulator/pfuze100-regulator.c:298:16: sparse: incorrect type in return expression (different base types) @@    expected int @@    got voiint @@

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
