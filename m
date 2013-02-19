From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 19 Feb 2013 18:17:58 +0000
Subject: build regressions 2013-02-19
Message-Id: <5123c1d6.FpwkcfxszhUqx5d+%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
net/core/dev_addr_lists.c:783:51: error: 'dev_mc_seq_fops' undeclared (first use in this function)
drivers/mfd/syscon.c:94:15: error: variable 'syscon_regmap_config' has initializer but incomplete type
drivers/mfd/syscon.c:95:2: error: unknown field 'reg_bits' specified in initializer
drivers/mfd/syscon.c:96:2: error: unknown field 'val_bits' specified in initializer
drivers/mfd/syscon.c:97:2: error: unknown field 'reg_stride' specified in initializer
drivers/mfd/syscon.c:124:2: error: invalid use of undefined type 'struct regmap_config'
drivers/mfd/syscon.c:125:2: error: implicit declaration of function 'devm_regmap_init_mmio' [-Werror=implicit-function-declaration]
drivers/net/hamradio/yam.c:1170:50: error: 'yam_info_fops' undeclared (first use in this function)
net/netrom/af_netrom.c:1455:49: error: 'nr_info_fops' undeclared (first use in this function)
net/netfilter/ipvs/ip_vs_ctl.c:3803:42: error: 'ip_vs_info_fops' undeclared (first use in this function)
net/netfilter/ipvs/ip_vs_ctl.c:3804:48: error: 'ip_vs_stats_fops' undeclared (first use in this function)
net/netfilter/ipvs/ip_vs_ctl.c:3806:8: error: 'ip_vs_stats_percpu_fops' undeclared (first use in this function)
net/netfilter/ipvs/ip_vs_conn.c:1294:47: error: 'ip_vs_conn_fops' undeclared (first use in this function)
net/netfilter/ipvs/ip_vs_conn.c:1295:52: error: 'ip_vs_conn_sync_fops' undeclared (first use in this function)
net/netfilter/ipvs/ip_vs_app.c:608:46: error: 'ip_vs_app_fops' undeclared (first use in this function)
net/decnet/dn_route.c:1905:8: error: 'dn_rt_cache_seq_fops' undeclared (first use in this function)
net/decnet/dn_neigh.c:594:8: error: 'dn_neigh_seq_fops' undeclared (first use in this function)
net/decnet/dn_dev.c:1415:57: error: 'dn_dev_seq_fops' undeclared (first use in this function)
net/decnet/af_decnet.c:2387:53: error: 'dn_socket_seq_fops' undeclared (first use in this function)
net/ax25/af_ax25.c:1997:51: error: 'ax25_info_fops' undeclared (first use in this function)
webcam.c:(.init.text+0xbfac): undefined reference to `usb_ep_autoconfig'
webcam.c:(.init.text+0xbfce): undefined reference to `usb_ep_autoconfig'
webcam.c:(.text+0x13453d): undefined reference to `config_ep_by_speed'
(.text+0x135880): undefined reference to `usb_function_activate'
(.text+0x135938): undefined reference to `usb_function_deactivate'
webcam.c:(.init.text+0xbc68): undefined reference to `usb_composite_probe'
webcam.c:(.init.text+0xbc7d): undefined reference to `usb_string_ids_tab'
webcam.c:(.init.text+0xbcb0): undefined reference to `usb_add_config'
webcam.c:(.init.text+0xbcc0): undefined reference to `usb_composite_overwrite_options'
webcam.c:(.init.text+0xc081): undefined reference to `usb_interface_id'
webcam.c:(.init.text+0xc0a5): undefined reference to `usb_interface_id'
webcam.c:(.init.text+0xc1f7): undefined reference to `usb_function_deactivate'
(.init.text+0xc48a): undefined reference to `usb_string_id'
(.init.text+0xc4a6): undefined reference to `usb_string_id'
(.init.text+0xc4be): undefined reference to `usb_string_id'
(.init.text+0xc515): undefined reference to `usb_add_function'
webcam.c:(.exit.text+0x12d7): undefined reference to `usb_composite_unregister'
mm/huge_memory.c:1410:23: error: request for member 'pud' in something not a structure or union
mm/mincore.c:52:11: error: 'present' undeclared (first use in this function)
net/packet/af_packet.c:3831:48: error: 'packet_seq_fops' undeclared (first use in this function)
mm/huge_memory.c:1410:10: error: incompatible type for argument 1 of 'pmd_page'
mm/huge_memory.c:1411:23: error: request for member 'pmd' in something not a structure or union
mm/huge_memory.c:1410:23: error: incompatible type for argument 1 of 'pmd_val'
mm/huge_memory.c:1416:11: error: 'MINCORE_INCORE' undeclared (first use in this function)
mm/huge_memory.c:1418:13: error: 'MINCORE_DIRTY' undeclared (first use in this function)
net/ipv6/xfrm6_policy.c:238:6: error: 'struct rt6_info' has no member named 'n'
net/ipv6/xfrm6_policy.c:239:28: error: 'struct rt6_info' has no member named 'n'
cpu_cooling.c:(.text+0x204eed): undefined reference to `cpufreq_frequency_get_table'
cpu_cooling.c:(.text+0x2051fe): undefined reference to `cpufreq_frequency_get_table'

[warnings]
drivers/mfd/syscon.c:95:2: warning: excess elements in struct initializer [enabled by default]
drivers/mfd/syscon.c:95:2: warning: (near initialization for 'syscon_regmap_config') [enabled by default]
drivers/mfd/syscon.c:96:2: warning: excess elements in struct initializer [enabled by default]
drivers/mfd/syscon.c:96:2: warning: (near initialization for 'syscon_regmap_config') [enabled by default]
drivers/mfd/syscon.c:97:2: warning: excess elements in struct initializer [enabled by default]
drivers/mfd/syscon.c:97:2: warning: (near initialization for 'syscon_regmap_config') [enabled by default]
drivers/mfd/syscon.c:125:17: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/regulator/anatop-regulator.c:76:13: warning: 'val' may be used uninitialized in this function [-Wuninitialized]
net/core/dev_ioctl.c:159:11: warning: comparison of distinct pointer types lacks a cast [enabled by default]
net/core/dev_ioctl.c:279:10: warning: comparison of distinct pointer types lacks a cast [enabled by default]
fs/proc_namespace.c:84:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__kernel_suseconds_t' [-Wformat]
WARNING: drivers/video/built-in.o(.text+0x2945f6): Section mismatch in reference from the function .ps3fb_probe() to the variable .init.data:ps3fb_fix
warning: (ARM_GIC && ARM_VIC && RENESAS_INTC_IRQPIN && VERSATILE_FPGA_IRQ && REGMAP && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && RENESAS_INTC_IRQPIN && VERSATILE_FPGA_IRQ && REGMAP && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && RENESAS_INTC_IRQPIN && VERSATILE_FPGA_IRQ && REGMAP && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
drivers/net/caif/caif_virtio.c:486:2: warning: passing argument 1 of 'vringh_iov_init' from incompatible pointer type [enabled by default]
drivers/net/caif/caif_virtio.c:520:2: warning: passing argument 1 of 'vringh_iov_cleanup' from incompatible pointer type [enabled by default]
warning: (REMOTEPROC && VHOST_NET && TCM_VHOST) selects VHOST_RING which has unmet direct dependencies (VIRTUALIZATION)
warning: (REMOTEPROC && VHOST_NET && TCM_VHOST) selects VHOST_RING which has unmet direct dependencies (VIRTUALIZATION)
warning: (REMOTEPROC && VHOST_NET && TCM_VHOST) selects VHOST_RING which has unmet direct dependencies (VIRTUALIZATION)

[sparse]
drivers/vfio/pci/vfio_pci_config.c:600:50: sparse: cast to restricted pci_power_t
drivers/usb/phy/omap-usb3.c:185:37: sparse: invalid access below 'omap_usb3_dpll_params' (-8 60)
drivers/usb/phy/omap-usb3.c:180:37: sparse: invalid access below 'omap_usb3_dpll_params' (-4 60)
drivers/usb/phy/omap-usb3.c:175:37: sparse: invalid access below 'omap_usb3_dpll_params' (-12 60)
drivers/usb/phy/omap-usb3.c:170:37: sparse: invalid access below 'omap_usb3_dpll_params' (-9 60)
drivers/usb/phy/omap-usb3.c:165:37: sparse: invalid access below 'omap_usb3_dpll_params' (-10 60)
drivers/usb/phy/omap-usb3.c:185:37: sparse: invalid access below 'omap_usb3_dpll_params' (-8 60)
drivers/usb/phy/omap-usb3.c:180:37: sparse: invalid access below 'omap_usb3_dpll_params' (-4 60)
drivers/usb/phy/omap-usb3.c:175:37: sparse: invalid access below 'omap_usb3_dpll_params' (-12 60)
drivers/usb/phy/omap-usb3.c:170:37: sparse: invalid access below 'omap_usb3_dpll_params' (-9 60)
drivers/usb/phy/omap-usb3.c:165:37: sparse: invalid access below 'omap_usb3_dpll_params' (-10 60)
net/ipv6/reassembly.c:82:72: sparse: incorrect type in argument 3 (different base types)
mm/huge_memory.c:1410:37: sparse: incorrect type in argument 1 (invalid types)
arch/x86/include/asm/paravirt.h:575:24: sparse: context imbalance in 'mincore_huge_pmd' - unexpected unlock
net/ipv6/xfrm6_policy.c:238:13: sparse: no member 'n' in struct rt6_info
mm/huge_memory.c:1416:25: sparse: undefined identifier 'MINCORE_INCORE'
mm/huge_memory.c:1418:34: sparse: undefined identifier 'MINCORE_DIRTY'
mm/mincore.c:52:32: sparse: undefined identifier 'present'

[smatch]
drivers/tty/mxser.c:2646 mxser_probe() warn: always true condition '(i >= 0) => (0-u32max >= 0)'
drivers/tty/mxser.c:2646 mxser_probe() warn: always true condition '(i >= 0) => (0-u32max >= 0)'
drivers/tty/mxser.c:2754 mxser_module_init() warn: always true condition '(i >= 0) => (0-u32max >= 0)'
drivers/tty/mxser.c:2754 mxser_module_init() warn: always true condition '(i >= 0) => (0-u32max >= 0)'
drivers/net/wireless/rtlwifi/usb.c:94 _usbctrl_vendorreq_async_write() error: __builtin_memcpy() 'pdata' too small (4 vs 254)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
