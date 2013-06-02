From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 02 Jun 2013 21:54:43 +0000
Subject: build regressions 2013-06-02
Message-Id: <51abbf23.2U8Du+tPjYD0NK/f%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
ERROR: "nfs_dns_resolver_init" [fs/nfs/nfs.ko] undefined!
ERROR: "nfs_dns_resolver_cache_destroy" [fs/nfs/nfs.ko] undefined!
ERROR: "nfs_dns_resolver_destroy" [fs/nfs/nfs.ko] undefined!
ERROR: "nfs_dns_resolver_cache_init" [fs/nfs/nfs.ko] undefined!
inode.c:(.text+0x4c078): undefined reference to `nfs_dns_resolver_cache_destroy'
inode.c:(.text+0x4c09c): undefined reference to `nfs_dns_resolver_cache_init'
inode.c:(.init.text+0x12f8): undefined reference to `nfs_dns_resolver_init'
inode.c:(.init.text+0x1418): undefined reference to `nfs_dns_resolver_destroy'
inode.c:(.exit.text+0x80): undefined reference to `nfs_dns_resolver_destroy'
ERROR: "cw1200_get_platform_data" [drivers/net/wireless/cw1200/cw1200_wlan_sdio.ko] undefined!

[warnings]
warning: (ARCH_OMAP4 && ARCH_TEGRA_2x_SOC) selects ARCH_NEEDS_CPU_IDLE_COUPLED which has unmet direct dependencies (CPU_IDLE)
warning: (ARCH_OMAP4 && ARCH_TEGRA_2x_SOC) selects ARCH_NEEDS_CPU_IDLE_COUPLED which has unmet direct dependencies (CPU_IDLE)
warning: (ARCH_OMAP4 && ARCH_TEGRA_2x_SOC) selects ARCH_NEEDS_CPU_IDLE_COUPLED which has unmet direct dependencies (CPU_IDLE)
drivers/net/wireless/cw1200/wsm.c:1512:2: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
