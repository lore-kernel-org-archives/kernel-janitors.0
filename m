From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 12 Jan 2013 21:35:35 +0000
Subject: build regressions 2013-01-12
Message-Id: <50f1d727.cUHAu8+k9jxkI22j%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/linux/acpi.h:544:46: error: unknown type name 'acpi_handle'
drivers/net/wireless/libertas/cfg.c:2167:30: error: 'lbs_reg_notifier' undeclared (first use in this function)
include/linux/acpi.h:544: error: expected ')' before 'handle'
ERROR: "snd_soc_dapm_sync" [drivers/regulator/arizona-micsupp.ko] undefined!
ERROR: "snd_soc_dapm_disable_pin" [drivers/regulator/arizona-micsupp.ko] undefined!
ERROR: "snd_soc_dapm_force_enable_pin" [drivers/regulator/arizona-micsupp.ko] undefined!
max1363.c:(.text+0x30b014): undefined reference to `iio_triggered_buffer_cleanup'
max1363.c:(.text+0x30b3b9): undefined reference to `iio_triggered_buffer_setup'
initramfs.c:(.init.text+0x22c1): undefined reference to `__initramfs_size'
cpufreq.c:(.text+0x14b07a): undefined reference to `cpufreq_frequency_table_update_policy_cpu'
drivers/cpufreq/cpufreq.c:881:2: error: 'sibling' undeclared (first use in this function)
arizona-micsupp.c:(.text+0x9e983): undefined reference to `snd_soc_dapm_force_enable_pin'
arizona-micsupp.c:(.text+0x9e9a2): undefined reference to `snd_soc_dapm_disable_pin'
arizona-micsupp.c:(.text+0x9e9b1): undefined reference to `snd_soc_dapm_sync'

[warnings]
drivers/cpufreq/cpufreq.c:812: warning: 'cpufreq_add_policy_cpu' defined but not used
drivers/cpufreq/cpufreq.c:881:2: warning: left-hand operand of comma expression has no effect [-Wunused-value]

[sparse]
include/acpi/actbl3.h:526:35: sparse: expected ; at end of declaration
drivers/usb/misc/usb3503.c:181:5: sparse: symbol 'usb3503_probe' was not declared. Should it be static?
drivers/acpi/power.c:104:28: sparse: symbol 'acpi_power_get_context' was not declared. Should it be static?
drivers/md/persistent-data/dm-transaction-manager.c:28:9: sparse: preprocessor token HASH_SIZE redefined
drivers/block/mtip32xx/mtip32xx.c:4029:1: sparse: symbol 'mtip_workq_sdbf0' was not declared. Should it be static?
drivers/block/mtip32xx/mtip32xx.c:4030:1: sparse: symbol 'mtip_workq_sdbf1' was not declared. Should it be static?
drivers/block/mtip32xx/mtip32xx.c:4031:1: sparse: symbol 'mtip_workq_sdbf2' was not declared. Should it be static?
drivers/block/mtip32xx/mtip32xx.c:4032:1: sparse: symbol 'mtip_workq_sdbf3' was not declared. Should it be static?
drivers/block/mtip32xx/mtip32xx.c:4033:1: sparse: symbol 'mtip_workq_sdbf4' was not declared. Should it be static?
drivers/block/mtip32xx/mtip32xx.c:4034:1: sparse: symbol 'mtip_workq_sdbf5' was not declared. Should it be static?
drivers/block/mtip32xx/mtip32xx.c:4035:1: sparse: symbol 'mtip_workq_sdbf6' was not declared. Should it be static?
drivers/block/mtip32xx/mtip32xx.c:4036:1: sparse: symbol 'mtip_workq_sdbf7' was not declared. Should it be static?
drivers/block/mtip32xx/mtip32xx.c:1726:5: sparse: symbol 'mtip_send_trim' was not declared. Should it be static?
security/integrity/digsig.c:52:47: sparse: incorrect type in argument 1 (different base types)
drivers/net/wireless/libertas/cfg.c:2167:37: sparse: undefined identifier 'lbs_reg_notifier'

[smatch]
sound/pci/hda/hda_codec.c:3433 snd_hda_codec_write_cache() error: we previously assumed 'c' could be null (see line 3430)
sound/pci/hda/hda_generic.c:1529 indep_hp_put() warn: inconsistent returns mutex:&spec->pcm_mutex: locked (1526) unlocked (1517,1529)
sound/pci/hda/hda_hwdep.c:487 parse_hints() warn: inconsistent returns mutex:&codec->user_mutex: locked (478) unlocked (447,449,452,457,487)
drivers/usb/misc/usb3503.c:238 usb3503_probe() error: we previously assumed 'pdata' could be null (see line 196)
sound/soc/soc-dapm.c:3043 snd_soc_dapm_new_control() warn: maybe use && instead of &

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
