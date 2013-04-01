From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 01 Apr 2013 16:05:23 +0000
Subject: build regressions 2013-04-01
Message-Id: <5159b043.iKcd5d5sPGfteRUk%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
(.text+0x129b70): undefined reference to `acpi_ut_get_expected_return_types'
(.text+0x129c2a): undefined reference to `acpi_ut_match_predefined_method'
(.text+0x55cbc): multiple definition of `device_reset'
drivers/reset/built-in.o:(.text+0x83): first defined here
sound/soc/soc-dapm.c:1191:2: error: implicit declaration of function 'dapm_clear_walk' [-Werror=implicit-function-declaration]
ERROR: "il_pm_ops" [drivers/net/wireless/iwlegacy/iwl3945.ko] undefined!
arch/powerpc/kernel/lparcfg.c:691:25: error: unused variable 'ent' [-Werror=unused-variable]
arch/powerpc/kernel/lparcfg.c:44:31: error: 'proc_ppc64_lparcfg' defined but not used [-Werror=unused-variable]

[warnings]
drivers/scsi/ips.c:2053:6: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'uint32_t' [-Wformat]
drivers/scsi/ips.c:2058:6: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'uint32_t' [-Wformat]
drivers/scsi/ips.c:2061:6: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'char *' [-Wformat]
drivers/reset/gpio-reset.c:187:28: warning: 'gpio_reset_dt_ids' defined but not used [-Wunused-variable]
drivers/media/usb/dvb-usb/m920x.c:90:3: warning: 'ret' may be used uninitialized in this function [-Wuninitialized]
drivers/net/wireless/brcm80211/brcmfmac/sdio_chip.c:265:15: warning: array subscript is above array bounds [-Warray-bounds]
drivers/net/wireless/brcm80211/brcmfmac/sdio_chip.c:179:3: warning: array subscript is above array bounds [-Warray-bounds]
drivers/net/wireless/brcm80211/brcmfmac/sdio_chip.c:302:4: warning: array subscript is above array bounds [-Warray-bounds]
drivers/net/wireless/brcm80211/brcmfmac/sdio_chip.c:307:5: warning: array subscript is above array bounds [-Warray-bounds]
drivers/platform/x86/intel_mid_thermal.c:220:43: warning: 'curr_temp' may be used uninitialized in this function [-Wmaybe-uninitialized]
Warning(include/linux/idr.h:113): No description found for parameter 'idr'
Warning(include/linux/idr.h:113): Excess function parameter 'idp' description in 'idr_find'
Warning(lib/idr.c:232): Excess function parameter 'id' description in 'sub_alloc'
Warning(lib/idr.c:232): Excess function parameter 'id' description in 'sub_alloc'
drivers/acpi/acpica/exoparg2.c:418:4: warning: format '%X' expects argument of type 'unsigned int', but argument 7 has type 'acpi_size' [-Wformat]

[sparse]
drivers/acpi/acpica/acpredef.h:207:34: sparse: symbol 'acpi_gbl_predefined_methods' was not declared. Should it be static?
drivers/acpi/acpica/acglobal.h:227:13: sparse: symbol 'acpi_gbl_reference_count_lock' was not declared. Should it be static?
drivers/reset/core.c:46:5: sparse: symbol 'of_reset_simple_xlate' was not declared. Should it be static?
drivers/reset/core.c:262:6: sparse: symbol 'devm_reset_control_put' was not declared. Should it be static?
sound/soc/soc-dapm.c:1191:9: sparse: undefined identifier 'dapm_clear_walk'

[coccinelle]
drivers/block/cciss.c:1532:7-14: WARNING opportunity for memdup_user
drivers/block/aoe/aoecmd.c:957:3-9: preceding lock on line 965
sound/soc/codecs/max98090.c:2243:7-27: ERROR: Threaded IRQ with no primary handler requested without IRQF_ONESHOT
sound/soc/codecs/tas5086.c:333:2-3: Unneeded semicolon

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
