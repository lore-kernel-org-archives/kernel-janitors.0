From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 15 Jul 2013 16:46:52 +0000
Subject: build regressions 2013-07-15
Message-Id: <51e4277c.RqiJg0zwrFxp0WRq%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/include/asm/cmpxchg.h:39:2: error: implicit declaration of function 'prefetchw' [-Werror=implicit-function-declaration]
drivers/dma/dmatest.c:29:27: fatal error: asm/dma-iommu.h: No such file or directory
ERROR: "__udivdi3" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!
sound/oss/vwsnd.c:2894:14: error: 'vwsnd_mutex' undeclared (first use in this function)
sound/oss/vwsnd.c:2925:14: error: 'vwsnd_mutex' undeclared (first use in this function)
sound/oss/vwsnd.c:3015:14: error: 'vwsnd_mutex' undeclared (first use in this function)
sound/oss/vwsnd.c:3071:14: error: 'vwsnd_mutex' undeclared (first use in this function)
sound/oss/vwsnd.c:3226:14: error: 'vwsnd_mutex' undeclared (first use in this function)
sound/oss/vwsnd.c:834:2: error: implicit declaration of function 'udelay' [-Werror=implicit-function-declaration]
drivers/video/sgivwfb.c:716:9: error: 'offset' undeclared (first use in this function)
f_rndis.c:(.text+0x44fc7b): undefined reference to `rndis_deregister'
f_rndis.c:(.text+0x44fcbe): undefined reference to `rndis_msg_parser'
f_rndis.c:(.text+0x44fdcd): undefined reference to `rndis_set_param_dev'
f_rndis.c:(.text+0x44fdee): undefined reference to `rndis_set_param_medium'
f_rndis.c:(.text+0x44fdf9): undefined reference to `rndis_signal_disconnect'
f_rndis.c:(.text+0x44fe60): undefined reference to `rndis_set_param_medium'
f_rndis.c:(.text+0x44fe6b): undefined reference to `rndis_signal_connect'
f_rndis.c:(.text+0x44fe92): undefined reference to `rndis_add_hdr'
f_rndis.c:(.text+0x4502e4): undefined reference to `rndis_set_param_medium'
f_rndis.c:(.text+0x4502f5): undefined reference to `rndis_set_host_mac'
f_rndis.c:(.text+0x45031c): undefined reference to `rndis_set_param_vendor'
f_rndis.c:(.text+0x45041e): undefined reference to `rndis_rm_hdr'
f_rndis.c:(.text+0x45045a): undefined reference to `rndis_register'
f_rndis.c:(.text+0x4505b5): undefined reference to `rndis_get_next_response'
f_rndis.c:(.text+0x4505dc): undefined reference to `rndis_free_response'
f_rndis.c:(.text+0x450660): undefined reference to `rndis_uninit'
arch/xtensa/kernel/xtensa_ksyms.c:129:1: error: '_mcount' undeclared here (not in a function)

[warnings]
drivers/infiniband/hw/mlx5/qp.c:871:6: warning: 'in' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/infiniband/hw/qib/qib_sdma.c:752:3: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 8 has type 'dma_addr_t' [-Wformat]
Warning(include/linux/regulator/driver.h:260): No description found for parameter 'linear_ranges'
Warning(include/linux/regulator/driver.h:260): No description found for parameter 'n_linear_ranges'
Warning(include/linux/regulator/machine.h:138): No description found for parameter 'ramp_disable'

[sparse]
drivers/nfc/pn533.c:630:47: sparse: cast from restricted __be16
drivers/nfc/pn533.c:630:47: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned short [unsigned] [usertype] val @@    got  short [unsigned] [usertype] val @@
drivers/nfc/pn533.c:630:47: sparse: cast from restricted __be16
drivers/nfc/pn533.c:630:47: sparse: cast from restricted __be16
drivers/nfc/pn533.c:557:24: sparse: restricted __be16 degrades to integer
drivers/nfc/pn533.c:557:53: sparse: restricted __be16 degrades to integer
drivers/gpu/drm/radeon/ni.c:2462:6: sparse: symbol 'cayman_vm_decode_fault' was not declared. Should it be static?

[coccinelle]
sound/pci/rme9652/hdspm.c:1110:2-3: Unneeded semicolon

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
