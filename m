From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 13 May 2013 01:04:15 +0000
Subject: build regressions 2013-05-12
Message-Id: <51903c0f.qeEbyhi5aOc9HbUo%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
mm/memory.c:2650: error: incompatible types in assignment
ERROR: "__ucmpdi2" [fs/nfs/nfs.ko] undefined!
mm/memory.c:3502:4: error: implicit declaration of function 'pmd_mkdirty' [-Werror=implicit-function-declaration]
mm/memory.c:3502:4: error: incompatible type for argument 1 of 'maybe_pmd_mkwrite'
mm/memory.c:3503:3: error: implicit declaration of function 'set_pmd_at' [-Werror=implicit-function-declaration]
mm/memory.c:3506:3: error: implicit declaration of function 'update_mmu_cache_pmd' [-Werror=implicit-function-declaration]
mm/memory.c:2650:2: error: implicit declaration of function 'pmd_mkyoung' [-Werror=implicit-function-declaration]
mm/memory.c:2650:8: error: incompatible types when assigning to type 'pmd_t' from type 'int'
/c/kernel-tests/src/linux/include/linux/huge_mm.h:208:10: error: implicit declaration of function 'page_to_nid' [-Werror=implicit-function-declaration]
/c/kernel-tests/src/linux/include/linux/mm.h:666:19: error: static declaration of 'page_to_nid' follows non-static declaration
e_powersaver.c:(.text+0x2136a9): undefined reference to `acpi_processor_register_performance'
e_powersaver.c:(.text+0x213718): undefined reference to `acpi_processor_unregister_performance'
e_powersaver.c:(.text+0x213914): undefined reference to `acpi_processor_get_bios_limit'
cs42l52.c:(.text+0x3523c): undefined reference to `input_event'
cs42l52.c:(.text+0x35387): undefined reference to `input_register_device'
wm8962.c:(.text+0x665ef): undefined reference to `input_event'
wm8962.c:(.text+0x6701c): undefined reference to `input_register_device'
cs42l52.c:(.text+0x35eb2): undefined reference to `devm_input_allocate_device'
wm8962.c:(.text+0x69ddf): undefined reference to `devm_input_allocate_device'
mm/memory.c:2649:2: error: implicit declaration of function 'pmd_pfn' [-Werror=implicit-function-declaration]
/c/kernel-tests/src/tip/include/linux/huge_mm.h:208:10: error: implicit declaration of function 'page_to_section' [-Werror=implicit-function-declaration]
include/linux/pagemap.h:585:3: error: implicit declaration of function 'zero_huge_user' [-Werror=implicit-function-declaration]
include/linux/pagemap.h:585:3: error: implicit declaration of function 'zero_huge_user' [-Werror=implicit-function-declaration]
fs/libfs.c:427:4: error: implicit declaration of function 'zero_huge_user_segment' [-Werror=implicit-function-declaration]
mm/memory.c:3426:4: error: implicit declaration of function 'copy_user_huge_page' [-Werror=implicit-function-declaration]

[sparse]
mm/memory.c:2706:17: sparse: context imbalance in 'do_wp_page_shared' - unexpected unlock
mm/memory.c:2731:12: sparse: context imbalance in 'do_wp_page' - wrong count at exit
mm/huge_memory.c:1104:5: sparse: context imbalance in 'do_huge_pmd_wp_page' - different lock contexts for basic block

[coccinelle]
drivers/hwmon/iio_hwmon.c:164:29-37: ERROR: st is NULL but dereferenced.
drivers/hwmon/iio_hwmon.c:164:29-37: ERROR: st is NULL but dereferenced.

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
