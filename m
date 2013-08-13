From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 13 Aug 2013 16:30:49 +0000
Subject: build regressions 2013-08-13
Message-Id: <520a5f39.LX6DzqXKcT9z8qES%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mach-omap2/omap_hwmod.h:670:8: error: duplicate member 'mpu_rt_idx'
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
include/linux/slab.h:322: error: previous implicit declaration of 'kmem_cache_alloc_trace' was here
sound/soc/codecs/wm8997.c:901:32: error: macro "ARIZONA_MUX_ROUTES" requires 2 arguments, but only 1 given
sound/soc/codecs/wm8997.c:901:2: error: 'ARIZONA_MUX_ROUTES' undeclared here (not in a function)
sound/soc/codecs/wm8997.c:902:32: error: macro "ARIZONA_MUX_ROUTES" requires 2 arguments, but only 1 given
sound/soc/codecs/wm8997.c:904:32: error: macro "ARIZONA_MUX_ROUTES" requires 2 arguments, but only 1 given
sound/soc/codecs/wm8997.c:905:32: error: macro "ARIZONA_MUX_ROUTES" requires 2 arguments, but only 1 given
sound/soc/codecs/wm8997.c:907:32: error: macro "ARIZONA_MUX_ROUTES" requires 2 arguments, but only 1 given
sound/soc/codecs/wm8997.c:908:32: error: macro "ARIZONA_MUX_ROUTES" requires 2 arguments, but only 1 given
sound/soc/codecs/wm8997.c:910:32: error: macro "ARIZONA_MUX_ROUTES" requires 2 arguments, but only 1 given
sound/soc/codecs/wm8997.c:911:32: error: macro "ARIZONA_MUX_ROUTES" requires 2 arguments, but only 1 given
fs/xfs/xfs_log_rlimit.c:140: undefined reference to `__udivdi3'
kvm_main.c:(.text+0x4508): undefined reference to `kmalloc_order_trace'
kvm_main.c:(.text+0x4775): undefined reference to `kmalloc_order_trace'
initramfs.c:(.init.text+0x1177): undefined reference to `kmalloc_order_trace'
initramfs.c:(.init.text+0x1428): undefined reference to `kmalloc_order_trace'
initramfs.c:(.init.text+0x1441): undefined reference to `kmalloc_order_trace'
(.text+0xb6bd): undefined reference to `kmalloc_order_trace'
printk.c:(.text+0x4679): undefined reference to `kmalloc_order_trace'
ERROR: "__udivdi3" [fs/xfs/xfs.ko] undefined!
fs/nfs/client.o:client.c:(.text+0x180): first defined here
fs/nfs/client.o:client.c:(.text+0x180): first defined here
fs/nfs/client.o:client.c:(.text+0x180): first defined here
fs/nfs/client.o:client.c:(.text+0x180): first defined here
fs/nfs/client.o:client.c:(.text+0x180): first defined here
fs/nfs/client.o:client.c:(.text+0x180): first defined here
fs/nfs/client.o:client.c:(.text+0x180): first defined here
fs/nfs/client.o:client.c:(.text+0x180): first defined here
fs/nfs/client.o:client.c:(.text+0x180): first defined here
fs/nfs/client.o:client.c:(.text+0x180): first defined here
fs/nfs/client.o:client.c:(.text+0x180): first defined here
fs/nfs/client.o:client.c:(.text+0x180): first defined here
fs/nfs/nfs4proc.o:nfs4proc.c:(.text+0x6e00): first defined here
fs/nfs/nfs4proc.o:nfs4proc.c:(.text+0x6e00): first defined here
fs/nfs/nfs4proc.o:nfs4proc.c:(.text+0x6e00): first defined here
fs/nfs/nfs4proc.o:nfs4proc.c:(.text+0x6e00): first defined here
fs/nfs/nfs4proc.o:nfs4proc.c:(.text+0x6e00): first defined here
fs/nfs/nfs4proc.o:nfs4proc.c:(.text+0x6e00): first defined here
fs/nfs/nfs4proc.o:nfs4proc.c:(.text+0x6e00): first defined here
fs/nfs/nfs4proc.o:nfs4proc.c:(.text+0x6e00): first defined here
fs/nfs/nfs4proc.o:nfs4proc.c:(.text+0x6e00): first defined here
fs/nfs/nfs4proc.o:nfs4proc.c:(.text+0x6e00): first defined here
fs/nfs/nfs4proc.o:nfs4proc.c:(.text+0x6e00): first defined here
fs/nfs/nfs4proc.o:nfs4proc.c:(.text+0x6e00): first defined here
include/linux/slub_def.h:133:1: error: conflicting types for 'kmem_cache_alloc_trace'
cm.c:(.text+0x461dd5): undefined reference to `ip6_route_output'
cm.c:(.text+0x462891): undefined reference to `ipv6_chk_addr'
drivers/gpu/drm/radeon/ci_dpm.c:4041:4: error: implicit declaration of function 'radeon_acpi_pcie_performance_request' [-Werror=implicit-function-declaration]
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:3999:39: error: macro "bond_for_each_slave" passed 3 arguments, but takes just 2
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:3999:3: error: 'bond_for_each_slave' undeclared (first use in this function)
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:3999:41: error: expected ';' before '{' token
include/linux/of.h:269:28: error: conflicting types for 'of_get_cpu_node'
arch/powerpc/kernel/cacheinfo.c:437:2: error: too many arguments to function 'of_get_cpu_node'
drivers/of/base.c:268:21: error: conflicting types for 'of_get_cpu_node'
arch/powerpc/platforms/85xx/smp.c:159:2: error: too many arguments to function 'of_get_cpu_node'
arch/powerpc/platforms/wsp/ics.c:140:3: error: too many arguments to function 'of_get_cpu_node'
arch/powerpc/platforms/wsp/ics.c:652:2: error: too many arguments to function 'of_get_cpu_node'
arch/powerpc/platforms/wsp/wsp.c:93:2: error: too many arguments to function 'of_get_cpu_node'
arch/powerpc/platforms/wsp/smp.c:43:2: error: too many arguments to function 'of_get_cpu_node'
arch/powerpc/kernel/prom.c:910:15: error: conflicting types for 'of_get_cpu_node'
arch/powerpc/kernel/smp.c:563:2: error: too many arguments to function 'of_get_cpu_node'
arch/powerpc/kernel/smp.c:601:2: error: too many arguments to function 'of_get_cpu_node'
arch/powerpc/mm/numa.c:523:9: error: too many arguments to function 'of_get_cpu_node'
arch/powerpc/mm/numa.c:702:3: error: too many arguments to function 'of_get_cpu_node'
arch/powerpc/platforms/cell/cbe_regs.c:185:4: error: too many arguments to function 'of_get_cpu_node'
arch/powerpc/platforms/cell/cbe_regs.c:243:3: error: too many arguments to function 'of_get_cpu_node'
arch/powerpc/sysdev/xics/xics-common.c:56:2: error: too many arguments to function 'of_get_cpu_node'
drivers/cpufreq/pasemi-cpufreq.c:152:2: error: too many arguments to function 'of_get_cpu_node'
drivers/cpufreq/ppc_cbe_cpufreq.c:78:2: error: too many arguments to function 'of_get_cpu_node'
drivers/pci/msi.c:45:2: error: implicit declaration of function 'irq_set_chip_data' [-Werror=implicit-function-declaration]
drivers/pci/msi.c:52:9: error: implicit declaration of function 'irq_get_chip_data' [-Werror=implicit-function-declaration]
drivers/usb/musb/musb_dsps.c:451:2: error: implicit declaration of function 'of_irq_to_resource' [-Werror=implicit-function-declaration]
drivers/usb/musb/musb_am335x.c:27:2: error: implicit declaration of function 'of_device_unregister' [-Werror=implicit-function-declaration]
(.text+0x2a8ae5): undefined reference to `cpufreq_frequency_get_table'
(.text+0x2a8b47): undefined reference to `cpufreq_frequency_table_target'
include/linux/slab.h:322:2: error: implicit declaration of function 'kmem_cache_alloc_trace' [-Werror=implicit-function-declaration]
include/linux/slab_def.h:106:14: error: conflicting types for 'kmem_cache_alloc_trace'
include/linux/slab.h:526:21: error: redefinition of 'kmalloc_node'
include/linux/slab.h:531:21: error: redefinition of '__kmalloc_node'
include/linux/slab.h:538:21: error: redefinition of 'kmem_cache_alloc_node'

[warnings]
drivers/cpufreq/at32ap-cpufreq.c:60: warning: format '%lu' expects type 'long unsigned int', but argument 2 has type 'unsigned int'
drivers/target/tcm_fc/tfc_conf.c:317:3: warning: return makes pointer from integer without a cast [enabled by default]
drivers/gpu/drm/radeon/ci_dpm.c:2784:33: warning: array subscript is above array bounds [-Warray-bounds]
drivers/pci/msi.c:52:26: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:3988:18: warning: unused variable 'first_pdev' [-Wunused-variable]
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:3987:16: warning: unused variable 'slave' [-Wunused-variable]
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:3985:6: warning: unused variable 'cnt' [-Wunused-variable]
warning: (KVMTOOL_TEST_ENABLE) selects VIRTIO_NET which has unmet direct dependencies (NETDEVICES && NET_CORE && VIRTIO)
warning: (KVMTOOL_TEST_ENABLE) selects VIRTIO_NET which has unmet direct dependencies (NETDEVICES && NET_CORE && VIRTIO)
warning: (KVMTOOL_TEST_ENABLE) selects VIRTIO_NET which has unmet direct dependencies (NETDEVICES && NET_CORE && VIRTIO)
include/linux/slab.h:322:2: warning: return makes pointer from integer without a cast [enabled by default]
drivers/infiniband/hw/nes/nes_cm.c:3606:22: warning: unused variable 'cm_event_raddr' [-Wunused-variable]
drivers/infiniband/hw/nes/nes_cm.c:3604:22: warning: unused variable 'cm_event_laddr' [-Wunused-variable]

[sparse]
drivers/gpu/drm/radeon/clearstate_ci.h:939:7: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/clearstate_ci.h:943:7: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/cik.c:6291:6: sparse: symbol 'cik_init_pg' was not declared. Should it be static?
drivers/gpu/drm/radeon/kv_dpm.c:1995:60: sparse: cast to restricted __be32
drivers/gpu/drm/radeon/kv_dpm.c:1995:60: sparse: cast to restricted __be32
drivers/gpu/drm/radeon/kv_dpm.c:1995:60: sparse: cast to restricted __be32
drivers/gpu/drm/radeon/kv_dpm.c:1995:60: sparse: cast to restricted __be32
drivers/gpu/drm/radeon/kv_dpm.c:1995:60: sparse: cast to restricted __be32
drivers/gpu/drm/radeon/kv_dpm.c:1995:60: sparse: cast to restricted __be32
drivers/gpu/drm/radeon/kv_dpm.c:1256:32: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] fps_high_t @@    got  short [unsigned] [usertype] fps_high_t @@
drivers/gpu/drm/radeon/kv_dpm.c:1264:31: sparse: incorrect type in assignment (different base types) @@    expected unsigned char [unsigned] [usertype] fps_low_t @@    got d char [unsigned] [usertype] fps_low_t @@
drivers/gpu/drm/radeon/kv_dpm.c:540:49: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] SclkFrequency @@    got ed int [unsigned] [usertype] SclkFrequency @@
drivers/gpu/drm/radeon/kv_dpm.c:568:44: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MinVddNb @@    got ed int [unsigned] [usertype] MinVddNb @@
drivers/gpu/drm/radeon/kv_dpm.c:578:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] AT @@    got  short [unsigned] [usertype] AT @@
drivers/gpu/drm/radeon/kv_dpm.c:648:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] low_sclk_interrupt_t @@    got ed int [unsigned] [usertype] low_sclk_interrupt_t @@
drivers/gpu/drm/radeon/kv_dpm.c:782:48: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] VclkFrequency @@    got ed int [unsigned] [usertype] VclkFrequency @@
drivers/gpu/drm/radeon/kv_dpm.c:783:48: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] DclkFrequency @@    got ed int [unsigned] [usertype] DclkFrequency @@
drivers/gpu/drm/radeon/kv_dpm.c:784:43: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] MinVddNb @@    got  short [unsigned] [usertype] MinVddNb @@
drivers/gpu/drm/radeon/kv_dpm.c:853:44: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] Frequency @@    got ed int [unsigned] [usertype] Frequency @@
drivers/gpu/drm/radeon/kv_dpm.c:854:45: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] MinVoltage @@    got  short [unsigned] [usertype] MinVoltage @@
drivers/gpu/drm/radeon/kv_dpm.c:916:45: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] Frequency @@    got ed int [unsigned] [usertype] Frequency @@
drivers/gpu/drm/radeon/kv_dpm.c:917:46: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] MinVoltage @@    got  short [unsigned] [usertype] MinVoltage @@
drivers/gpu/drm/radeon/kv_dpm.c:978:44: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] Frequency @@    got ed int [unsigned] [usertype] Frequency @@
drivers/gpu/drm/radeon/kv_dpm.c:979:45: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] MinVoltage @@    got  short [unsigned] [usertype] MinVoltage @@
drivers/gpu/drm/radeon/kv_dpm.c:1740:6: sparse: symbol 'kv_dpm_reset_asic' was not declared. Should it be static?
drivers/gpu/drm/radeon/kv_dpm.c:2220:44: sparse: cast to restricted __le32
drivers/gpu/drm/radeon/kv_dpm.c:2221:47: sparse: cast to restricted __le32
drivers/gpu/drm/radeon/kv_dpm.c:2223:25: sparse: cast to restricted __le16
drivers/gpu/drm/radeon/kv_dpm.c:2236:21: sparse: cast to restricted __le32
drivers/gpu/drm/radeon/kv_dpm.c:2243:33: sparse: cast to restricted __le32
drivers/gpu/drm/radeon/kv_dpm.c:2245:33: sparse: cast to restricted __le32
drivers/gpu/drm/radeon/kv_dpm.c:2247:21: sparse: cast to restricted __le32
drivers/gpu/drm/radeon/kv_dpm.c:2302:21: sparse: cast to restricted __le32
drivers/gpu/drm/radeon/kv_dpm.c:2303:22: sparse: cast to restricted __le16
drivers/gpu/drm/radeon/kv_dpm.c:2304:23: sparse: cast to restricted __le16
drivers/gpu/drm/radeon/kv_dpm.c:2307:29: sparse: cast to restricted __le32
drivers/gpu/drm/radeon/kv_dpm.c:2308:29: sparse: cast to restricted __le32
drivers/gpu/drm/radeon/kv_dpm.c:2331:16: sparse: cast to restricted __le16
drivers/gpu/drm/radeon/kv_dpm.c:2368:18: sparse: cast to restricted __le16
drivers/gpu/drm/radeon/kv_dpm.c:2371:18: sparse: cast to restricted __le16
drivers/gpu/drm/radeon/kv_dpm.c:2374:18: sparse: cast to restricted __le16
drivers/gpu/drm/radeon/kv_dpm.c:2381:38: sparse: cast to restricted __le32
drivers/gpu/drm/radeon/kv_dpm.c:2382:47: sparse: cast to restricted __le16
drivers/gpu/drm/radeon/kv_dpm.c:2383:46: sparse: cast to restricted __le16
drivers/gpu/drm/radeon/ci_dpm.c:289:51: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] TDC_VDDC_PkgLimit @@    got  short [unsigned] [usertype] TDC_VDDC_PkgLimit @@
drivers/gpu/drm/radeon/ci_dpm.c:360:59: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] BapmVddCBaseLeakageHiSidd @@    got  short [unsigned] [usertype] BapmVddCBaseLeakageHiSidd @@
drivers/gpu/drm/radeon/ci_dpm.c:361:59: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] BapmVddCBaseLeakageLoSidd @@    got  short [unsigned] [usertype] BapmVddCBaseLeakageLoSidd @@
drivers/gpu/drm/radeon/ci_dpm.c:389:44: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] PPM_PkgPwrLimit @@    got  short [unsigned] [usertype] PPM_PkgPwrLimit @@
drivers/gpu/drm/radeon/ci_dpm.c:390:49: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] PPM_TemperatureLimit @@    got  short [unsigned] [usertype] PPM_TemperatureLimit @@
drivers/gpu/drm/radeon/ci_dpm.c:392:44: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] PPM_PkgPwrLimit @@    got  short [unsigned] [usertype] PPM_PkgPwrLimit @@
drivers/gpu/drm/radeon/ci_dpm.c:393:49: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] PPM_TemperatureLimit @@    got  short [unsigned] [usertype] PPM_TemperatureLimit @@
drivers/gpu/drm/radeon/ci_dpm.c:396:39: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] BAPM_TEMP_GRADIENT @@    got ed int [unsigned] [usertype] BAPM_TEMP_GRADIENT @@
drivers/gpu/drm/radeon/ci_dpm.c:403:62: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] <noident> @@    got ned short [unsigned] [short] <noident> @@
drivers/gpu/drm/radeon/ci_dpm.c:404:63: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] <noident> @@    got ned short [unsigned] [short] <noident> @@
drivers/gpu/drm/radeon/ci_dpm.c:807:33: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] FpsHighT @@    got  short [unsigned] [usertype] FpsHighT @@
drivers/gpu/drm/radeon/ci_dpm.c:810:32: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] FpsLowT @@    got  short [unsigned] [usertype] FpsLowT @@
drivers/gpu/drm/radeon/ci_dpm.c:821:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] low_sclk_interrupt_t @@    got ed int [unsigned] [usertype] low_sclk_interrupt_t @@
drivers/gpu/drm/radeon/ci_dpm.c:1673:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] Voltage @@    got  short [unsigned] [usertype] Voltage @@
drivers/gpu/drm/radeon/ci_dpm.c:1674:45: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] StdVoltageHiSidd @@    got  short [unsigned] [usertype] StdVoltageHiSidd @@
drivers/gpu/drm/radeon/ci_dpm.c:1676:45: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] StdVoltageLoSidd @@    got  short [unsigned] [usertype] StdVoltageLoSidd @@
drivers/gpu/drm/radeon/ci_dpm.c:1698:31: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] VddcLevelCount @@    got ed int [unsigned] [usertype] VddcLevelCount @@
drivers/gpu/drm/radeon/ci_dpm.c:1721:32: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] VddciLevelCount @@    got ed int [unsigned] [usertype] VddciLevelCount @@
drivers/gpu/drm/radeon/ci_dpm.c:1744:31: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MvddLevelCount @@    got ed int [unsigned] [usertype] MvddLevelCount @@
drivers/gpu/drm/radeon/ci_dpm.c:1972:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] McArbDramTiming @@    got ed int [unsigned] [usertype] McArbDramTiming @@
drivers/gpu/drm/radeon/ci_dpm.c:1973:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] McArbDramTiming2 @@    got ed int [unsigned] [usertype] McArbDramTiming2 @@
drivers/gpu/drm/radeon/ci_dpm.c:2072:43: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] DownT @@    got ed int [unsigned] [usertype] DownT @@
drivers/gpu/drm/radeon/ci_dpm.c:2073:41: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] UpT @@    got ed int [unsigned] [usertype] UpT @@
drivers/gpu/drm/radeon/ci_dpm.c:2116:54: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] VclkFrequency @@    got ed int [unsigned] [usertype] VclkFrequency @@
drivers/gpu/drm/radeon/ci_dpm.c:2117:54: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] DclkFrequency @@    got ed int [unsigned] [usertype] DclkFrequency @@
drivers/gpu/drm/radeon/ci_dpm.c:2118:48: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] MinVddc @@    got  short [unsigned] [usertype] MinVddc @@
drivers/gpu/drm/radeon/ci_dpm.c:2149:50: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] Frequency @@    got ed int [unsigned] [usertype] Frequency @@
drivers/gpu/drm/radeon/ci_dpm.c:2150:51: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] MinVoltage @@    got  short [unsigned] [usertype] MinVoltage @@
drivers/gpu/drm/radeon/ci_dpm.c:2182:50: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] Frequency @@    got ed int [unsigned] [usertype] Frequency @@
drivers/gpu/drm/radeon/ci_dpm.c:2183:51: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] MinVoltage @@    got  short [unsigned] [usertype] MinVoltage @@
drivers/gpu/drm/radeon/ci_dpm.c:2214:51: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] Frequency @@    got ed int [unsigned] [usertype] Frequency @@
drivers/gpu/drm/radeon/ci_dpm.c:2215:52: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] MinVoltage @@    got  short [unsigned] [usertype] MinVoltage @@
drivers/gpu/drm/radeon/ci_dpm.c:2403:31: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MinVddc @@    got ed int [unsigned] [usertype] MinVddc @@
drivers/gpu/drm/radeon/ci_dpm.c:2404:37: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MinVddcPhases @@    got ed int [unsigned] [usertype] MinVddcPhases @@
drivers/gpu/drm/radeon/ci_dpm.c:2405:32: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MinVddci @@    got ed int [unsigned] [usertype] MinVddci @@
drivers/gpu/drm/radeon/ci_dpm.c:2406:31: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MinMvdd @@    got ed int [unsigned] [usertype] MinMvdd @@
drivers/gpu/drm/radeon/ci_dpm.c:2408:37: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MclkFrequency @@    got ed int [unsigned] [usertype] MclkFrequency @@
drivers/gpu/drm/radeon/ci_dpm.c:2409:37: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] ActivityLevel @@    got  short [unsigned] [usertype] ActivityLevel @@
drivers/gpu/drm/radeon/ci_dpm.c:2410:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MpllFuncCntl @@    got ed int [unsigned] [usertype] MpllFuncCntl @@
drivers/gpu/drm/radeon/ci_dpm.c:2411:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MpllFuncCntl_1 @@    got ed int [unsigned] [usertype] MpllFuncCntl_1 @@
drivers/gpu/drm/radeon/ci_dpm.c:2412:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MpllFuncCntl_2 @@    got ed int [unsigned] [usertype] MpllFuncCntl_2 @@
drivers/gpu/drm/radeon/ci_dpm.c:2413:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MpllAdFuncCntl @@    got ed int [unsigned] [usertype] MpllAdFuncCntl @@
drivers/gpu/drm/radeon/ci_dpm.c:2414:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MpllDqFuncCntl @@    got ed int [unsigned] [usertype] MpllDqFuncCntl @@
drivers/gpu/drm/radeon/ci_dpm.c:2415:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MclkPwrmgtCntl @@    got ed int [unsigned] [usertype] MclkPwrmgtCntl @@
drivers/gpu/drm/radeon/ci_dpm.c:2416:31: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] DllCntl @@    got ed int [unsigned] [usertype] DllCntl @@
drivers/gpu/drm/radeon/ci_dpm.c:2417:31: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MpllSs1 @@    got ed int [unsigned] [usertype] MpllSs1 @@
drivers/gpu/drm/radeon/ci_dpm.c:2418:31: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MpllSs2 @@    got ed int [unsigned] [usertype] MpllSs2 @@
drivers/gpu/drm/radeon/ci_dpm.c:2438:42: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MinVddc @@    got ed int [unsigned] [usertype] MinVddc @@
drivers/gpu/drm/radeon/ci_dpm.c:2440:42: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MinVddc @@    got ed int [unsigned] [usertype] MinVddc @@
drivers/gpu/drm/radeon/ci_dpm.c:2471:32: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] Flags @@    got ed int [unsigned] [usertype] Flags @@
drivers/gpu/drm/radeon/ci_dpm.c:2472:40: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MinVddcPhases @@    got ed int [unsigned] [usertype] MinVddcPhases @@
drivers/gpu/drm/radeon/ci_dpm.c:2473:40: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] SclkFrequency @@    got ed int [unsigned] [usertype] SclkFrequency @@
drivers/gpu/drm/radeon/ci_dpm.c:2474:41: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] CgSpllFuncCntl @@    got ed int [unsigned] [usertype] CgSpllFuncCntl @@
drivers/gpu/drm/radeon/ci_dpm.c:2475:42: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] CgSpllFuncCntl2 @@    got ed int [unsigned] [usertype] CgSpllFuncCntl2 @@
drivers/gpu/drm/radeon/ci_dpm.c:2476:42: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] CgSpllFuncCntl3 @@    got ed int [unsigned] [usertype] CgSpllFuncCntl3 @@
drivers/gpu/drm/radeon/ci_dpm.c:2477:42: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] CgSpllFuncCntl4 @@    got ed int [unsigned] [usertype] CgSpllFuncCntl4 @@
drivers/gpu/drm/radeon/ci_dpm.c:2478:45: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] SpllSpreadSpectrum @@    got ed int [unsigned] [usertype] SpllSpreadSpectrum @@
drivers/gpu/drm/radeon/ci_dpm.c:2479:46: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] SpllSpreadSpectrum2 @@    got ed int [unsigned] [usertype] SpllSpreadSpectrum2 @@
drivers/gpu/drm/radeon/ci_dpm.c:2480:37: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] CcPwrDynRm @@    got ed int [unsigned] [usertype] CcPwrDynRm @@
drivers/gpu/drm/radeon/ci_dpm.c:2481:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] CcPwrDynRm1 @@    got ed int [unsigned] [usertype] CcPwrDynRm1 @@
drivers/gpu/drm/radeon/ci_dpm.c:2488:57: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MinVddci @@    got ed int [unsigned] [usertype] MinVddci @@
drivers/gpu/drm/radeon/ci_dpm.c:2491:57: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MinVddci @@    got ed int [unsigned] [usertype] MinVddci @@
drivers/gpu/drm/radeon/ci_dpm.c:2498:48: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MinMvdd @@    got ed int [unsigned] [usertype] MinMvdd @@
drivers/gpu/drm/radeon/ci_dpm.c:2506:40: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] DllCntl @@    got ed int [unsigned] [usertype] DllCntl @@
drivers/gpu/drm/radeon/ci_dpm.c:2507:47: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MclkPwrmgtCntl @@    got ed int [unsigned] [usertype] MclkPwrmgtCntl @@
drivers/gpu/drm/radeon/ci_dpm.c:2508:47: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MpllAdFuncCntl @@    got ed int [unsigned] [usertype] MpllAdFuncCntl @@
drivers/gpu/drm/radeon/ci_dpm.c:2510:47: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MpllDqFuncCntl @@    got ed int [unsigned] [usertype] MpllDqFuncCntl @@
drivers/gpu/drm/radeon/ci_dpm.c:2512:45: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MpllFuncCntl @@    got ed int [unsigned] [usertype] MpllFuncCntl @@
drivers/gpu/drm/radeon/ci_dpm.c:2514:47: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MpllFuncCntl_1 @@    got ed int [unsigned] [usertype] MpllFuncCntl_1 @@
drivers/gpu/drm/radeon/ci_dpm.c:2516:47: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MpllFuncCntl_2 @@    got ed int [unsigned] [usertype] MpllFuncCntl_2 @@
drivers/gpu/drm/radeon/ci_dpm.c:2518:40: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MpllSs1 @@    got ed int [unsigned] [usertype] MpllSs1 @@
drivers/gpu/drm/radeon/ci_dpm.c:2519:40: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MpllSs2 @@    got ed int [unsigned] [usertype] MpllSs2 @@
drivers/gpu/drm/radeon/ci_dpm.c:2526:46: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] ActivityLevel @@    got  short [unsigned] [usertype] ActivityLevel @@
drivers/gpu/drm/radeon/ci_dpm.c:2586:27: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] CcPwrDynRm @@    got ed int [unsigned] [usertype] CcPwrDynRm @@
drivers/gpu/drm/radeon/ci_dpm.c:2587:28: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] CcPwrDynRm1 @@    got ed int [unsigned] [usertype] CcPwrDynRm1 @@
drivers/gpu/drm/radeon/ci_dpm.c:2588:27: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] VddcOffset @@    got  short [unsigned] [usertype] VddcOffset @@
drivers/gpu/drm/radeon/ci_dpm.c:2696:30: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] Flags @@    got ed int [unsigned] [usertype] Flags @@
drivers/gpu/drm/radeon/ci_dpm.c:2697:32: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MinVddc @@    got ed int [unsigned] [usertype] MinVddc @@
drivers/gpu/drm/radeon/ci_dpm.c:2698:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] MinVddcPhases @@    got ed int [unsigned] [usertype] MinVddcPhases @@
drivers/gpu/drm/radeon/ci_dpm.c:2699:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] SclkFrequency @@    got ed int [unsigned] [usertype] SclkFrequency @@
drivers/gpu/drm/radeon/ci_dpm.c:2700:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] ActivityLevel @@    got  short [unsigned] [usertype] ActivityLevel @@
drivers/gpu/drm/radeon/ci_dpm.c:2701:40: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] CgSpllFuncCntl3 @@    got ed int [unsigned] [usertype] CgSpllFuncCntl3 @@
drivers/gpu/drm/radeon/ci_dpm.c:2702:40: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] CgSpllFuncCntl4 @@    got ed int [unsigned] [usertype] CgSpllFuncCntl4 @@
drivers/gpu/drm/radeon/ci_dpm.c:2703:43: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] SpllSpreadSpectrum @@    got ed int [unsigned] [usertype] SpllSpreadSpectrum @@
drivers/gpu/drm/radeon/ci_dpm.c:2704:44: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] SpllSpreadSpectrum2 @@    got ed int [unsigned] [usertype] SpllSpreadSpectrum2 @@
drivers/gpu/drm/radeon/ci_dpm.c:2705:35: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] CcPwrDynRm @@    got ed int [unsigned] [usertype] CcPwrDynRm @@
drivers/gpu/drm/radeon/ci_dpm.c:2706:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] CcPwrDynRm1 @@    got ed int [unsigned] [usertype] CcPwrDynRm1 @@
drivers/gpu/drm/radeon/ci_dpm.c:2778:58: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] ActivityLevel @@    got  short [unsigned] [usertype] ActivityLevel @@
drivers/gpu/drm/radeon/ci_dpm.c:3091:28: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] SystemFlags @@    got ed int [unsigned] [usertype] SystemFlags @@
drivers/gpu/drm/radeon/ci_dpm.c:3092:32: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] SmioMaskVddcVid @@    got ed int [unsigned] [usertype] SmioMaskVddcVid @@
drivers/gpu/drm/radeon/ci_dpm.c:3093:34: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] SmioMaskVddcPhase @@    got ed int [unsigned] [usertype] SmioMaskVddcPhase @@
drivers/gpu/drm/radeon/ci_dpm.c:3094:33: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] SmioMaskVddciVid @@    got ed int [unsigned] [usertype] SmioMaskVddciVid @@
drivers/gpu/drm/radeon/ci_dpm.c:3095:32: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] SmioMaskMvddVid @@    got ed int [unsigned] [usertype] SmioMaskMvddVid @@
drivers/gpu/drm/radeon/ci_dpm.c:3096:29: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] SclkStepSize @@    got ed int [unsigned] [usertype] SclkStepSize @@
drivers/gpu/drm/radeon/ci_dpm.c:3097:37: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] TemperatureLimitHigh @@    got  short [unsigned] [usertype] TemperatureLimitHigh @@
drivers/gpu/drm/radeon/ci_dpm.c:3098:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] TemperatureLimitLow @@    got  short [unsigned] [usertype] TemperatureLimitLow @@
drivers/gpu/drm/radeon/ci_dpm.c:3099:31: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] VddcVddciDelta @@    got  short [unsigned] [usertype] VddcVddciDelta @@
drivers/gpu/drm/radeon/ci_dpm.c:3102:25: sparse: too many warnings
drivers/infiniband/hw/nes/nes_cm.c:3577:41: sparse: incorrect type in assignment (different base types) @@    expected restricted __be32 [usertype] s_addr @@    got unsignrestricted __be32 [usertype] s_addr @@
drivers/infiniband/hw/cxgb4/cq.c:308:42: sparse: cast to restricted __be32
drivers/infiniband/hw/cxgb4/cq.c:308:42: sparse: cast to restricted __be32
drivers/infiniband/hw/cxgb4/cq.c:308:42: sparse: cast to restricted __be32
drivers/infiniband/hw/cxgb4/cq.c:308:42: sparse: cast to restricted __be32
drivers/infiniband/hw/cxgb4/cq.c:308:42: sparse: cast to restricted __be32
drivers/infiniband/hw/cxgb4/cq.c:308:42: sparse: cast to restricted __be32
drivers/infiniband/hw/qib/qib_user_sdma.c:363:15: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [usertype] *pbc16 @@    got resunsigned short [usertype] *pbc16 @@
drivers/infiniband/hw/qib/qib_user_sdma.c:370:20: sparse: cast to restricted __le16
drivers/infiniband/hw/qib/qib_user_sdma.c:370:18: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/infiniband/hw/qib/qib_user_sdma.c:373:23: sparse: cast to restricted __le16
drivers/infiniband/hw/qib/qib_user_sdma.c:373:23: sparse: cast to restricted __le16
drivers/infiniband/hw/qib/qib_user_sdma.c:373:23: sparse: cast to restricted __le16
drivers/infiniband/hw/qib/qib_user_sdma.c:373:23: sparse: cast to restricted __le16
drivers/infiniband/hw/qib/qib_user_sdma.c:412:15: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [usertype] *pbc16 @@    got resunsigned short [usertype] *pbc16 @@
drivers/infiniband/hw/qib/qib_user_sdma.c:416:20: sparse: cast to restricted __le16
drivers/infiniband/hw/qib/qib_user_sdma.c:416:18: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
drivers/infiniband/hw/qib/qib_user_sdma.c:419:23: sparse: cast to restricted __le16
drivers/infiniband/hw/qib/qib_user_sdma.c:419:23: sparse: cast to restricted __le16
drivers/infiniband/hw/qib/qib_user_sdma.c:419:23: sparse: cast to restricted __le16
drivers/infiniband/hw/qib/qib_user_sdma.c:419:23: sparse: cast to restricted __le16
drivers/infiniband/hw/qib/qib_user_sdma.c:613:58: sparse: Using plain integer as NULL pointer
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:3999:17: sparse: macro "bond_for_each_slave" passed 3 arguments, but takes just 2
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:4016:9: sparse: Trying to use reserved word 'return' as identifier
drivers/target/tcm_fc/tfc_conf.c:317:24: sparse: incorrect type in return expression (different base types) @@    expected struct se_portal_group * @@    got struct se_portal_group * @@
block/blk-core.c:2977:17: sparse: context imbalance in 'do_queue_unplug' - unexpected unlock
block/blk-core.c:3023:17: sparse: context imbalance in 'blk_flush_plug_list' - different lock contexts for basic block
fs/nfs/objlayout/../internal.h:587:5: sparse: symbol 'nfs_fhandle_hash' was not declared. Should it be static?
fs/nfs/internal.h:587:5: sparse: symbol 'nfs_fhandle_hash' was not declared. Should it be static?
fs/nfs/blocklayout/../internal.h:587:5: sparse: symbol 'nfs_fhandle_hash' was not declared. Should it be static?
drivers/gpu/drm/radeon/si.c:4904:6: sparse: symbol 'si_init_uvd_internal_cg' was not declared. Should it be static?
drivers/gpu/drm/radeon/si.c:5280:6: sparse: symbol 'si_rlc_reset' was not declared. Should it be static?
drivers/gpu/drm/radeon/cik.c:5647:6: sparse: symbol 'cik_enter_rlc_safe_mode' was not declared. Should it be static?
drivers/gpu/drm/radeon/cik.c:5668:6: sparse: symbol 'cik_exit_rlc_safe_mode' was not declared. Should it be static?
drivers/gpu/drm/radeon/cik.c:6037:6: sparse: symbol 'cik_update_cg' was not declared. Should it be static?
drivers/gpu/drm/radeon/cik.c:6146:6: sparse: symbol 'cik_init_cp_pg_table' was not declared. Should it be static?
drivers/gpu/drm/radeon/si_dpm.c:3666:4: sparse: symbol 'si_get_ddr3_mclk_frequency_ratio' was not declared. Should it be static?
drivers/gpu/drm/radeon/si_dpm.c:3679:4: sparse: symbol 'si_get_mclk_frequency_ratio' was not declared. Should it be static?
drivers/gpu/drm/radeon/si_dpm.c:3761:6: sparse: symbol 'si_trim_voltage_table_to_fit_state_table' was not declared. Should it be static?
drivers/gpu/drm/radeon/kv_dpm.c:1106:5: sparse: symbol 'kv_dpm_enable' was not declared. Should it be static?
drivers/gpu/drm/radeon/kv_dpm.c:1215:6: sparse: symbol 'kv_dpm_disable' was not declared. Should it be static?
drivers/gpu/drm/radeon/kv_dpm.c:1655:5: sparse: symbol 'kv_dpm_force_performance_level' was not declared. Should it be static?
drivers/gpu/drm/radeon/kv_dpm.c:1679:5: sparse: symbol 'kv_dpm_pre_set_power_state' was not declared. Should it be static?
drivers/gpu/drm/radeon/kv_dpm.c:1694:5: sparse: symbol 'kv_dpm_set_power_state' was not declared. Should it be static?
drivers/gpu/drm/radeon/kv_dpm.c:1760:6: sparse: symbol 'kv_dpm_post_set_power_state' was not declared. Should it be static?
drivers/gpu/drm/radeon/kv_dpm.c:1768:6: sparse: symbol 'kv_dpm_setup_asic' was not declared. Should it be static?
drivers/gpu/drm/radeon/kv_dpm.c:2472:5: sparse: symbol 'kv_dpm_init' was not declared. Should it be static?
drivers/gpu/drm/radeon/kv_dpm.c:2536:6: sparse: symbol 'kv_dpm_debugfs_print_current_performance_level' was not declared. Should it be static?
drivers/gpu/drm/radeon/kv_dpm.c:2558:6: sparse: symbol 'kv_dpm_print_power_state' was not declared. Should it be static?
drivers/gpu/drm/radeon/kv_dpm.c:2576:6: sparse: symbol 'kv_dpm_fini' was not declared. Should it be static?
drivers/gpu/drm/radeon/kv_dpm.c:2588:6: sparse: symbol 'kv_dpm_display_configuration_changed' was not declared. Should it be static?
drivers/gpu/drm/radeon/kv_dpm.c:2593:5: sparse: symbol 'kv_dpm_get_sclk' was not declared. Should it be static?
drivers/gpu/drm/radeon/kv_dpm.c:2604:5: sparse: symbol 'kv_dpm_get_mclk' was not declared. Should it be static?
drivers/gpu/drm/radeon/ci_smc.c:46:5: sparse: symbol 'ci_copy_bytes_to_smc' was not declared. Should it be static?
drivers/gpu/drm/radeon/ci_smc.c:107:6: sparse: symbol 'ci_start_smc' was not declared. Should it be static?
drivers/gpu/drm/radeon/ci_smc.c:115:6: sparse: symbol 'ci_reset_smc' was not declared. Should it be static?
drivers/gpu/drm/radeon/ci_smc.c:123:5: sparse: symbol 'ci_program_jump_on_start' was not declared. Should it be static?
drivers/gpu/drm/radeon/ci_smc.c:130:6: sparse: symbol 'ci_stop_smc_clock' was not declared. Should it be static?
drivers/gpu/drm/radeon/ci_smc.c:139:6: sparse: symbol 'ci_start_smc_clock' was not declared. Should it be static?
drivers/gpu/drm/radeon/ci_smc.c:148:6: sparse: symbol 'ci_is_smc_running' was not declared. Should it be static?
drivers/gpu/drm/radeon/ci_smc.c:159:14: sparse: symbol 'ci_send_msg_to_smc' was not declared. Should it be static?
drivers/gpu/drm/radeon/ci_smc.c:180:14: sparse: symbol 'ci_wait_for_smc_inactive' was not declared. Should it be static?
drivers/gpu/drm/radeon/ci_smc.c:198:5: sparse: symbol 'ci_load_smc_ucode' was not declared. Should it be static?
drivers/gpu/drm/radeon/ci_smc.c:238:5: sparse: symbol 'ci_read_smc_sram_dword' was not declared. Should it be static?
drivers/gpu/drm/radeon/ci_smc.c:251:5: sparse: symbol 'ci_write_smc_sram_dword' was not declared. Should it be static?
drivers/gpu/drm/radeon/ci_dpm.c:680:6: sparse: symbol 'ci_dpm_powergate_uvd' was not declared. Should it be static?
drivers/gpu/drm/radeon/ci_dpm.c:685:6: sparse: symbol 'ci_dpm_vblank_too_short' was not declared. Should it be static?
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:3999:55: sparse: Expected ; at end of statement
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:3999:55: sparse: got {
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:4012:17: sparse: Expected ) in function declarator
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:4013:9: sparse: Expected ; at the end of type declaration
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:4016:16: sparse: Expected ; at end of declaration
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:4016:16: sparse: got ret
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:3999:17: sparse: undefined identifier 'bond_for_each_slave'
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:6156:38: sparse: undefined identifier 'cxgb4_inet6addr_notifier'
drivers/usb/musb/musb_dsps.c:451:15: sparse: undefined identifier 'of_irq_to_resource'
drivers/usb/musb/musb_am335x.c:27:9: sparse: undefined identifier 'of_device_unregister'

[coccinelle]
drivers/scsi/scsi_debug.c:1967:3-9: Replace memcpy with struct assignment

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
