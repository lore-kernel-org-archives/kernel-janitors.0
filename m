From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 18 Apr 2013 17:10:27 +0000
Subject: build regressions 2013-04-18
Message-Id: <51702903.YMQ6yYHllFdiiGu0%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/dma/dmatest.c:23:27: error: asm/dma-iommu.h: No such file or directory
drivers/dma/dmatest.c:573: error: implicit declaration of function 'arm_iommu_release_mapping'
drivers/dma/dmatest.c:642: error: implicit declaration of function 'arm_iommu_create_mapping'
drivers/dma/dmatest.c:646: error: implicit declaration of function 'arm_iommu_attach_device'
net/batman-adv/network-coding.c:1487:2: error: too few arguments to function 'batadv_is_my_mac'
net/batman-adv/network-coding.c:1540:2: error: too few arguments to function 'batadv_is_my_mac'
net/batman-adv/network-coding.c:1611:2: error: too few arguments to function 'batadv_is_my_mac'
net/batman-adv/network-coding.c:1678:2: error: too few arguments to function 'batadv_is_my_mac'
net/batman-adv/network-coding.c:1679:6: error: too few arguments to function 'batadv_is_my_mac'
net/batman-adv/network-coding.c:1683:2: error: too few arguments to function 'batadv_is_my_mac'
arch/powerpc/platforms/pseries/reconfig.c:73:15: error: 'struct device_node' has no member named 'kref'
arch/powerpc/platforms/pseries/dlpar.c:260:15: error: 'struct device_node' has no member named 'kref'
arch/powerpc/sysdev/msi_bitmap.c:205:20: error: 'struct device_node' has no member named 'kref'
net/batman-adv/routing.c:406:2: error: too few arguments to function 'batadv_is_my_mac'
net/batman-adv/routing.c:420:2: error: too few arguments to function 'batadv_is_my_mac'
net/batman-adv/routing.c:581:2: error: too few arguments to function 'batadv_is_my_mac'
net/batman-adv/routing.c:628:3: error: too few arguments to function 'batadv_is_my_mac'
net/batman-adv/routing.c:678:2: error: too few arguments to function 'batadv_is_my_mac'
net/batman-adv/routing.c:984:2: error: too few arguments to function 'batadv_is_my_mac'
net/batman-adv/routing.c:1077:2: error: too few arguments to function 'batadv_is_my_mac'
net/batman-adv/routing.c:1123:2: error: too few arguments to function 'batadv_is_my_mac'
net/batman-adv/routing.c:1177:2: error: too few arguments to function 'batadv_is_my_mac'
net/batman-adv/routing.c:1183:2: error: too few arguments to function 'batadv_is_my_mac'
net/batman-adv/routing.c:1269:2: error: too few arguments to function 'batadv_is_my_mac'
net/batman-adv/routing.c:1273:2: error: too few arguments to function 'batadv_is_my_mac'
net/batman-adv/routing.c:1276:2: error: too few arguments to function 'batadv_is_my_mac'

[warnings]
sound/soc/soc-generic-dmaengine-pcm.c:242:6: warning: passing argument 2 of 'of_dma_request_slave_channel' discards 'const' qualifier from pointer target type [enabled by default]
fs/fat/inode.c:169:11: warning: comparison of distinct pointer types lacks a cast [enabled by default]
net/batman-adv/network-coding.c:1487:2: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]
net/batman-adv/network-coding.c:1540:2: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]
net/batman-adv/network-coding.c:1611:2: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]
net/batman-adv/network-coding.c:1678:2: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]
net/batman-adv/network-coding.c:1679:6: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]
net/batman-adv/network-coding.c:1683:2: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]
kernel/posix-timers.c:157:21: warning: unused variable 'node' [-Wunused-variable]
drivers/media/tuners/r820t.c:1871:8: warning: 'n_ring' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/nilfs2/page.c:430:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' [-Wformat]
net/bluetooth/hidp/core.c:1486:18: warning: 'session' may be used uninitialized in this function [-Wmaybe-uninitialized]
WARNING: drivers/xen/built-in.o(.text+0x2056a): Section mismatch in reference from the function xen_upload_processor_pm_data() to the function .init.text:read_acpi_id()
net/batman-adv/routing.c:406:2: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]
net/batman-adv/routing.c:420:2: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]
net/batman-adv/routing.c:581:2: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]
net/batman-adv/routing.c:628:3: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]
net/batman-adv/routing.c:678:2: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]
net/batman-adv/routing.c:984:2: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]
net/batman-adv/routing.c:1077:2: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]
net/batman-adv/routing.c:1123:2: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]
net/batman-adv/routing.c:1177:2: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]
net/batman-adv/routing.c:1183:2: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]
net/batman-adv/routing.c:1269:2: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]
net/batman-adv/routing.c:1273:2: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]
net/batman-adv/routing.c:1276:2: warning: passing argument 1 of 'batadv_is_my_mac' from incompatible pointer type [enabled by default]

[sparse]
drivers/net/wireless/brcm80211/brcmsmac/phy/phy_n.c:17688:47: sparse: cast truncates bits from constant value (ffff7fff becomes 7fff)
drivers/net/wireless/brcm80211/brcmsmac/phy/phy_n.c:18187:53: sparse: cast truncates bits from constant value (ffff3fff becomes 3fff)
drivers/net/wireless/brcm80211/brcmsmac/phy/phy_n.c:21160:36: sparse: cast truncates bits from constant value (ffff3fff becomes 3fff)
drivers/net/wireless/brcm80211/brcmsmac/phy/phy_n.c:23321:35: sparse: cast truncates bits from constant value (ffff7fff becomes 7fff)
drivers/net/wireless/brcm80211/brcmsmac/phy/phy_n.c:28343:44: sparse: cast truncates bits from constant value (ffff1fff becomes 1fff)
net/bluetooth/hci_core.c:82:16: sparse: symbol 'hci_get_cmd_complete' was not declared. Should it be static?
drivers/clk/clk.c:41:22: sparse: context imbalance in 'clk_enable_lock' - wrong count at exit
drivers/clk/clk.c:48:13: sparse: context imbalance in 'clk_enable_unlock' - unexpected unlock
fs/proc/base.c:2024:13: sparse: context imbalance in 'timers_start' - wrong count at exit
fs/proc/base.c:2050:36: sparse: context imbalance in 'timers_stop' - unexpected unlock
net/batman-adv/routing.c:406:31: sparse: incorrect type in argument 1 (different base types)
net/batman-adv/routing.c:406:30: sparse: not enough arguments for function batadv_is_my_mac
net/batman-adv/routing.c:420:29: sparse: not enough arguments for function batadv_is_my_mac
net/batman-adv/routing.c:581:30: sparse: not enough arguments for function batadv_is_my_mac
net/batman-adv/routing.c:628:37: sparse: not enough arguments for function batadv_is_my_mac
net/batman-adv/routing.c:678:30: sparse: not enough arguments for function batadv_is_my_mac
net/batman-adv/routing.c:984:30: sparse: not enough arguments for function batadv_is_my_mac
net/batman-adv/routing.c:1077:29: sparse: not enough arguments for function batadv_is_my_mac
net/batman-adv/routing.c:1123:29: sparse: not enough arguments for function batadv_is_my_mac
net/batman-adv/routing.c:1177:29: sparse: not enough arguments for function batadv_is_my_mac
net/batman-adv/routing.c:1183:29: sparse: not enough arguments for function batadv_is_my_mac
net/batman-adv/routing.c:1269:30: sparse: not enough arguments for function batadv_is_my_mac
net/batman-adv/routing.c:1273:29: sparse: not enough arguments for function batadv_is_my_mac
net/batman-adv/routing.c:1276:29: sparse: not enough arguments for function batadv_is_my_mac

[smatch]
drivers/net/wireless/ath/carl9170/tx.c:1423 carl9170_op_tx() error: we previously assumed 'sta' could be null (see line 1417)

[coccinelle]
net/ipv6/addrconf.c:1150:2-21: iterator with update on line 1210

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
