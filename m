From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 06 Aug 2013 20:07:07 +0000
Subject: build regressions 2013-08-06
Message-Id: <5201576b./DnVlyNim34Yu2ds%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
sound/soc/codecs/pcm1792a.c:234:21: error: 'pcm1792a_of_match' undeclared here (not in a function)
sound/soc/codecs/wm8994.c:1457:16: error: macro "SOC_SINGLE_VALUE" passed 5 arguments, but takes just 4
sound/soc/codecs/wm8994.c:1438:20: error: 'SOC_SINGLE_VALUE' undeclared here (not in a function)
sound/soc/codecs/wm8994.c:1459:16: error: macro "SOC_SINGLE_VALUE" passed 5 arguments, but takes just 4
sound/soc/codecs/wm8994.c:1461:16: error: macro "SOC_SINGLE_VALUE" passed 5 arguments, but takes just 4
sound/soc/codecs/wm8994.c:1463:16: error: macro "SOC_SINGLE_VALUE" passed 5 arguments, but takes just 4
sound/soc/codecs/wm8994.c:1465:16: error: macro "SOC_SINGLE_VALUE" passed 5 arguments, but takes just 4
sound/soc/codecs/wm8994.c:1470:16: error: macro "SOC_SINGLE_VALUE" passed 5 arguments, but takes just 4
sound/soc/codecs/wm8994.c:1469:1: error: initializer element is not constant
sound/soc/codecs/wm8994.c:1472:16: error: macro "SOC_SINGLE_VALUE" passed 5 arguments, but takes just 4
sound/soc/codecs/wm8994.c:1471:1: error: initializer element is not constant
sound/soc/codecs/wm8994.c:1474:16: error: macro "SOC_SINGLE_VALUE" passed 5 arguments, but takes just 4
sound/soc/codecs/wm8994.c:1473:1: error: initializer element is not constant
sound/soc/codecs/wm8994.c:1476:16: error: macro "SOC_SINGLE_VALUE" passed 5 arguments, but takes just 4
sound/soc/codecs/wm8994.c:1475:1: error: initializer element is not constant
sound/soc/codecs/wm8994.c:1478:16: error: macro "SOC_SINGLE_VALUE" passed 5 arguments, but takes just 4
sound/soc/codecs/wm8994.c:1477:1: error: initializer element is not constant
fs/reiserfs/inode.c:3170:3: error: implicit declaration of function 'reiserfs_write_unlock_once' [-Werror=implicit-function-declaration]
fs/reiserfs/inode.c:3170:43: error: 'depth' undeclared (first use in this function)
mm/mmzone.c:101:5: error: redefinition of 'page_cpupid_xchg_last'
drivers/net/wireless/ath/ath9k/ar9002_phy.c:560:36: error: 'struct ath_hw' has no member named 'btcoex_hw'
ERROR: "dirty_expire_interval" undefined!
(.text+0x3eb64): undefined reference to `i2c_smbus_read_byte_data'
(.text+0x3eb88): undefined reference to `i2c_smbus_write_byte_data'
(.text+0x3ebe2): undefined reference to `i2c_smbus_read_byte_data'
(.text+0x3ec4a): undefined reference to `i2c_smbus_write_byte_data'
stw481x.c:(.init.text+0x3278): undefined reference to `i2c_register_driver'
mm/mprotect.c:68:6: error: implicit declaration of function 'cpupid_to_cpu' [-Werror=implicit-function-declaration]
mm/mempolicy.c:2295:3: error: implicit declaration of function 'cpu_pid_to_cpupid' [-Werror=implicit-function-declaration]

[warnings]
kernel/sched/fair.c:819: warning: 'task_h_load' declared 'static' but never defined
drivers/mtd/nand/nandsim.c:774:2: warning: format '%u' expects argument of type 'unsigned int', but argument 2 has type 'long unsigned int' [-Wformat]
mm/memory.c:73:2: warning: #warning Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_cpupid. [-Wcpp]
mm/memory.c:73:2: warning: #warning Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_cpupid. [-Wcpp]
warning: (MFD_STW481X) selects I2C_SMBUS which has unmet direct dependencies (I2C && GENERIC_HARDIRQS)
warning: (MFD_STW481X) selects I2C_SMBUS which has unmet direct dependencies (I2C && GENERIC_HARDIRQS)
warning: (MFD_STW481X) selects I2C_SMBUS which has unmet direct dependencies (I2C && GENERIC_HARDIRQS)
warning: (MFD_STW481X) selects I2C_SMBUS which has unmet direct dependencies (I2C && GENERIC_HARDIRQS)
drivers/gpu/drm/i915/i915_irq.c:3289:11: warning: unused variable 'de_pipe_enables' [-Wunused-variable]
drivers/gpu/drm/i915/i915_drv.h:2086:42: warning: 'ddi_translations_edp' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/reiserfs/prints.c:368:1: warning: 'noreturn' function does return [enabled by default]

[coccinelle]
drivers/leds/leds-pca9633.c:138:2-3: Unneeded semicolon

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
