From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 08 Feb 2013 17:13:24 +0000
Subject: build regressions 2013-02-08
Message-Id: <51153234.Q+gdasPiXJwzKemY%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/linux/mfd/da9055/core.h:1: error: stray '357' in program
include/linux/mfd/da9055/core.h:1: error: stray '273' in program
include/linux/mfd/da9055/core.h:1: error: stray '277' in program
include/linux/mfd/da9055/pdata.h:1: error: stray '357' in program
include/linux/mfd/da9055/pdata.h:1: error: stray '273' in program
include/linux/mfd/da9055/pdata.h:1: error: stray '277' in program
include/linux/mfd/da9055/reg.h:1: error: stray '357' in program
include/linux/mfd/da9055/reg.h:1: error: stray '273' in program
include/linux/mfd/da9055/reg.h:1: error: stray '277' in program
include/linux/mfd/da9055/core.h:1: error: stray '357' in program
include/linux/mfd/da9055/core.h:1: error: stray '273' in program
include/linux/mfd/da9055/core.h:1: error: stray '277' in program
drivers/cpufreq/intel_pstate.c:333:3: error: 'no_turbo' undeclared here (not in a function)
drivers/cpufreq/intel_pstate.c:334:3: error: 'max_perf_pct' undeclared here (not in a function)
drivers/cpufreq/intel_pstate.c:335:3: error: 'min_perf_pct' undeclared here (not in a function)
ERROR: "pm_vt_switch_unregister" [drivers/video/fb.ko] undefined!
ERROR: "pm_vt_switch_required" [drivers/video/fb.ko] undefined!
fbmem.c:(.text+0x1bfa0): undefined reference to `pm_vt_switch_unregister'
(.text+0x1c347): undefined reference to `pm_vt_switch_required'
drivers/gpu/drm/drm_pci.c:485:2: error: implicit declaration of function 'pcie_capability_read_dword' [-Werror=implicit-function-declaration]
drivers/net/ethernet/intel/igb/igb_main.c:6227:2: error: size of unnamed array is negative
drivers/gpio/gpio-adnp.c:272:6: error: 'struct gpio_chip' has no member named 'of_node'
drivers/gpio/gpio-adnp.c:484:43: error: 'struct gpio_chip' has no member named 'of_node'
drivers/hwmon/gpio-fan.c:633:21: error: 'of_gpio_fan_match' undeclared here (not in a function)
drivers/leds/leds-gpio.c:289:21: error: 'of_gpio_leds_match' undeclared here (not in a function)
drivers/base/regmap/regmap-debugfs.c:96:6: error: 'fpos_offset' undeclared (first use in this function)
drivers/base/regmap/regmap-debugfs.c:97:6: error: 'reg_offset' undeclared (first use in this function)
sound/pci/hda/hda_proc.c:666:5: error: implicit declaration of function 'kmalloc' [-Werror=implicit-function-declaration]
sound/pci/hda/hda_proc.c:748:3: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
sound/soc/soc-core.c:3553:22: error: 'const struct snd_soc_dai_ops' has no member named 'mute_stream'
sound/soc/soc-core.c:3554:26: error: 'const struct snd_soc_dai_ops' has no member named 'mute_stream'
ima_queue.c:(.text+0x0): multiple definition of `ima_get_hash_algo'
ima_init.c:(.text+0x0): multiple definition of `ima_get_hash_algo'
ima_main.c:(.text+0x0): multiple definition of `ima_get_hash_algo'
ima_crypto.c:(.text+0x60): multiple definition of `ima_get_hash_algo'
ima_api.c:(.text+0x0): multiple definition of `ima_get_hash_algo'
ima_policy.c:(.text+0x7f0): multiple definition of `ima_get_hash_algo'
ima_audit.c:(.text+0x0): multiple definition of `ima_get_hash_algo'
ERROR: "relay_file_operations" [drivers/net/wireless/ath/ath9k/ath9k.ko] undefined!
ERROR: "relay_switch_subbuf" [drivers/net/wireless/ath/ath9k/ath9k.ko] undefined!
ERROR: "relay_close" [drivers/net/wireless/ath/ath9k/ath9k.ko] undefined!
ERROR: "relay_open" [drivers/net/wireless/ath/ath9k/ath9k.ko] undefined!
drivers/tty/serial/8250/8250_early.c:160:18: error: 'BASE_BAUD' undeclared (first use in this function)

[warnings]
drivers/gpu/drm/drm_pci.c:496: warning: 'lnkcap' is used uninitialized in this function
drivers/gpu/drm/drm_pci.c:497: warning: 'lnkcap2' is used uninitialized in this function
drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c:4185: warning: format '%d' expects type 'int', but argument 4 has type 'size_t'
drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c:2040: warning: initialization from incompatible pointer type
drivers/usb/serial/usb_wwan.c:505: warning: comparison is always false due to limited range of data type
fs/exec.c:414:6: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
fs/splice.c:1556:11: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
sound/pci/asihpi/hpioctl.c:125:6: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
sound/pci/asihpi/hpioctl.c:126:6: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
net/atm/resources.c:223:8: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
net/atm/resources.c:274:7: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
mm/migrate.c:1242:8: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
sound/pci/rme9652/hdsp.c:5097:7: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
ipc/syscall.c:39:7: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/megaraid.c:3878:8: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/megaraid.c:3895:8: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/android/binder.c:1778:8: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/android/binder.c:1781:8: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/android/binder.c:1839:8: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/android/binder.c:1933:8: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/android/binder.c:2015:8: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/cpufreq/intel_pstate.c:328:1: warning: data definition has no type or storage class [enabled by default]
drivers/cpufreq/intel_pstate.c:328:1: warning: type defaults to 'int' in declaration of 'define_one_global_rw' [-Wimplicit-int]
drivers/cpufreq/intel_pstate.c:328:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/cpufreq/intel_pstate.c:329:1: warning: data definition has no type or storage class [enabled by default]
drivers/cpufreq/intel_pstate.c:329:1: warning: type defaults to 'int' in declaration of 'define_one_global_rw' [-Wimplicit-int]
drivers/cpufreq/intel_pstate.c:329:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/cpufreq/intel_pstate.c:330:1: warning: data definition has no type or storage class [enabled by default]
drivers/cpufreq/intel_pstate.c:330:1: warning: type defaults to 'int' in declaration of 'define_one_global_rw' [-Wimplicit-int]
drivers/cpufreq/intel_pstate.c:330:1: warning: parameter names (without types) in function declaration [enabled by default]
arch/microblaze/mm/pgtable.c:133:26: warning: comparison between pointer and integer [enabled by default]
WARNING: drivers/ata/built-in.o(.data+0x1098): Section mismatch in reference from the variable ahci_highbank_driver to the function .init.text:ata_parse_force_one()
drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c:1269:49: warning: initialization discards 'const' qualifier from pointer target type [enabled by default]
drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c:1522:27: warning: initialization discards 'const' qualifier from pointer target type [enabled by default]
drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c:1548:2: warning: passing argument 2 of 'client_s_crop' discards 'const' qualifier from pointer target type [enabled by default]
drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c:2040:2: warning: (near initialization for 'sh_mobile_ceu_host_ops.set_livecrop') [enabled by default]
sound/pci/hda/hda_proc.c:666:10: warning: assignment makes pointer from integer without a cast [enabled by default]
sound/soc/soc-core.c:3560:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/infiniband/ulp/isert/isert_core.c:357:5: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'uint64_t' [-Wformat]
drivers/infiniband/ulp/isert/isert_core.c:363:5: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'uint64_t' [-Wformat]
drivers/infiniband/ulp/isert/isert_core.c:746:2: warning: #warning FIXME: Proper SGL data offsets into se_cmd->t_data_sg [-Wcpp]
drivers/infiniband/ulp/isert/isert_core.c:750:4: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'dma_addr_t' [-Wformat]
drivers/infiniband/ulp/isert/isert_core.c:708:20: warning: unused variable 'dma_off' [-Wunused-variable]
drivers/infiniband/ulp/isert/isert_core.c:708:11: warning: unused variable 'dma_len' [-Wunused-variable]
drivers/infiniband/ulp/isert/isert_core.c:707:11: warning: unused variable 'dma_addr' [-Wunused-variable]
drivers/infiniband/ulp/isert/isert_verbs.c:280:2: warning: #warning FIXME: Find device context [-Wcpp]
sound/usb/pcm.c:463:45: warning: 'ep' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/video/goldfishfb.c:247:28: sparse: incorrect type in assignment (different address spaces)
drivers/video/goldfishfb.c:251:35: sparse: Using plain integer as NULL pointer
drivers/video/goldfishfb.c:279:9: sparse: incorrect type in argument 3 (different address spaces)
drivers/video/goldfishfb.c:299:9: sparse: incorrect type in argument 3 (different address spaces)
arch/x86/kernel/kprobes/core.c:335:26: sparse: no member 'kaddr' in struct insn
sound/pci/hda/hda_proc.c:666:40: sparse: undefined identifier 'kmalloc'
sound/pci/hda/hda_proc.c:748:17: sparse: undefined identifier 'kfree'
sound/soc/soc-core.c:3555:29: sparse: no member 'mute_stream' in struct snd_soc_dai_ops
drivers/gpu/drm/radeon/radeon_prime.c:31:17: sparse: symbol 'radeon_gem_prime_get_sg_table' was not declared. Should it be static?
drivers/gpu/drm/radeon/radeon_prime.c:39:6: sparse: symbol 'radeon_gem_prime_vmap' was not declared. Should it be static?
drivers/gpu/drm/radeon/radeon_prime.c:52:6: sparse: symbol 'radeon_gem_prime_vunmap' was not declared. Should it be static?
drivers/gpu/drm/radeon/radeon_prime.c:59:23: sparse: symbol 'radeon_gem_prime_import_sg_table' was not declared. Should it be static?
drivers/gpu/drm/radeon/radeon_prime.c:80:5: sparse: symbol 'radeon_gem_prime_pin' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
