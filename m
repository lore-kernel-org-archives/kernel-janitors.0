From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 16 Sep 2013 19:26:36 +0000
Subject: build regressions 2013-09-16
Message-Id: <52375b6c.Y4No4jHEZHD2fDnz%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/media/platform/vsp1/vsp1.h:65:2: error: implicit declaration of function 'ioread32' [-Werror=implicit-function-declaration]
drivers/media/platform/vsp1/vsp1.h:70:2: error: implicit declaration of function 'iowrite32' [-Werror=implicit-function-declaration]
drivers/media/platform/soc_camera/rcar_vin.c:283:3: error: implicit declaration of function 'iowrite32' [-Werror=implicit-function-declaration]
drivers/media/platform/soc_camera/rcar_vin.c:351:2: error: implicit declaration of function 'ioread32' [-Werror=implicit-function-declaration]
drivers/media/i2c/adv7511.c:1788:10: error: 'struct adv7511_config' has no member named 'in_params'
drivers/media/i2c/adv7511.c:1792:10: error: 'struct adv7511_config' has no member named 'in_params'
drivers/media/i2c/adv7511.c:1796:10: error: 'struct adv7511_config' has no member named 'in_params'
drivers/media/i2c/adv7511.c:1800:10: error: 'struct adv7511_config' has no member named 'in_params'
drivers/media/i2c/adv7511.c:1804:10: error: 'struct adv7511_config' has no member named 'in_params'
drivers/media/i2c/adv7511.c:1808:10: error: 'struct adv7511_config' has no member named 'in_params'
drivers/media/i2c/adv7511.c:1812:10: error: 'struct adv7511_config' has no member named 'in_params'
drivers/media/i2c/adv7511.c:1824:11: error: 'struct adv7511_config' has no member named 'out_params'
drivers/media/i2c/adv7511.c:1828:10: error: 'struct adv7511_config' has no member named 'out_params'
drivers/media/i2c/adv7511.c:1832:10: error: 'struct adv7511_config' has no member named 'out_params'
drivers/media/i2c/adv7511.c:1836:10: error: 'struct adv7511_config' has no member named 'out_params'
drivers/media/i2c/adv7511.c:1840:10: error: 'struct adv7511_config' has no member named 'out_params'
drivers/media/i2c/adv7511.c:1842:13: error: 'struct adv7511_config' has no member named 'out_params'
drivers/media/i2c/adv7511.c:1845:11: error: 'struct adv7511_config' has no member named 'out_params'
drivers/media/i2c/adv7511.c:1852:12: error: 'struct adv7511_config' has no member named 'out_params'
drivers/media/i2c/adv7511.c:1857:12: error: 'struct adv7511_config' has no member named 'out_params'
drivers/media/i2c/adv7511.c:1862:12: error: 'struct adv7511_config' has no member named 'out_params'
drivers/media/i2c/adv7511.c:1867:12: error: 'struct adv7511_config' has no member named 'out_params'
drivers/media/i2c/adv7511.c:1872:12: error: 'struct adv7511_config' has no member named 'out_params'
drivers/media/i2c/adv7511.c:1877:12: error: 'struct adv7511_config' has no member named 'out_params'
drivers/media/i2c/adv7511.c:1882:12: error: 'struct adv7511_config' has no member named 'out_params'
drivers/media/i2c/adv7511.c:1887:12: error: 'struct adv7511_config' has no member named 'out_params'
drivers/media/i2c/adv7511.c:1892:12: error: 'struct adv7511_config' has no member named 'out_params'
drivers/media/i2c/adv7511.c:1897:12: error: 'struct adv7511_config' has no member named 'out_params'
drivers/media/i2c/adv7511.c:1902:12: error: 'struct adv7511_config' has no member named 'out_params'
drivers/media/i2c/adv7511.c:1907:12: error: 'struct adv7511_config' has no member named 'out_params'
include/linux/mm_types.h:29:3: error: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Werror=undef]
include/linux/mm.h:1297:5: error: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Werror=undef]

[warnings]
drivers/input/touchscreen/atmel_mxt_ts.c:1264: warning: passing argument 1 of '__swab16s' makes pointer from integer without a cast
drivers/input/touchscreen/atmel_mxt_ts.c:1265: warning: passing argument 1 of '__swab16s' makes pointer from integer without a cast
include/linux/mm.h:1297:5: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm.h:1297:5: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm.h:1297:5: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm.h:1297:5: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm.h:1297:5: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm.h:1297:5: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm.h:1297:5: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm.h:1297:5: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm.h:1297:5: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm.h:1297:5: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm.h:1297:5: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm.h:1297:5: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm.h:1297:5: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
fs/proc/task_mmu.c:66:3: warning: format '%zd' expects argument of type 'signed size_t', but argument 13 has type 'long unsigned int' [-Wformat]
fs/proc/task_mmu.c:66:3: warning: format '%8zd' expects type 'signed size_t', but argument 13 has type 'long unsigned int'
include/linux/mm_types.h:29:3: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm_types.h:29:3: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm_types.h:29:3: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm_types.h:29:3: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm_types.h:29:3: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm_types.h:29:3: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm_types.h:29:3: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm_types.h:29:3: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm_types.h:29:3: warning: "CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]
include/linux/mm_types.h:29:43: warning: "CONFIG_HUGETLB_PAGE" is not defined [-Wundef]

[sparse]
kernel/sched/fair.c:921:5: sparse: symbol 'task_numa_preferred_node' was not declared. Should it be static?

[coccinelle]
drivers/staging/lustre/lustre/ptlrpc/sec_config.c:613:15-19: ERROR: invalid reference to the index variable of the iterator on line 605
drivers/staging/lustre/lustre/ptlrpc/sec_config.c:589:15-23: ERROR: invalid reference to the index variable of the iterator on line 581

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
