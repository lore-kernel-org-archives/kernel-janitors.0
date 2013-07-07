From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 07 Jul 2013 16:03:01 +0000
Subject: build regressions 2013-07-07
Message-Id: <51d99135.jSsIDEyE8rKSrCFq%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/base/soc.c:127:2: error: 'soc' undeclared (first use in this function)
drivers/gpu/drm/drm_memory.c:172: error: implicit declaration of function 'ioremap_wc'
drivers/gpu/drm/nouveau/nouveau_bo.c:201:84: error: expected ',' or ';' before ')' token
arch/powerpc/mm/mmu_context_hash64.c:34:24: error: 'ida' undeclared (first use in this function)
samsung-laptop.c:(.init.text+0xb165): undefined reference to `acpi_video_unregister'
samsung-laptop.c:(.init.text+0xb165): undefined reference to `acpi_video_unregister'
samsung-laptop.c:(.init.text+0xd35b): undefined reference to `acpi_video_unregister'
samsung-laptop.c:(.init.text+0xd35b): undefined reference to `acpi_video_unregister'
net/tipc/server.c:219:2: error: too many arguments to function 'idr_alloc'

[warnings]
lib/idr.c:253:17: warning: comparison of distinct pointer types lacks a cast [enabled by default]
lib/idr.c:262:16: warning: comparison of distinct pointer types lacks a cast [enabled by default]
lib/idr.c:556:24: warning: comparison of distinct pointer types lacks a cast [enabled by default]
Warning(lib/idr.c:473): No description found for parameter 'gfp'
Warning(lib/idr.c:473): Excess function parameter 'gfp_mask' description in 'ida_alloc_range'
Warning(lib/idr.c:535): No description found for parameter 'gfp'
Warning(lib/idr.c:535): Excess function parameter 'gfp_mask' description in 'ida_alloc_cyclic'
Warning(lib/idr.c:473): No description found for parameter 'gfp'
Warning(lib/idr.c:473): Excess function parameter 'gfp_mask' description in 'ida_alloc_range'
Warning(lib/idr.c:535): No description found for parameter 'gfp'
Warning(lib/idr.c:535): Excess function parameter 'gfp_mask' description in 'ida_alloc_cyclic'
Warning(lib/idr.c:1104): Excess function parameter 'gfp_mask' description in 'idr_alloc_cyclic'
Warning(lib/idr.c:1104): Excess function parameter 'gfp_mask' description in 'idr_alloc_cyclic'
drivers/scsi/osd/osd_uld.c:430:5: warning: 'error' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/ia64/kernel/ivt.S:223: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:223: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:185: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:223: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:223: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:185: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:223: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:223: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:201: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:224: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:224: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:185: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:224: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:224: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:185: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:224: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:224: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:201: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:279: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:279: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:270: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:323: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:323: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:314: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:566: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:566: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:558: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:632: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:632: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:624: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:686: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:686: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:679: Warning: This is the location of the conflicting usage
{standard input}:1324: Warning: Use of 'ld4' violates RAW dependency 'DTC' (data)
{standard input}:1324: Warning: Only the first path encountering the conflict is reported
{standard input}:1307: Warning: This is the location of the conflicting usage
{standard input}:1330: Warning: Use of 'st4' violates RAW dependency 'DTC' (data)
{standard input}:1330: Warning: Only the first path encountering the conflict is reported
{standard input}:1307: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:223: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:223: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:185: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:223: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:223: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:185: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:223: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:223: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:201: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:224: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:224: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:185: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:224: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:224: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:185: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:224: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:224: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:201: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:279: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:279: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:270: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:323: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:323: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:314: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:566: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:566: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:558: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:632: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:632: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:624: Warning: This is the location of the conflicting usage
arch/ia64/kernel/ivt.S:686: Warning: Use of 'ld8' violates RAW dependency 'DTC' (data)
arch/ia64/kernel/ivt.S:686: Warning: Only the first path encountering the conflict is reported
arch/ia64/kernel/ivt.S:679: Warning: This is the location of the conflicting usage
{standard input}:1324: Warning: Use of 'ld4' violates RAW dependency 'DTC' (data)
{standard input}:1324: Warning: Only the first path encountering the conflict is reported
{standard input}:1307: Warning: This is the location of the conflicting usage
{standard input}:1330: Warning: Use of 'st4' violates RAW dependency 'DTC' (data)
{standard input}:1330: Warning: Only the first path encountering the conflict is reported
{standard input}:1307: Warning: This is the location of the conflicting usage
{standard input}:18817: Warning: Use of 'ld8' may violate RAW dependency 'DBR#' (data)
{standard input}:18817: Warning: Use of 'ld8' may violate RAW dependency 'DBR#' (data)
{standard input}:18817: Warning: Use of 'ld8' may violate RAW dependency 'DBR#' (data)
{standard input}:18817: Warning: Use of 'ld8' may violate RAW dependency 'DBR#' (data)
{standard input}:18817: Warning: Use of 'ld8' may violate RAW dependency 'DBR#' (data)
{standard input}:18824: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:18824: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:18824: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:18824: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:18824: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:19060: Warning: Use of 'ld4.a' may violate RAW dependency 'DBR#' (data)
{standard input}:19060: Warning: Use of 'ld4.a' may violate RAW dependency 'DBR#' (data)
{standard input}:19060: Warning: Use of 'ld4.a' may violate RAW dependency 'DBR#' (data)
{standard input}:19070: Warning: Use of 'st8' may violate RAW dependency 'DBR#' (data)
{standard input}:19070: Warning: Use of 'st8' may violate RAW dependency 'DBR#' (data)
{standard input}:19070: Warning: Use of 'st8' may violate RAW dependency 'DBR#' (data)
{standard input}:19091: Warning: Use of 'ld8.mov' may violate RAW dependency 'DBR#' (data)
{standard input}:19091: Warning: Use of 'ld8.mov' may violate RAW dependency 'DBR#' (data)
{standard input}:19091: Warning: Use of 'ld8.mov' may violate RAW dependency 'DBR#' (data)
{standard input}:19092: Warning: Use of 'ld8.mov' may violate RAW dependency 'DBR#' (data)
{standard input}:19092: Warning: Use of 'ld8.mov' may violate RAW dependency 'DBR#' (data)
{standard input}:19092: Warning: Use of 'ld8.mov' may violate RAW dependency 'DBR#' (data)
{standard input}:19097: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:19097: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:19097: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:19100: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:19100: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:19100: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:18817: Warning: Use of 'ld8' may violate RAW dependency 'DBR#' (data)
{standard input}:18817: Warning: Use of 'ld8' may violate RAW dependency 'DBR#' (data)
{standard input}:18817: Warning: Use of 'ld8' may violate RAW dependency 'DBR#' (data)
{standard input}:18817: Warning: Use of 'ld8' may violate RAW dependency 'DBR#' (data)
{standard input}:18817: Warning: Use of 'ld8' may violate RAW dependency 'DBR#' (data)
{standard input}:18824: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:18824: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:18824: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:18824: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:18824: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:19060: Warning: Use of 'ld4.a' may violate RAW dependency 'DBR#' (data)
{standard input}:19060: Warning: Use of 'ld4.a' may violate RAW dependency 'DBR#' (data)
{standard input}:19060: Warning: Use of 'ld4.a' may violate RAW dependency 'DBR#' (data)
{standard input}:19070: Warning: Use of 'st8' may violate RAW dependency 'DBR#' (data)
{standard input}:19070: Warning: Use of 'st8' may violate RAW dependency 'DBR#' (data)
{standard input}:19070: Warning: Use of 'st8' may violate RAW dependency 'DBR#' (data)
{standard input}:19091: Warning: Use of 'ld8.mov' may violate RAW dependency 'DBR#' (data)
{standard input}:19091: Warning: Use of 'ld8.mov' may violate RAW dependency 'DBR#' (data)
{standard input}:19091: Warning: Use of 'ld8.mov' may violate RAW dependency 'DBR#' (data)
{standard input}:19092: Warning: Use of 'ld8.mov' may violate RAW dependency 'DBR#' (data)
{standard input}:19092: Warning: Use of 'ld8.mov' may violate RAW dependency 'DBR#' (data)
{standard input}:19092: Warning: Use of 'ld8.mov' may violate RAW dependency 'DBR#' (data)
{standard input}:19097: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:19097: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:19097: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:19100: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:19100: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
{standard input}:19100: Warning: Use of 'ld4' may violate RAW dependency 'DBR#' (data)
arch/powerpc/mm/mmu_context_hash64.c:35:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/misc/cb710/core.c:302:16: warning: unused variable 'flags' [-Wunused-variable]
include/linux/compiler.h:145:13: warning: 'error' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/gpu/drm/nouveau/nouveau_bo.c:201:83: sparse: Expected ; at end of declaration
drivers/gpu/drm/nouveau/nouveau_bo.c:201:83: sparse: got )

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
