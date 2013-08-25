From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 25 Aug 2013 01:08:18 +0000
Subject: build regressions 2013-08-24
Message-Id: <52195902.0WhnbIhon47cKI+v%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
sound/soc/codecs/rt5640.c:735:2: error: implicit declaration of function 'SOC_DAPM_SINGLE_AUTODISABLE' [-Werror=implicit-function-declaration]
sound/soc/codecs/rt5640.c:736:3: error: invalid initializer
sound/soc/codecs/rt5640.c:740:3: error: invalid initializer
sound/soc/codecs/rt5640.c:744:3: error: invalid initializer
sound/soc/codecs/rt5640.c:748:3: error: invalid initializer
drivers/gpu/drm/i915/intel_sprite.c:638:18: error: 'src' redeclared as different kind of symbol
actions.c:(.text+0xa5cb5): undefined reference to `crc32c'
actions.c:(.text+0xa5cd0): undefined reference to `crc32c'
actions.c:(.text+0xa5cf2): undefined reference to `crc32c'
actions.c:(.text+0xa5d21): undefined reference to `crc32c'
actions.c:(.text+0xa5d7d): undefined reference to `crc32c'
net/mac80211/debugfs_sta.c:463:3: error: implicit declaration of function 'debugfs_create_x64' [-Werror=implicit-function-declaration]
fs/btrfs/volumes.c:676:3: error: implicit declaration of function 'btrfs_alloc_device' [-Werror=implicit-function-declaration]
drivers/staging/dgnc/dgnc_driver.c:461:3: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
drivers/staging/dgnc/dgnc_driver.c:907:3: error: implicit declaration of function 'kmalloc' [-Werror=implicit-function-declaration]
ERROR: "__umoddi3" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
ERROR: "__udivdi3" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
security/integrity/ima/ima_dir.c:78:32: error: 'const struct file_operations' has no member named 'readdir'
security/integrity/ima/ima_dir.c:93:17: error: 'const struct file_operations' has no member named 'readdir'
security/integrity/ima/ima_dir.c:282:17: error: 'struct ima_digest_data' has no member named 'type'
security/integrity/ima/ima_dir.c:284:25: error: 'struct ima_digest_data' has no member named 'type'
net/openvswitch/actions.c:374:3: error: implicit declaration of function 'sctp_compute_cksum' [-Werror=implicit-function-declaration]
drivers/thermal/thermal_core.c:947:30: error: 'const struct thermal_zone_device' has no member named 'type'
drivers/thermal/thermal_core.c:993:25: error: 'struct thermal_zone_device' has no member named 'type'
drivers/thermal/thermal_core.c:1659:24: error: expected ')' before '{' token
drivers/thermal/thermal_core.c:1733:1: error: expected expression before '}' token
drivers/thermal/thermal_core.c:2009:0: error: unterminated argument list invoking macro "if"
drivers/thermal/thermal_core.c:1659:2: error: expected '(' at end of input
drivers/thermal/thermal_core.c:1659:2: error: expected declaration or statement at end of input

[warnings]
drivers/gpu/host1x/drm/dc.c:105:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/gpu/host1x/drm/dc.c:105:2: warning: (near initialization for 'tegra_plane_funcs.update_plane') [enabled by default]
Warning(drivers/pci/probe.c:168): No description found for parameter 'PCI_COMMAND_IO'
Warning(drivers/pci/probe.c:168): Excess function parameter 'dev' description in 'PCI_COMMAND_DECODE_ENABLE'
Warning(drivers/pci/probe.c:168): Excess function parameter 'type' description in 'PCI_COMMAND_DECODE_ENABLE'
Warning(drivers/pci/probe.c:168): Excess function parameter 'res' description in 'PCI_COMMAND_DECODE_ENABLE'
Warning(drivers/pci/probe.c:168): Excess function parameter 'pos' description in 'PCI_COMMAND_DECODE_ENABLE'
Warning(drivers/scsi/scsi_error.c:243): No description found for parameter 'sdev'
drivers/scsi/scsi_error.c:245:16: warning: unused variable 'flags' [-Wunused-variable]
fs/btrfs/volumes.c:676:14: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/staging/dgnc/dgnc_driver.c:907:13: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/block/aoe/aoedev.c:252:174: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/sh/clk/cpg.c:41:2: warning: passing argument 1 of 'ioread8' discards 'const' qualifier from pointer target type [enabled by default]
drivers/sh/clk/cpg.c:46:2: warning: passing argument 1 of 'ioread16' discards 'const' qualifier from pointer target type [enabled by default]
drivers/sh/clk/cpg.c:51:2: warning: passing argument 1 of 'ioread32' discards 'const' qualifier from pointer target type [enabled by default]
drivers/thermal/thermal_core.c:1621:6: warning: unused variable 'passive' [-Wunused-variable]
drivers/thermal/thermal_core.c:1620:6: warning: unused variable 'count' [-Wunused-variable]
drivers/thermal/thermal_core.c:1618:25: warning: unused variable 'trip_type' [-Wunused-variable]
include/linux/device.h:526:26: warning: 'dev_attr_emul_temp' defined but not used [-Wunused-variable]
include/linux/device.h:526:26: warning: 'dev_attr_passive' defined but not used [-Wunused-variable]
drivers/thermal/thermal_core.c:1733:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/device.h:526:26: warning: 'dev_attr_type' defined but not used [-Wunused-variable]
include/linux/device.h:526:26: warning: 'dev_attr_temp' defined but not used [-Wunused-variable]
include/linux/device.h:526:26: warning: 'dev_attr_mode' defined but not used [-Wunused-variable]
include/linux/device.h:526:26: warning: 'dev_attr_policy' defined but not used [-Wunused-variable]

[sparse]
drivers/scsi/ufs/ufshcd.c:367:25: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] length @@    got  short [unsigned] [usertype] length @@
drivers/scsi/ufs/ufshcd.c:368:24: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] value @@    got ed int [unsigned] [usertype] value @@
drivers/scsi/ufs/ufshcd.c:1135:5: sparse: symbol 'ufshcd_query_attr' was not declared. Should it be static?
fs/xfs/xfs_dir2_sf.c:133:1: sparse: symbol 'xfs_dir3_sfe_put_ino' was not declared. Should it be static?
sound/soc/codecs/rt5640.c:735:9: sparse: undefined identifier 'SOC_DAPM_SINGLE_AUTODISABLE'
net/openvswitch/actions.c:374:36: sparse: undefined identifier 'sctp_compute_cksum'

[coccinelle]
security/apparmor/apparmorfs.c:397:9-16: ERROR: PTR_ERR applied after initialization to constant on line 346
security/integrity/ima/ima_template.c:62:41-47: ERROR: application of sizeof to pointer

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
