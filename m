From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 18 Nov 2012 21:47:38 +0000
Subject: build regressions 2012-11-18
Message-Id: <50a9577a.PzFVMJ0psaEMApbL%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/ptp/ptp_pch.c:152:2: error: implicit declaration of function 'ioread32' [-Werror=implicit-function-declaration]
drivers/ptp/ptp_pch.c:153:2: error: implicit declaration of function 'iowrite32' [-Werror=implicit-function-declaration]
drivers/ptp/ptp_pch.c:567:3: error: implicit declaration of function 'iounmap' [-Werror=implicit-function-declaration]
drivers/ptp/ptp_pch.c:617:2: error: implicit declaration of function 'ioremap' [-Werror=implicit-function-declaration]

[warnings]
drivers/ptp/ptp_pch.c:587:7: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/leds.h:158:18: warning: 'struct led_trigger' declared inside parameter list [enabled by default]
include/linux/leds.h:158:18: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
drivers/net/wireless/orinoco/orinoco_nortel.c:161:12: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/wireless/orinoco/orinoco_tmd.c:111:12: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/wireless/orinoco/orinoco_pci.c:133:12: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/wireless/orinoco/orinoco_plx.c:200:12: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/wireless/mwifiex/pcie.c:1739:17: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/wireless/ipw2x00/ipw2100.c:6234:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/hippi/rrunner.c:152:15: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/fealnx.c:528:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/3com/typhoon.c:2206:25: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/3com/typhoon.c:2335:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/3com/3c59x.c:996:10: warning: passing argument 2 of 'vortex_probe1' makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/rdc/r6040.c:1132:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/silan/sc92031.c:1425:12: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/sun/cassini.c:5073:11: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/wireless/mwl8k.c:5769:13: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/wireless/adm8211.c:1831:12: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/can/sja1000/plx_pci.c:411:14: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/can/sja1000/peak_pci.c:583:11: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/can/sja1000/kvaser_pci.c:318:12: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/can/sja1000/ems_pci.c:265:18: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/wireless/ath/ath5k/pci.c:239:6: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/wireless/ath/ath9k/pci.c:232:6: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/via/via-rhine.c:950:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/ti/tlan.c:2838:11: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/ethernet/smsc/epic100.c:368:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/sis/sis900.c:480:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/realtek/8139too.c:815:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/packetengines/yellowfin.c:412:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c:90:8: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:2661:18: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/myricom/myri10ge/myri10ge.c:3977:12: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/intel/e100.c:2885:11: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/icplus/ipg.c:2256:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/dlink/dl2k.c:150:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/dlink/sundance.c:516:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/emulex/benet/be_main.c:3360:7: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/broadcom/bnx2.c:8120:14: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/dec/tulip/xircom_cb.c:258:18: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/dec/tulip/dmfe.c:464:13: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/dec/tulip/winbond-840.c:392:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/dec/tulip/tulip_core.c:1445:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/dec/tulip/uli526x.c:363:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/cisco/enic/enic_main.c:2360:22: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/atheros/atlx/atl1.c:2992:22: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/atheros/atl1e/atl1e_main.c:2293:22: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/wireless/rtl818x/rtl8180/dev.c:967:12: warning: assignment makes pointer from integer without a cast [enabled by default]

[sparse]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_hw.c:1551:19: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/qlogic/qlcnic/qlcnic_hw.c:1567:60: sparse: cast from restricted __le32

[smatch]
drivers/power/lp8788-charger.c:304 lp8788_get_battery_temperature() info: why not propagate 'ret' from iio_read_channel_processed() instead of -22?

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
