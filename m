From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 13 Jun 2013 18:22:22 +0000
Subject: build regressions 2013-06-13
Message-Id: <51ba0dde.OneePa22WxnfAfnY%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/mfd/ti_am335x_tscadc.c:110:2: error: 'prop' undeclared (first use in this function)
drivers/mfd/ti_am335x_tscadc.c:110:2: error: 'cur' undeclared (first use in this function)
ngene-cards.c:(.text+0x159693): undefined reference to `dvb_pll_attach'
sound/soc/spear/spdif_out.c:302:5: error: too many arguments to function 'devm_request_and_ioremap'
drivers/base/dmabuf-sync.c:78:3: error: 'sync_debugfs_timeout_cnt' undeclared (first use in this function)
arch/s390/kernel/irq.c:315:6: error: expected identifier or '(' before '__asm__'
ERROR: "__jbd2_debug" [fs/ext4/ext4.ko] undefined!
x86_pkg_temp_thermal.c:(.init.text+0xee0e): undefined reference to `platform_thermal_package_notify'
x86_pkg_temp_thermal.c:(.init.text+0xee1c): undefined reference to `platform_thermal_package_rate_control'
x86_pkg_temp_thermal.c:(.init.text+0xefa7): undefined reference to `platform_thermal_package_notify'
x86_pkg_temp_thermal.c:(.init.text+0xefb2): undefined reference to `platform_thermal_package_rate_control'
x86_pkg_temp_thermal.c:(.exit.text+0x18cf): undefined reference to `platform_thermal_package_notify'
x86_pkg_temp_thermal.c:(.exit.text+0x18da): undefined reference to `platform_thermal_package_rate_control'
drivers/gpu/drm/i915/i915_gem.c:2287:1: error: expected expression before '<<' token
drivers/gpu/drm/i915/i915_gem.c:2292:1: error: expected expression before '=' token
drivers/gpu/drm/i915/i915_gem.c:2294:1: error: expected expression before '>>' token

[warnings]
sound/soc/spear/spdif_in.c:272:23: warning: unused variable 'host' [-Wunused-variable]
sound/soc/spear/spdif_out.c:334:24: warning: unused variable 'host' [-Wunused-variable]
Warning(include/linux/device.h:116): No description found for parameter 'lock_key'
Warning(drivers/acpi/scan.c): no structured comments found
fs/ext4/inode.c:3495:24: warning: unused variable 'mapping' [-Wunused-variable]
drivers/mfd/ti_am335x_tscadc.c:95:16: warning: unused variable 'cur' [-Wunused-variable]
drivers/mfd/ti_am335x_tscadc.c:94:19: warning: unused variable 'prop' [-Wunused-variable]
drivers/mfd/ti_am335x_tscadc.c:110:2: warning: left-hand operand of comma expression has no effect [-Wunused-value]
drivers/iio/adc/ti_am335x_adc.c:190:17: warning: unused variable 'cur' [-Wunused-variable]
drivers/iio/adc/ti_am335x_adc.c:189:20: warning: unused variable 'prop' [-Wunused-variable]
drivers/media/platform/vsp1/vsp1_drv.c:309:5: warning: "CONFIG_PM_SLEEP" is not defined [-Wundef]
sound/soc/spear/spdif_out.c:302:5: warning: passing argument 2 of 'devm_request_and_ioremap' makes pointer from integer without a cast [enabled by default]
warning: (SND_SPEAR_EVM && SND_SPEAR1340_EVM) selects SND_DESIGNWARE_I2S which has unmet direct dependencies (SOUND && !M68K && !UML && SND && SND_SOC && CLKDEV_LOOKUP)
warning: (SND_SPEAR_EVM && SND_SPEAR1340_EVM) selects SND_DESIGNWARE_I2S which has unmet direct dependencies (SOUND && !M68K && !UML && SND && SND_SOC && CLKDEV_LOOKUP)
warning: (SND_SPEAR_EVM && SND_SPEAR1340_EVM) selects SND_DESIGNWARE_I2S which has unmet direct dependencies (SOUND && !M68K && !UML && SND && SND_SOC && CLKDEV_LOOKUP)
drivers/base/dmabuf-sync.c:53:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/base/dmabuf-sync.c:72:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/base/dmabuf-sync.c:75:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/base/dmabuf-sync.c:165:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/sh/clk/cpg.c:41:2: warning: passing argument 1 of 'ioread8' discards 'const' qualifier from pointer target type [enabled by default]
drivers/sh/clk/cpg.c:46:2: warning: passing argument 1 of 'ioread16' discards 'const' qualifier from pointer target type [enabled by default]
drivers/sh/clk/cpg.c:51:2: warning: passing argument 1 of 'ioread32' discards 'const' qualifier from pointer target type [enabled by default]
drivers/media/platform/vsp1/vsp1_drv.c:312:22: warning: unused variable 'vsp1' [-Wunused-variable]
drivers/media/platform/vsp1/vsp1_drv.c:319:22: warning: unused variable 'vsp1' [-Wunused-variable]
fs/btrfs/delayed-inode.c:393:1: warning: control reaches end of non-void function [-Wreturn-type]

[sparse]
sound/soc/soc-fw.c:1258:44: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:374:20: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:375:21: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:376:44: sparse: incorrect type in argument 3 (different base types)
sound/soc/soc-fw.c:424:27: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:426:25: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:427:26: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:428:27: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:429:28: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:432:28: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:438:54: sparse: incorrect type in argument 1 (different base types)
sound/soc/soc-fw.c:442:62: sparse: incorrect type in argument 1 (different base types)
sound/soc/soc-fw.c:448:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:449:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:450:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:465:52: sparse: incorrect type in argument 3 (different base types)
sound/soc/soc-fw.c:497:49: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:501:27: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:528:15: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:531:33: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:535:43: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:574:27: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:576:25: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:577:26: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:578:29: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:579:29: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:580:25: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:581:26: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:585:25: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:620:54: sparse: incorrect type in argument 1 (different base types)
sound/soc/soc-fw.c:624:62: sparse: incorrect type in argument 1 (different base types)
sound/soc/soc-fw.c:629:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:630:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:631:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:668:69: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:677:29: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:678:25: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:689:57: sparse: incorrect type in argument 3 (different base types)
sound/soc/soc-fw.c:698:56: sparse: incorrect type in argument 3 (different base types)
sound/soc/soc-fw.c:702:33: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:703:33: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:704:33: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:720:30: sparse: incorrect type in initializer (different base types)
sound/soc/soc-fw.c:723:71: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:730:70: sparse: incorrect type in argument 4 (different base types)
sound/soc/soc-fw.c:798:30: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:800:25: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:801:26: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:802:27: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:803:28: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:806:28: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:812:54: sparse: incorrect type in argument 1 (different base types)
sound/soc/soc-fw.c:816:62: sparse: incorrect type in argument 1 (different base types)
sound/soc/soc-fw.c:822:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:823:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:824:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:877:20: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:879:17: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:880:18: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:881:21: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:882:21: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:883:17: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:884:18: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:887:17: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:916:46: sparse: incorrect type in argument 1 (different base types)
sound/soc/soc-fw.c:920:54: sparse: incorrect type in argument 1 (different base types)
sound/soc/soc-fw.c:926:33: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:927:33: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:928:33: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:947:27: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:974:19: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:984:22: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:985:21: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:1000:17: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1010:38: sparse: incorrect type in assignment (different base types)
sound/soc/soc-fw.c:1041:25: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1042:25: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1043:25: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1068:35: sparse: incorrect type in initializer (different base types)
sound/soc/soc-fw.c:1076:70: sparse: incorrect type in argument 4 (different base types)
sound/soc/soc-fw.c:1129:17: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1133:54: sparse: incorrect type in argument 3 (different base types)
sound/soc/soc-fw.c:1142:25: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1154:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1173:16: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1173:27: sparse: restricted __be32 degrades to integer
sound/soc/soc-fw.c:1181:16: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1189:16: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1203:29: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1216:20: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1216:20: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1216:20: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1216:20: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1216:20: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/renesas/sh_eth.c:482:37: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:483:37: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:487:33: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:492:37: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:493:37: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:870:28: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:870:41: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:876:29: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:876:44: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:882:26: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:808:24: sparse: cast to restricted __le32
drivers/net/ethernet/renesas/sh_eth.c:810:24: sparse: cast to restricted __be32
drivers/net/ethernet/renesas/sh_eth.c:810:24: sparse: cast to restricted __be32
drivers/net/ethernet/renesas/sh_eth.c:810:24: sparse: cast to restricted __be32
drivers/net/ethernet/renesas/sh_eth.c:810:24: sparse: cast to restricted __be32
drivers/net/ethernet/renesas/sh_eth.c:810:24: sparse: cast to restricted __be32
drivers/net/ethernet/renesas/sh_eth.c:810:24: sparse: cast to restricted __be32
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2034:24: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2035:62: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2049:24: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2050:37: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2079:24: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2084:28: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2095:24: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2100:28: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces)
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces)
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces)
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2415:23: sparse: incorrect type in assignment (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2547:23: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2548:34: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2598:31: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2599:42: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:482:37: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:483:37: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:487:33: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:492:37: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:493:37: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:870:28: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:870:41: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:876:29: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:876:44: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:882:26: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:808:24: sparse: cast to restricted __le32
drivers/net/ethernet/renesas/sh_eth.c:810:24: sparse: cast to restricted __be32
drivers/net/ethernet/renesas/sh_eth.c:810:24: sparse: cast to restricted __be32
drivers/net/ethernet/renesas/sh_eth.c:810:24: sparse: cast to restricted __be32
drivers/net/ethernet/renesas/sh_eth.c:810:24: sparse: cast to restricted __be32
drivers/net/ethernet/renesas/sh_eth.c:810:24: sparse: cast to restricted __be32
drivers/net/ethernet/renesas/sh_eth.c:810:24: sparse: cast to restricted __be32
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2034:24: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2035:62: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2049:24: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2050:37: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2079:24: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2084:28: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2095:24: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2100:28: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces)
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces)
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces)
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2415:23: sparse: incorrect type in assignment (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2547:23: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2548:34: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2598:31: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2599:42: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/macvtap.c:100:9: sparse: incorrect type in assignment (different address spaces)
net/ipv4/igmp.c:1222:25: sparse: cast from restricted __be32
net/ipv4/igmp.c:1234:31: sparse: incorrect type in assignment (different address spaces)
net/ipv4/igmp.c:1250:31: sparse: incorrect type in assignment (different address spaces)
net/ipv4/igmp.c:2384:37: sparse: cast from restricted __be32
drivers/net/can/c_can/c_can_platform.c:205:32: sparse: incorrect type in argument 1 (different address spaces)
sound/soc/codecs/rt5640.c:975:9: sparse: Using plain integer as NULL pointer
sound/soc/codecs/rt5640.c:1917:24: sparse: symbol 'rt5640_aif_dai_ops' was not declared. Should it be static?
sound/soc/codecs/rt5640.c:1924:27: sparse: symbol 'rt5640_dai' was not declared. Should it be static?
sound/soc/codecs/rt5640.c:2079:19: sparse: symbol 'rt5640_i2c_driver' was not declared. Should it be static?
sound/soc/spear/spdif_in.c:77:14: sparse: restricted snd_pcm_format_t degrades to integer
sound/soc/spear/spdif_in.c:81:14: sparse: restricted snd_pcm_format_t degrades to integer
sound/soc/spear/spdif_out.c:301:65: sparse: incorrect type in argument 2 (different base types)
sound/soc/spear/spdif_out.c:301:49: sparse: too many arguments for function devm_request_and_ioremap
drivers/usb/phy/phy-rcar-usb.c:143:20: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/phy-rcar-usb.c:144:32: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/wireless/ath/ath9k/xmit.c:2161:16: sparse: restricted __le16 degrades to integer
drivers/net/wireless/ath/ath9k/xmit.c:2162:36: sparse: invalid assignment: &drivers/ssbi/ssbi.c:279:24: sparse: incorrect type in argument 1 (different address spaces)
drivers/ssbi/ssbi.c:280:36: sparse: incorrect type in argument 1 (different address spaces)
drivers/media/platform/vsp1/vsp1_drv.c:395:24: sparse: incorrect type in argument 1 (different address spaces)
drivers/media/platform/vsp1/vsp1_drv.c:397:36: sparse: incorrect type in argument 1 (different address spaces)

[coccinelle]
sound/soc/spear/spdif_out.c:301:17-41: ERROR: deprecated devm_request_and_ioremap() API used on line 301
fs/ext4/inode.c:3542:3-9: preceding lock on line 3511

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
