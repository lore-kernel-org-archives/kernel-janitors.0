From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 17 Apr 2013 16:37:39 +0000
Subject: build regressions 2013-04-17
Message-Id: <516ecfd3.xNpNLeG9rsL12BNm%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
fs/efivarfs/super.c:138:2: error: implicit declaration of function 'utf16_strlen' [-Werror=implicit-function-declaration]
arch/powerpc/kvm/mpic.c:116:41: error: 'struct thread_struct' has no member named 'kvm_vcpu'
arch/powerpc/kvm/../../../virt/kvm/eventfd.c:390:11: error: 'struct kvm' has no member named 'irq_routing'
arch/powerpc/kvm/../../../virt/kvm/eventfd.c:390:11: error: 'struct kvm' has no member named 'irq_routing'
arch/powerpc/kvm/../../../virt/kvm/eventfd.c:490:1: error: redefinition of 'kvm_irqfd'
arch/powerpc/kvm/../../../virt/kvm/eventfd.c:506:1: error: redefinition of 'kvm_irqfd_release'
arch/powerpc/kvm/../../../virt/kvm/eventfd.c:536:2: error: 'struct kvm' has no member named 'irq_routing'
arch/powerpc/kvm/irq.h:10:18: error: 'struct kvm_arch' has no member named 'mpic'
mm/memory.c:2439:2: error: implicit declaration of function 'io_remap_pfn_range' [-Werror=implicit-function-declaration]
relocs_64.c:(.text.startup+0x0): multiple definition of `main'
arch/x86/tools/relocs_32.o:relocs_32.c:(.text.startup+0x0): first defined here
relocs_common.c:(.text.startup+0x0): multiple definition of `main'
arch/x86/tools/relocs_32.o:relocs_32.c:(.text.startup+0x0): first defined here
relocs_common.c:(.text.startup+0x128): undefined reference to `process_32'
relocs_common.c:(.text.startup+0x174): undefined reference to `process_64'
collect2: error: ld returned 1 exit status
drivers/firmware/efi/vars.c:94:2: error: implicit declaration of function 'utf16_strnlen' [-Werror=implicit-function-declaration]
drivers/firmware/efi/vars.c:117:2: error: implicit declaration of function 'utf16_strsize' [-Werror=implicit-function-declaration]
drivers/firmware/efi/efivars.c:410:2: error: implicit declaration of function 'utf16_strlen' [-Werror=implicit-function-declaration]
drivers/firmware/efi/efi-pstore.c:143:2: error: implicit declaration of function 'utf16_strlen' [-Werror=implicit-function-declaration]
drivers/firmware/efi/efi-pstore.c:150:2: error: implicit declaration of function 'utf16_strncmp' [-Werror=implicit-function-declaration]
drivers/firmware/google/gsmi.c:303:2: error: implicit declaration of function 'utf16_strnlen' [-Werror=implicit-function-declaration]
arch/x86/kvm/vmx.c:3950:3: error: 'apic' undeclared (first use in this function)
/opt/cross/bin/x86_64-linux-ld: cannot find drivers/pci/host/built-in.o: No such file or directory
drivers/net/ethernet/atheros/atlx/atl1.c:2888:2: error: implicit declaration of function 'atl1_suspend' [-Werror=implicit-function-declaration]

[warnings]
drivers/media/i2c/mt9p031.c:281:18: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
drivers/media/i2c/mt9p031.c:282:18: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
drivers/media/i2c/mt9p031.c:283:18: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
warning: (DRM_RADEON && DRM_I915 && DRM_GMA500 && DRM_TILCDC && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
warning: (DRM_RADEON && DRM_I915 && DRM_GMA500 && DRM_TILCDC && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
warning: (DRM_RADEON && DRM_I915 && DRM_GMA500 && DRM_TILCDC && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
arch/powerpc/kvm/mpic.c:242:3: warning: format '%d' expects argument of type 'int', but argument 4 has type 'long int' [-Wformat]
arch/powerpc/kvm/mpic.c:260:3: warning: format '%d' expects argument of type 'int', but argument 4 has type 'long int' [-Wformat]

[sparse]
drivers/firmware/efi/efi.c:71:5: sparse: symbol 'generic_ops_register' was not declared. Should it be static?
drivers/firmware/efi/efi.c:81:6: sparse: symbol 'generic_ops_unregister' was not declared. Should it be static?
drivers/firmware/efi/vars.c:423:33: sparse: context imbalance in 'efivar_init' - different lock contexts for basic block
drivers/firmware/efi/vars.c:492:9: sparse: context imbalance in 'efivar_entry_list_del_unlock' - unexpected unlock
drivers/firmware/efi/vars.c:539:5: sparse: context imbalance in 'efivar_entry_delete' - wrong count at exit
drivers/firmware/efi/vars.c:623:5: sparse: context imbalance in 'efivar_entry_set_safe' - different lock contexts for basic block
drivers/firmware/efi/vars.c:794:5: sparse: context imbalance in 'efivar_entry_set_get_size' - different lock contexts for basic block
drivers/firmware/efi/vars.c:874:6: sparse: context imbalance in 'efivar_entry_iter_begin' - wrong count at exit
drivers/firmware/efi/vars.c:885:6: sparse: context imbalance in 'efivar_entry_iter_end' - unexpected unlock
drivers/firmware/efi/efivars.c:228:66: sparse: Using plain integer as NULL pointer
drivers/firmware/efi/efivars.c:568:6: sparse: symbol 'efivars_sysfs_exit' was not declared. Should it be static?
fs/nfsd/nfs4state.c:180:6: sparse: symbol 'put_client_renew_locked' was not declared. Should it be static?
include/trace/events/kvm.h:143:1: sparse: directive in argument list
include/trace/events/kvm.h:147:1: sparse: directive in argument list
include/trace/events/kvm.h:149:1: sparse: directive in argument list
include/trace/events/kvm.h:143:1: sparse: directive in argument list
include/trace/events/kvm.h:147:1: sparse: directive in argument list
include/trace/events/kvm.h:149:1: sparse: directive in argument list
include/trace/events/kvm.h:143:1: sparse: directive in argument list
include/trace/events/kvm.h:147:1: sparse: directive in argument list
include/trace/events/kvm.h:149:1: sparse: directive in argument list
include/trace/events/kvm.h:143:1: sparse: directive in argument list
include/trace/events/kvm.h:147:1: sparse: directive in argument list
include/trace/events/kvm.h:149:1: sparse: directive in argument list
include/trace/events/kvm.h:143:1: sparse: directive in argument list
include/trace/events/kvm.h:147:1: sparse: directive in argument list
include/trace/events/kvm.h:149:1: sparse: directive in argument list
include/trace/events/kvm.h:143:1: sparse: directive in argument list
include/trace/events/kvm.h:147:1: sparse: directive in argument list
include/trace/events/kvm.h:149:1: sparse: directive in argument list
include/trace/events/kvm.h:143:1: sparse: directive in argument list
include/trace/events/kvm.h:147:1: sparse: directive in argument list
include/trace/events/kvm.h:149:1: sparse: directive in argument list
include/trace/events/kvm.h:143:1: sparse: directive in argument list
include/trace/events/kvm.h:147:1: sparse: directive in argument list
include/trace/events/kvm.h:149:1: sparse: directive in argument list
include/trace/events/kvm.h:143:1: sparse: directive in argument list
include/trace/events/kvm.h:147:1: sparse: directive in argument list
include/trace/events/kvm.h:149:1: sparse: directive in argument list
include/trace/events/kvm.h:143:1: sparse: directive in argument list
include/trace/events/kvm.h:147:1: sparse: directive in argument list
include/trace/events/kvm.h:149:1: sparse: directive in argument list
include/trace/events/kvm.h:143:1: sparse: directive in argument list
include/trace/events/kvm.h:147:1: sparse: directive in argument list
include/trace/events/kvm.h:149:1: sparse: directive in argument list
include/trace/events/kvm.h:143:1: sparse: directive in argument list
include/trace/events/kvm.h:147:1: sparse: directive in argument list
include/trace/events/kvm.h:149:1: sparse: directive in argument list
include/trace/events/kvm.h:143:1: sparse: directive in argument list
include/trace/events/kvm.h:147:1: sparse: directive in argument list
include/trace/events/kvm.h:149:1: sparse: directive in argument list
drivers/gpu/drm/radeon/radeon_uvd.c:417:27: sparse: constant 0xFFFFFFFFF0000000 is so big it is unsigned long
drivers/gpu/drm/radeon/radeon_uvd.c:428:22: sparse: constant 0xFFFFFFFFF0000000 is so big it is unsigned long
drivers/gpu/drm/radeon/radeon_uvd.c:428:52: sparse: constant 0xFFFFFFFFF0000000 is so big it is unsigned long
drivers/firmware/efi/vars.c:94:19: sparse: undefined identifier 'utf16_strnlen'
drivers/firmware/efi/vars.c:117:22: sparse: undefined identifier 'utf16_strsize'
drivers/firmware/efi/efivars.c:410:30: sparse: undefined identifier 'utf16_strlen'
drivers/firmware/efi/efi-pstore.c:143:35: sparse: undefined identifier 'utf16_strlen'
drivers/firmware/efi/efi-pstore.c:150:13: sparse: undefined identifier 'utf16_strncmp'
drivers/firmware/google/gsmi.c:303:27: sparse: undefined identifier 'utf16_strnlen'
fs/efivarfs/super.c:138:15: sparse: undefined identifier 'utf16_strlen'
drivers/gpu/drm/radeon/radeon_drv.c:166:5: sparse: symbol 'radeon_fastfb' was not declared. Should it be static?
drivers/net/ethernet/mellanox/mlx4/srq.c:302:17: sparse: symbol 'mlx4_srq_lookup' was not declared. Should it be static?
arch/x86/kernel/irq.c:235:6: sparse: symbol 'smp_kvm_posted_intr_ipi' was not declared. Should it be static?

[coccinelle]
sound/pci/hda/hda_codec.c:1758:2-8: preceding lock on line 1770
sound/pci/hda/hda_codec.c:1758:2-8: preceding lock on line 1770
sound/pci/hda/hda_generic.c:2290:3-9: code aligned with following code on line 2291
sound/pci/hda/hda_generic.c:2290:3-9: code aligned with following code on line 2291

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
