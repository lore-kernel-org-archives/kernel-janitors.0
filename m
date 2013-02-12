From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 12 Feb 2013 16:05:45 +0000
Subject: build regressions 2013-02-12
Message-Id: <511a6859.CUSK8vdO04P1Fw1O%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/mmc/host/omap_hsmmc.c:1919:3: error: implicit declaration of function 'dma_request_slave_channel_compat' [-Werror=implicit-function-declaration]
arch/powerpc/oprofile/op_model_ps3.o:(.discard+0x0): multiple definition of `__pcpu_unique_pmc_values'
arch/powerpc/oprofile/op_model_cell.o:(.discard+0x0): first defined here
lib/percpu-rwlock.c:176:3: error: implicit declaration of function 'cpu_relax' [-Werror=implicit-function-declaration]
drivers/md/dm-integrity.c:837:17: error: arithmetic on pointer to an incomplete type
drivers/md/dm-integrity.c:837:3: error: arithmetic on pointer to an incomplete type
drivers/md/dm-integrity.c:837:17: error: arithmetic on pointer to an incomplete type
drivers/md/dm-integrity.c:837:3: error: arithmetic on pointer to an incomplete type
drivers/net/wireless/iwlwifi/dvm/mac80211.c:491:9: error: variable 'wakeup' has initializer but incomplete type
drivers/net/wireless/iwlwifi/dvm/mac80211.c:492:3: error: unknown field 'pattern_idx' specified in initializer
drivers/net/wireless/iwlwifi/dvm/mac80211.c:491:32: error: storage size of 'wakeup' isn't known
drivers/net/wireless/iwlwifi/dvm/mac80211.c:527:4: error: implicit declaration of function 'ieee80211_report_wowlan_wakeup' [-Werror=implicit-function-declaration]
drivers/xen/grant-table.c:53:26: fatal error: asm/mach/map.h: No such file or directory
drivers/xen/xenbus/xenbus_probe.c:55:26: fatal error: asm/mach/map.h: No such file or directory

[warnings]
drivers/mmc/host/omap_hsmmc.c:1918:16: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/mmc/host/omap_hsmmc.c:1928:16: warning: assignment makes pointer from integer without a cast [enabled by default]
WARNING: drivers/media/pci/ivtv/ivtv-alsa.o(.text+0x218): Section mismatch in reference from the function .snd_ivtv_init() to the function .init.text:.snd_ivtv_pcm_create()
WARNING: drivers/media/pci/cx18/cx18-alsa.o(.text+0x218): Section mismatch in reference from the function .snd_cx18_init() to the function .init.text:.snd_cx18_pcm_create()
drivers/mmc/host/sdhci.c:1998:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/mmc/host/sdhci.c:1998:2: warning: (near initialization for 'sdhci_ops.start_signal_voltage_switch') [enabled by default]
drivers/media/common/tuners/tda18212.c:248:2: warning: 'val' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/mfd/rc5t583-irq.c:276:20: warning: 'master_int' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/mfd/rc5t583.c:105:15: warning: 'sleepseq_val' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/regulator/core.c:2170:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
fs/namei.c:609:24: warning: 'cookie' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/namei.c:609:24: warning: 'cookie' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/namei.c:609:24: warning: 'cookie' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/wireless/iwlwifi/dvm/mac80211.c:492:3: warning: excess elements in struct initializer [enabled by default]
drivers/net/wireless/iwlwifi/dvm/mac80211.c:492:3: warning: (near initialization for 'wakeup') [enabled by default]
drivers/net/wireless/iwlwifi/dvm/mac80211.c:491:32: warning: unused variable 'wakeup' [-Wunused-variable]
drivers/mmc/host/sdhci.c:2593:2: warning: passing argument 2 of 'sdhci_do_start_signal_voltage_switch' makes integer from pointer without a cast [enabled by default]
warning: (HAVE_TEXT_POKE_SMP) selects STOP_MACHINE which has unmet direct dependencies (SMP && MODULE_UNLOAD)
warning: (HAVE_TEXT_POKE_SMP) selects STOP_MACHINE which has unmet direct dependencies (SMP && MODULE_UNLOAD)
warning: (HAVE_TEXT_POKE_SMP) selects STOP_MACHINE which has unmet direct dependencies (SMP && MODULE_UNLOAD)
warning: (HAVE_TEXT_POKE_SMP) selects STOP_MACHINE which has unmet direct dependencies (SMP && MODULE_UNLOAD)
warning: (HAVE_TEXT_POKE_SMP) selects STOP_MACHINE which has unmet direct dependencies (SMP && MODULE_UNLOAD)
drivers/media/common/tuners/xc4000.c:1106:2: warning: 'fw_minor' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/common/tuners/xc4000.c:1106:2: warning: 'fw_major' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/common/tuners/xc4000.c:1106:2: warning: 'hw_minor' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/common/tuners/xc4000.c:1106:2: warning: 'hw_major' may be used uninitialized in this function [-Wmaybe-uninitialized]
mm/frontswap.c:299:14: warning: 'type' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/common/tuners/tda18218.c:303:2: warning: 'val' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/scsi/fcoe/fcoe_sysfs.c:556:22: sparse: symbol 'fcoe_bus_attr_group' was not declared. Should it be static?
drivers/scsi/fcoe/fcoe_transport.c:189:39: sparse: incorrect type in assignment (different base types)
drivers/scsi/fcoe/fcoe_transport.c:191:40: sparse: incorrect type in assignment (different base types)
drivers/scsi/fcoe/fcoe_transport.c:193:38: sparse: incorrect type in assignment (different base types)
drivers/scsi/fcoe/fcoe_transport.c:195:38: sparse: incorrect type in assignment (different base types)
drivers/scsi/fcoe/fcoe_transport.c:197:39: sparse: incorrect type in assignment (different base types)
drivers/scsi/fcoe/fcoe_transport.c:199:39: sparse: incorrect type in assignment (different base types)
drivers/xen/grant-table.c:53:11: sparse: unable to open 'asm/mach/map.h'
drivers/xen/xenbus/xenbus_probe.c:55:11: sparse: unable to open 'asm/mach/map.h'

[smatch]
net/vmw_vsock/af_vsock.c:616 __vsock_create() error: potential NULL dereference 'psk'.
drivers/mmc/card/queue.c:391 mmc_packed_init() error: potential null dereference 'mqrq_prev->packed'.  (kzalloc returns null)
drivers/scsi/fcoe/fcoe.c:2303 _fcoe_create() error: potential null dereference 'fcoe'.  (fcoe_interface_create returns null)
drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c:163 inv_mpu6050_read_fifo() error: i2c_smbus_read_i2c_block_data() 'data' too small (24 vs 500)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
