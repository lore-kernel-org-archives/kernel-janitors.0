From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 16 Jun 2013 01:50:33 +0000
Subject: build regressions 2013-06-15
Message-Id: <51bd19e9.yXIa0Js5V3MOGFzr%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
mm/filemap.c:2341:10: error: 'PMD_SHIFT' undeclared (first use in this function)
include/linux/pagemap.h:580:27: error: 'PMD_SHIFT' undeclared (first use in this function)
include/linux/pagemap.h:580:27: error: 'PMD_SHIFT' undeclared (first use in this function)
fs/libfs.c:425:37: error: 'PMD_SHIFT' undeclared (first use in this function)
fs/libfs.c:471:18: error: 'PMD_SHIFT' undeclared (first use in this function)
include/linux/pagemap.h:580:27: error: 'PMD_SHIFT' undeclared (first use in this function)
include/linux/dcache.h:467:2: error: 'struct dentry' has no member named 'd_fallthru'
include/linux/dcache.h:468:8: error: 'struct dentry' has no member named 'd_fallthru'
include/linux/dcache.h:467:2: error: 'struct dentry' has no member named 'd_fallthru'
include/linux/dcache.h:468:8: error: 'struct dentry' has no member named 'd_fallthru'
fs/namei.c:1338:6: error: dereferencing pointer to incomplete type
fs/namei.c:1363:4: error: dereferencing pointer to incomplete type
fs/namei.c:1364:4: error: dereferencing pointer to incomplete type
fs/namei.c:1417:25: error: dereferencing pointer to incomplete type
fs/namei.c:1418:5: error: dereferencing pointer to incomplete type
fs/namei.c:1445:18: error: dereferencing pointer to incomplete type
fs/namei.c:1447:3: error: too few arguments to function 'union_create_topmost_dir'
fs/namei.c:1450:10: error: 'struct dentry' has no member named 'd_union_stack'
fs/namei.c:1465:15: error: dereferencing pointer to incomplete type
fs/namei.c:1584:4: error: too few arguments to function 'union_create_topmost_dir'
fs/namei.c:1858:18: error: 'struct dentry' has no member named 'd_fallthru'
fs/namei.c:1952:17: error: 'struct dentry' has no member named 'd_fallthru'
fs/namei.c:2079:24: error: 'struct dentry' has no member named 'd_fallthru'
fs/namei.c:3423:44: error: 'struct dentry' has no member named 'd_fallthru'
fs/namei.c:3435:3: error: 'struct dentry' has no member named 'd_fallthru'
fs/namei.c:3594:14: error: 'struct dentry' has no member named 'd_fallthru'
fs/namei.c:3838:23: error: 'struct dentry' has no member named 'd_fallthru'
include/linux/dcache.h:467:2: error: 'struct dentry' has no member named 'd_fallthru'
include/linux/dcache.h:468:8: error: 'struct dentry' has no member named 'd_fallthru'
fs/xattr.c:606:18: error: 'struct dentry' has no member named 'd_fallthru'
fs/xattr.c:699:18: error: 'struct dentry' has no member named 'd_fallthru'
ERROR: "__moddi3" undefined!
ERROR: "__divdi3" undefined!
dir.c:(.text+0x4b7fe1): undefined reference to `__moddi3'
drivers/leds/leds-mc13783.c:280:4: error: implicit declaration of function 'of_get_next_child' [-Werror=implicit-function-declaration]
/c/kernel-tests/src/linux/include/linux/dcache.h:467:2: error: 'struct dentry' has no member named 'd_fallthru'
/c/kernel-tests/src/linux/include/linux/dcache.h:467:2: error: 'struct dentry' has no member named 'd_fallthru'
/c/kernel-tests/src/linux/include/linux/dcache.h:467:2: error: 'struct dentry' has no member named 'd_fallthru'
/c/kernel-tests/src/linux/include/linux/dcache.h:468:8: error: 'struct dentry' has no member named 'd_fallthru'
rtl28xxu.c:(.text+0x227e7b): undefined reference to `mt2060_attach'
af9035.c:(.text+0x223989): undefined reference to `fc2580_attach'
rtl28xxu.c:(.text+0x22d8da): undefined reference to `fc2580_attach'
/c/kernel-tests/src/sparc64/include/linux/dcache.h:467:2: error: 'struct dentry' has no member named 'd_fallthru'
/c/kernel-tests/src/sparc64/include/linux/dcache.h:467:2: error: 'struct dentry' has no member named 'd_fallthru'
/c/kernel-tests/src/sparc64/include/linux/dcache.h:467:2: error: 'struct dentry' has no member named 'd_fallthru'
/c/kernel-tests/src/sparc64/include/linux/dcache.h:468:8: error: 'struct dentry' has no member named 'd_fallthru'
drivers/scsi/scsi-mq.c:140:3: error: implicit declaration of function '__smp_call_function_single' [-Werror=implicit-function-declaration]
/c/kernel-tests/src/tip/include/linux/dcache.h:467:2: error: 'struct dentry' has no member named 'd_fallthru'
/c/kernel-tests/src/tip/include/linux/dcache.h:468:8: error: 'struct dentry' has no member named 'd_fallthru'
/c/kernel-tests/src/stable/include/linux/dcache.h:467:2: error: 'struct dentry' has no member named 'd_fallthru'
/c/kernel-tests/src/stable/include/linux/dcache.h:468:8: error: 'struct dentry' has no member named 'd_fallthru'
arch/x86/mm/init.c:510:2: error: conflicting types for 'load_cr3'
arch/x86/mm/init.c:511:2: error: conflicting types for '__flush_tlb_all'
arch/x86/mm/init.c:513:16: error: expected declaration specifiers or '...' before numeric constant
arch/x86/mm/init.c:513:19: error: expected declaration specifiers or '...' before 'max_pfn_mapped'
arch/x86/mm/init.c:514:1: error: expected identifier or '(' before '}' token
/c/kernel-tests/src/x86/include/linux/dcache.h:467:2: error: 'struct dentry' has no member named 'd_fallthru'
/c/kernel-tests/src/x86/include/linux/dcache.h:468:8: error: 'struct dentry' has no member named 'd_fallthru'

[warnings]
fs/romfs/super.c:197: warning: comparison is always false due to limited range of data type
fs/proc/generic.c:263: warning: comparison is always false due to limited range of data type
fs/qnx6/dir.c:167: warning: comparison is always false due to limited range of data type
fs/union.c:767: warning: excess elements in struct initializer
fs/union.c:767: warning: (near initialization for 'nameless')
fs/union.c:767: warning: excess elements in struct initializer
fs/union.c:767: warning: (near initialization for 'nameless')
drivers/target/iscsi/iscsi_target.c:1665: warning: 'payload_length' is used uninitialized in this function
mm/page_alloc.c:4792: warning: 'start_pfn' is used uninitialized in this function
mm/page_alloc.c:4792: warning: 'end_pfn' is used uninitialized in this function
drivers/scsi/sd.c:582: warning: 'sd_prot_op' defined but not used
fs/namei.c:1445:3: warning: passing argument 2 of 'union_create_topmost_dir' from incompatible pointer type [enabled by default]
fs/namei.c:1445:3: warning: passing argument 3 of 'union_create_topmost_dir' from incompatible pointer type [enabled by default]
fs/namei.c:1582:4: warning: passing argument 2 of 'union_create_topmost_dir' from incompatible pointer type [enabled by default]
fs/namei.c:1582:4: warning: passing argument 3 of 'union_create_topmost_dir' from incompatible pointer type [enabled by default]
fs/dcache.c:1300:6: warning: unused variable 'found' [-Wunused-variable]
drivers/acpi/osl.c:651:36: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/target/iscsi/iscsi_target.c:1665:5: warning: 'payload_length' may be used uninitialized in this function [-Wuninitialized]
drivers/leds/leds-mc13783.c:280:10: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/scsi/virtio_scsi.c:688:2: warning: #warning FIXME: Need to pass nr_hw_queues into scsi-mq [-Wcpp]
drivers/scsi/scsi.c:856:7: warning: unused variable 'old_good_bytes' [-Wunused-variable]
drivers/scsi/scsi.c:826:22: warning: unused variable 'drv' [-Wunused-variable]
arch/x86/mm/init.c:510:2: warning: data definition has no type or storage class [enabled by default]
arch/x86/mm/init.c:510:2: warning: type defaults to 'int' in declaration of 'load_cr3' [-Wimplicit-int]
arch/x86/mm/init.c:510:2: warning: parameter names (without types) in function declaration [enabled by default]
arch/x86/mm/init.c:511:2: warning: data definition has no type or storage class [enabled by default]
arch/x86/mm/init.c:511:2: warning: type defaults to 'int' in declaration of '__flush_tlb_all' [-Wimplicit-int]
arch/x86/mm/init.c:511:2: warning: function declaration isn't a prototype [-Wstrict-prototypes]

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
