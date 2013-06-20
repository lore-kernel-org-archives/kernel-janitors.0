From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 20 Jun 2013 16:08:59 +0000
Subject: build regressions 2013-06-20
Message-Id: <51c3291b.DoOsUpmk4y1Ikv3C%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/mfd/menelaus.c:1200:2: error: too many arguments to function 'kzalloc'
include/net/ip_tunnels.h:155:3: error: implicit declaration of function '__ip_select_ident' [-Werror=implicit-function-declaration]
drivers/mfd/rtsx_pcr.c:1091:2: error: too many arguments to function 'kzalloc'
drivers/mfd/rtsx_pcr.c:1097:2: error: too many arguments to function 'kzalloc'
spi.c:(.text+0x19a76f): undefined reference to `crc_ccitt'
arch/mips/include/asm/fcntl.h:23:8: error: redefinition of 'struct flock'
include/linux/fmc.h:204:32: error: macro "writel" passed 3 arguments, but takes just 2
include/linux/kernel.h:783:27: error: dereferencing pointer to incomplete type
arch/x86/pci/xen.c:650:24: error: 'struct pci_dev' has no member named 'msi_list'
arch/x86/pci/xen.c:650:48: error: invalid use of undefined type 'struct msi_desc'
arch/x86/pci/xen.c:651:12: error: dereferencing pointer to incomplete type
arch/x86/pci/xen.c:653:13: error: dereferencing pointer to incomplete type
include/linux/list.h:419:45: error: dereferencing pointer to incomplete type
arch/x86/pci/xen.c:719:33: error: 'struct pci_dev' has no member named 'msi_list'
include/linux/list.h:419:45: error: dereferencing pointer to incomplete type
include/linux/list.h:419:45: error: dereferencing pointer to incomplete type
include/linux/list.h:420:11: error: dereferencing pointer to incomplete type
arch/x86/pci/xen.c:719:33: error: 'struct pci_dev' has no member named 'msi_list'
include/linux/list.h:421:49: error: dereferencing pointer to incomplete type
include/linux/list.h:421:27: error: dereferencing pointer to incomplete type
include/linux/list.h:421:49: error: dereferencing pointer to incomplete type
include/linux/list.h:421:49: error: dereferencing pointer to incomplete type
arch/x86/pci/xen.c:720:8: error: dereferencing pointer to incomplete type

[warnings]
drivers/mfd/menelaus.c:1200:2: warning: passing argument 1 of 'kzalloc' makes integer from pointer without a cast [enabled by default]
Warning(kernel/wait.c:374): No description found for parameter 'p'
Warning(kernel/wait.c:374): Excess function parameter 'word' description in 'wake_up_atomic_t'
Warning(kernel/wait.c:374): Excess function parameter 'bit' description in 'wake_up_atomic_t'
Warning(drivers/base/platform.c:528): No description found for parameter 'owner'
Warning(kernel/sys.c): no structured comments found
drivers/mfd/rtsx_pcr.c:1091:2: warning: passing argument 1 of 'kzalloc' makes integer from pointer without a cast [enabled by default]
drivers/mfd/rtsx_pcr.c:1097:2: warning: passing argument 1 of 'kzalloc' makes integer from pointer without a cast [enabled by default]
drivers/mfd/sm501.c:1581:39: warning: passing argument 1 of 'devm_kzalloc' from incompatible pointer type [enabled by default]

[sparse]
kernel/futex.c:1781:13: sparse: context imbalance in 'futex_wait_queue_me' - unexpected unlock
drivers/acpi/osl.c:119:1: sparse: symbol 'acpi_mutex_region' was not declared. Should it be static?
kernel/cgroup_freezer.c:277:9: sparse: incompatible types in comparison expression (different address spaces)
kernel/cpuset.c:451:9: sparse: incompatible types in comparison expression (different address spaces)
kernel/cpuset.c:472:9: sparse: incompatible types in comparison expression (different address spaces)
kernel/cpuset.c:1907:9: sparse: incompatible types in comparison expression (different address spaces)
drivers/gpu/drm/nouveau/nouveau_bo.c:304:55: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/nouveau/nouveau_bo.c:345:55: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/nouveau/nouveau_bo.c:378:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/nouveau/nouveau_gem.c:79:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/nouveau/nouveau_gem.c:151:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/nouveau/nouveau_display.c:469:64: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/nouveau/nouveau_display.c:474:72: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/qxl/qxl_object.h:34:60: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/qxl/qxl_object.h:34:60: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/qxl/qxl_object.h:34:60: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/qxl/qxl_object.h:34:60: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/qxl/qxl_object.h:34:60: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/qxl/qxl_object.h:34:60: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/qxl/qxl_object.h:34:60: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/qxl/qxl_object.h:34:60: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/qxl/qxl_object.h:34:60: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/qxl/qxl_object.h:34:60: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.c:609:60: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.c:636:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/ttm/ttm_bo_vm.c:97:53: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/ttm/ttm_bo_vm.c:361:56: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/ttm/ttm_bo_vm.c:430:56: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/ttm/ttm_bo.c:1877:68: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/ttm/ttm_bo.c:584:60: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/ttm/ttm_bo.c:677:68: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/ttm/ttm_bo.c:741:71: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/ttm/ttm_bo.c:745:59: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/ttm/ttm_bo.c:896:68: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/ttm/ttm_bo.c:1842:56: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:138:65: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:344:54: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:123:57: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/vmwgfx/vmwgfx_dmabuf.c:65:63: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/vmwgfx/vmwgfx_dmabuf.c:110:63: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/vmwgfx/vmwgfx_dmabuf.c:218:63: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/ast/ast_drv.h:355:61: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/ast/ast_drv.h:355:61: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/ast/ast_drv.h:355:61: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/ast/ast_drv.h:355:61: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/ast/ast_drv.h:355:61: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/cirrus/cirrus_drv.h:248:61: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/cirrus/cirrus_drv.h:248:61: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/cirrus/cirrus_drv.h:248:61: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/mgag200/mgag200_drv.h:270:61: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/mgag200/mgag200_drv.h:270:61: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/mgag200/mgag200_drv.h:270:61: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/nouveau/core/engine/copy/fuc/nva3.fuc.h:1:10: sparse: symbol 'nva3_pcopy_data' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/copy/fuc/nva3.fuc.h:186:10: sparse: symbol 'nva3_pcopy_code' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/copy/fuc/nvc0.fuc.h:1:10: sparse: symbol 'nvc0_pcopy_data' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/copy/fuc/nvc0.fuc.h:174:10: sparse: symbol 'nvc0_pcopy_code' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/crypt/fuc/nv98.fuc.h:1:10: sparse: symbol 'nv98_pcrypt_data' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/crypt/fuc/nv98.fuc.h:153:10: sparse: symbol 'nv98_pcrypt_code' was not declared. Should it be static?
drivers/gpu/drm/radeon/radeon_prime.c:99:6: sparse: symbol 'radeon_gem_prime_unpin' was not declared. Should it be static?
drivers/gpu/drm/radeon/radeon_prime.c:113:27: sparse: symbol 'radeon_gem_prime_res_obj' was not declared. Should it be static?
drivers/nfc/nfcsim.c:63:25: sparse: symbol 'wq' was not declared. Should it be static?
drivers/gpu/drm/drm_fops.c:428:5: sparse: symbol 'drm_file_fini' was not declared. Should it be static?

[coccinelle]
drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:618:2-3: Unneeded semicolon

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
