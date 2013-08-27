From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 27 Aug 2013 04:27:26 +0000
Subject: build regressions 2013-08-26
Message-Id: <521c2aae.mD3sC59vgz5q1K80%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
(.text+0x153ff5): undefined reference to `cpufreq_table_validate_and_show'
sound/soc/fsl/imx-mc13783.c:23:28: fatal error: asm/mach-types.h: No such file or directory
(.text+0x37e3e): undefined reference to `i2c_del_adapter'

[sparse]
drivers/mmc/host/omap_hsmmc.c:616:53: sparse: dubious: !x & y
drivers/target/target_core_configfs.c:272:27: sparse: symbol 'target_core_subsystem' was not declared. Should it be static?

[coccinelle]
drivers/usb/host/isp116x-hcd.c:175:3-49: code aligned with following code on line 177
drivers/usb/host/isp116x-hcd.c:128:3-48: code aligned with following code on line 130

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
