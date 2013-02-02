From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 02 Feb 2013 16:15:35 +0000
Subject: build regressions 2013-02-02
Message-Id: <510d3ba7.aJlu3EvEOlR9PaPF%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/acpi/osl.c:629:29: error: 'max_low_pfn_mapped' undeclared (first use in this function)

[warnings]
drivers/mtd/chips/cfi_cmdset_0002.c:2280: warning: 'cfi_ppb_lock' defined but not used
drivers/mtd/chips/cfi_cmdset_0002.c:2286: warning: 'cfi_ppb_unlock' defined but not used
drivers/mtd/chips/cfi_cmdset_0002.c:2383: warning: 'cfi_ppb_is_locked' defined but not used
drivers/leds/leds-lp5521.c:318: warning: format '%d' expects type 'int', but argument 3 has type 'size_t'
drivers/leds/leds-lp5523.c:361: warning: format '%d' expects type 'int', but argument 3 has type 'size_t'
drivers/iio/adc/max1363.c:1487: warning: 'max1363_register_buffered_funcs_and_init' defined but not used
drivers/iio/adc/max1363.c:1522: warning: 'max1363_buffer_cleanup' defined but not used
net/wireless/nl80211.c:4016: warning: comparison is always false due to limited range of data type
net/wireless/nl80211.c:4019: warning: comparison is always false due to limited range of data type
net/wireless/nl80211.c:4022: warning: comparison is always false due to limited range of data type
net/wireless/nl80211.c:4024: warning: comparison is always false due to limited range of data type
net/wireless/nl80211.c:4027: warning: comparison is always false due to limited range of data type
net/wireless/nl80211.c:4034: warning: comparison is always false due to limited range of data type
net/wireless/nl80211.c:4034: warning: comparison is always false due to limited range of data type
net/wireless/nl80211.c:4040: warning: comparison is always false due to limited range of data type
net/wireless/nl80211.c:4047: warning: comparison is always false due to limited range of data type
net/wireless/nl80211.c:4051: warning: comparison is always false due to limited range of data type
net/wireless/nl80211.c:4055: warning: comparison is always false due to limited range of data type
net/wireless/nl80211.c:4060: warning: comparison is always false due to limited range of data type
net/wireless/nl80211.c:4063: warning: comparison is always false due to limited range of data type
net/wireless/nl80211.c:4066: warning: comparison is always false due to limited range of data type
net/wireless/nl80211.c:4070: warning: comparison is always false due to limited range of data type
net/wireless/nl80211.c:4076: warning: comparison is always false due to limited range of data type
net/wireless/nl80211.c:4083: warning: comparison is always false due to limited range of data type
net/wireless/nl80211.c:4086: warning: comparison is always false due to limited range of data type
include/linux/iio/consumer.h:58:48: warning: 'struct device' declared inside parameter list [enabled by default]
include/linux/iio/consumer.h:58:48: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/iio/consumer.h:80:11: warning: 'struct device' declared inside parameter list [enabled by default]
drivers/scsi/aic7xxx_old.c:7901:5: warning: case value '257' not in enumerated type 'ahc_chip' [-Wswitch]
drivers/scsi/aic7xxx_old.c:7898:5: warning: case value '513' not in enumerated type 'ahc_chip' [-Wswitch]
drivers/scsi/aic7xxx_old.c:8517:5: warning: case value '257' not in enumerated type 'ahc_chip' [-Wswitch]
drivers/scsi/aic7xxx_old.c:8510:5: warning: case value '513' not in enumerated type 'ahc_chip' [-Wswitch]
drivers/scsi/advansys.c:71:2: warning: #warning this driver is still not properly converted to the DMA API [-Wcpp]
drivers/regulator/tps62360-regulator.c:384:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
arch/ia64/kernel/err_inject.c:75:1: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:89:2: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:90:2: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:94:6: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:94:6: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:94:6: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:120:2: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:121:2: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:126:1: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:134:2: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:149:3: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:158:1: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:170:4: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:170:4: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:170:4: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:186:4: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:186:4: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:186:4: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:191:4: warning: format '%lx' expects argument of type 'long unsigned int *', but argument 3 has type 'u64 *' [-Wformat]
arch/ia64/kernel/err_inject.c:191:4: warning: format '%lx' expects argument of type 'long unsigned int *', but argument 4 has type 'u64 *' [-Wformat]
arch/ia64/kernel/err_inject.c:191:4: warning: format '%lx' expects argument of type 'long unsigned int *', but argument 5 has type 'u64 *' [-Wformat]
arch/ia64/kernel/err_inject.c:198:1: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 's64' [-Wformat]
arch/ia64/kernel/err_inject.c:199:1: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat]
arch/ia64/kernel/err_inject.c:200:1: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat]
drivers/net/ethernet/amd/nmclan_cs.c:625:3: warning: 'pcmcia_request_exclusive_irq' is deprecated (declared at include/pcmcia/ds.h:201) [-Wdeprecated-declarations]
kernel/sched/core.c:3103:10: warning: unsupported argument to '__builtin_return_address' [enabled by default]
kernel/sched/core.c:3105:11: warning: unsupported argument to '__builtin_return_address' [enabled by default]
arch/ia64/kernel/cpufreq/acpi-cpufreq.c:53:3: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 's64' [-Wformat]
arch/ia64/kernel/cpufreq/acpi-cpufreq.c:75:3: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 's64' [-Wformat]
drivers/staging/bcm/CmHost.c:1414:39: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/bcm/CmHost.c:1453:37: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/bcm/CmHost.c:1467:35: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
arch/ia64/sn/kernel/bte.c:117:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
arch/ia64/sn/kernel/bte.c:125:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/isdn/hardware/mISDN/hfcpci.c:2298:2: warning: ignoring return value of 'driver_for_each_device', declared with attribute warn_unused_result [-Wunused-result]
drivers/isdn/hardware/mISDN/w6692.c:1180:2: warning: unsupported argument to '__builtin_return_address' [enabled by default]
drivers/isdn/hardware/mISDN/mISDNipac.c:759:2: warning: unsupported argument to '__builtin_return_address' [enabled by default]
drivers/staging/cxt1e1/functions.c:275:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/message/i2o/i2o_config.c:880:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/message/i2o/i2o_config.c:935:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
arch/ia64/sn/kernel/sn2/sn2_smp.c:319:1: warning: the frame size of 2176 bytes is larger than 2048 bytes [-Wframe-larger-than=]
drivers/net/wireless/ti/wlcore/spi.c:307:1: warning: the frame size of 2192 bytes is larger than 2048 bytes [-Wframe-larger-than=]
drivers/mtd/chips/cfi_cmdset_0020.c:654:1: warning: the frame size of 2192 bytes is larger than 2048 bytes [-Wframe-larger-than=]
drivers/scsi/mvsas/mv_sas.c:1157:34: warning: comparison between 'enum sas_device_type' and 'enum sas_dev_type' [-Wenum-compare]
drivers/scsi/mvsas/mv_sas.c:1160:39: warning: comparison between 'enum sas_device_type' and 'enum sas_dev_type' [-Wenum-compare]
drivers/staging/rtl8192u/r8192U_dm.c:1454:1: warning: the frame size of 3136 bytes is larger than 2048 bytes [-Wframe-larger-than=]
drivers/input/joystick/analog.c:175:2: warning: #warning Precise timer not defined for this architecture. [-Wcpp]
WARNING: arch/ia64/hp/common/built-in.o(.data+0xb0): Section mismatch in reference from the variable acpi_sba_ioc_driver to the function .init.text:acpi_sba_ioc_add()
drivers/mfd/tps65217.c:169:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
<stdin>:1181:2: warning: #warning syscall perf_event_open not implemented [-Wcpp]
<stdin>:1220:2: warning: #warning syscall kcmp not implemented [-Wcpp]
<stdin>:1181:2: warning: #warning syscall perf_event_open not implemented [-Wcpp]
<stdin>:1220:2: warning: #warning syscall kcmp not implemented [-Wcpp]
drivers/spi/spi-gpio.c:235:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/media/pci/ivtv/ivtv-driver.c:307:2: warning: 'flush_work_sync' is deprecated (declared at include/linux/workqueue.h:448) [-Wdeprecated-declarations]
include/linux/of_platform.h:107:13: warning: 'struct of_device_id' declared inside parameter list [enabled by default]
include/linux/of_platform.h:107:13: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/of_platform.h:107:13: warning: 'struct device_node' declared inside parameter list [enabled by default]
drivers/mtd/chips/cfi_cmdset_0002.c:504:22: warning: unused variable 'np' [-Wunused-variable]
drivers/md/persistent-data/dm-array.c:342:13: warning: 'ab' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpio/gpiolib-acpi.c:129:28: warning: ignoring return value of 'devm_request_threaded_irq', declared with attribute warn_unused_result [-Wunused-result]

[smatch]
drivers/net/wireless/iwlwifi/mvm/rs.c:2532 rs_get_rate() error: we previously assumed 'lq_sta' could be null (see line 2523)
drivers/net/wireless/iwlwifi/mvm/rs.c:2788 rs_fill_link_cmd() error: buffer overflow 'lq_cmd->rs_table' 16 <= 16
drivers/net/wireless/iwlwifi/pcie/trans.c:860 iwl_trans_pcie_grab_nic_access() warn: inconsistent returns spin_lock:&pcie_trans->reg_lock: locked (860) unlocked (851)
drivers/net/wireless/iwlwifi/pcie/trans.c:860 iwl_trans_pcie_grab_nic_access() warn: inconsistent returns irqsave:*flags: locked (860) unlocked (851)
drivers/leds/leds-pwm.c:83 led_pwm_create_of() error: potentially dereferencing uninitialized 'child'.

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
