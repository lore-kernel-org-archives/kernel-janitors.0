From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 18 Sep 2013 16:31:55 +0000
Subject: build regressions 2013-09-18
Message-Id: <5239d57b.SxHh/HvNXcv93lfn%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mach-versatile/core.c:748:2: error: unknown field 'get_signal' specified in initializer
arch/arm/mach-versatile/core.c:749:2: error: unknown field 'put_signal' specified in initializer
cpu_pm.c:(.text+0x322c0): undefined reference to `of_node_to_nid'
cpu_pm.c:(.text+0x3231c): undefined reference to `of_node_to_nid'
cpu_pm.c:(.text+0x324b8): undefined reference to `of_node_to_nid'
cpu_pm.c:(.text+0x325ac): undefined reference to `of_node_to_nid'
cpu_pm.c:(.text+0x32698): undefined reference to `of_node_to_nid'
drivers/net/wireless/ath/ath10k/./trace.h:138:1: error: macro "__field" requires 2 arguments, but only 1 given
drivers/net/wireless/ath/ath10k/./trace.h:122:3: error: expected specifier-qualifier-list before '__field'
drivers/net/wireless/ath/ath10k/./trace.h:138:1: error: macro "__field" requires 2 arguments, but only 1 given
drivers/net/wireless/ath/ath10k/./trace.h:122:3: error: expected specifier-qualifier-list before '__field'
drivers/net/wireless/ath/ath10k/./trace.h:138:1: error: macro "__field" requires 2 arguments, but only 1 given
drivers/net/wireless/ath/ath10k/./trace.h:136:10: error: 'struct ftrace_raw_ath10k_wmi_cmd' has no member named 'ret'
drivers/net/wireless/ath/ath10k/./trace.h:138:1: error: macro "__field" requires 2 arguments, but only 1 given
drivers/net/wireless/ath/ath10k/./trace.h:122:3: error: '__field' undeclared (first use in this function)
drivers/net/wireless/ath/ath10k/./trace.h:138:1: error: macro "__field" requires 2 arguments, but only 1 given
include/linux/compiler-gcc4.h:14:34: error: 'struct ftrace_raw_ath10k_wmi_cmd' has no member named '__data'
drivers/net/wireless/ath/ath10k/./trace.h:122:3: error: '__field' undeclared (first use in this function)
drivers/net/wireless/ath/ath10k/./trace.h:138:1: error: macro "__field" requires 2 arguments, but only 1 given
drivers/net/wireless/ath/ath10k/./trace.h:122:3: error: '__field' undeclared (first use in this function)
include/trace/ftrace.h:548:2: error: expected ';' before '{' token
drivers/net/wireless/ath/ath10k/./trace.h:138:1: error: macro "__field" requires 2 arguments, but only 1 given
drivers/net/wireless/ath/ath10k/./trace.h:138:1: error: macro "__field" requires 2 arguments, but only 1 given
drivers/net/wireless/ath/ath10k/./trace.h:122:3: error: '__field' undeclared (first use in this function)
include/trace/ftrace.h:684:2: error: expected ';' before '{' token
sound/soc/davinci/davinci-evm.c:24:28: fatal error: asm/mach-types.h: No such file or directory
(.text+0x49147): undefined reference to `of_node_to_nid'
(.text+0x4952b): undefined reference to `of_node_to_nid'
(.text+0x49669): undefined reference to `of_node_to_nid'
(.text+0x49703): undefined reference to `of_node_to_nid'
(.text+0x49a38): undefined reference to `of_node_to_nid'
drivers/net/wireless/ath/ath10k/./trace.h:113:1: error: 'struct ftrace_raw_ath10k_wmi_cmd' has no member named '__data'
drivers/net/wireless/ath/ath10k/./trace.h:113:1: error: expected ';' before '{' token
drivers/net/wireless/ath/ath10k/./trace.h:113:1: error: expected ';' before '{' token
arch/powerpc/platforms/pasemi/gpio_mdio.c:322:2: error: implicit declaration of function 'of_iomap' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/powermac/pfunc_base.c:27:2: error: implicit declaration of function 'irq_of_parse_and_map' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/powernv/setup.c:197:2: error: implicit declaration of function 'of_get_flat_dt_root' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/powernv/setup.c:199:2: error: implicit declaration of function 'of_flat_dt_is_compatible' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/powernv/opal.c:49:2: error: implicit declaration of function 'of_get_flat_dt_prop' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/powernv/opal.c:64:2: error: implicit declaration of function 'of_flat_dt_is_compatible' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/powernv/opal-lpc.c:192:3: error: implicit declaration of function 'of_get_ibm_chip_id' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/pseries/hotplug-memory.c:41:4: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/pseries/hotplug-memory.c:230:3: error: invalid use of undefined type 'struct of_drconf_cell'
arch/powerpc/platforms/pseries/hotplug-memory.c:230:17: error: dereferencing pointer to incomplete type
arch/powerpc/platforms/pseries/hotplug-memory.c:230:29: error: 'DRCONF_MEM_ASSIGNED' undeclared (first use in this function)
arch/powerpc/platforms/pseries/hotplug-memory.c:231:7: error: invalid use of undefined type 'struct of_drconf_cell'
arch/powerpc/platforms/pseries/hotplug-memory.c:231:19: error: dereferencing pointer to incomplete type
arch/powerpc/platforms/pseries/hotplug-memory.c:232:4: error: invalid use of undefined type 'struct of_drconf_cell'
arch/powerpc/platforms/pseries/hotplug-memory.c:232:42: error: dereferencing pointer to incomplete type
arch/powerpc/platforms/pseries/hotplug-memory.c:235:3: error: invalid use of undefined type 'struct of_drconf_cell'
arch/powerpc/platforms/pseries/hotplug-memory.c:235:26: error: dereferencing pointer to incomplete type
arch/powerpc/platforms/pseries/hotplug-memory.c:236:7: error: invalid use of undefined type 'struct of_drconf_cell'
arch/powerpc/platforms/pseries/hotplug-memory.c:236:17: error: dereferencing pointer to incomplete type
arch/powerpc/platforms/pseries/hotplug-memory.c:237:4: error: invalid use of undefined type 'struct of_drconf_cell'
arch/powerpc/platforms/pseries/hotplug-memory.c:237:31: error: dereferencing pointer to incomplete type
arch/powerpc/sysdev/fsl_soc.c:70:4: error: implicit declaration of function 'of_translate_address' [-Werror=implicit-function-declaration]
arch/powerpc/sysdev/fsl_soc.c:221:4: error: implicit declaration of function 'of_iomap' [-Werror=implicit-function-declaration]
arch/powerpc/sysdev/fsl_pci.c:467:12: error: dereferencing pointer to incomplete type
arch/powerpc/sysdev/fsl_pci.c:477:2: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
arch/powerpc/sysdev/fsl_pci.c:494:22: error: dereferencing pointer to incomplete type
arch/powerpc/sysdev/fsl_pci.c:1092:13: error: dereferencing pointer to incomplete type
arch/powerpc/sysdev/fsl_pci.c:1132:15: error: variable 'fsl_pci_driver' has initializer but incomplete type
arch/powerpc/sysdev/fsl_pci.c:1133:2: error: unknown field 'driver' specified in initializer
arch/powerpc/sysdev/fsl_pci.c:1133:2: error: extra brace group at end of initializer
arch/powerpc/sysdev/fsl_pci.c:1138:2: error: unknown field 'probe' specified in initializer
arch/powerpc/sysdev/fsl_pci.c:1143:2: error: implicit declaration of function 'platform_driver_register' [-Werror=implicit-function-declaration]
arch/powerpc/sysdev/fsl_msi.c:358:2: error: implicit declaration of function 'irq_of_parse_and_map' [-Werror=implicit-function-declaration]
arch/powerpc/sysdev/fsl_msi.c:425:3: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/85xx/smp.c:433:3: error: implicit declaration of function 'of_iomap' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/wsp/ics.c:439:2: error: implicit declaration of function 'of_irq_find_parent' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/wsp/ics.c:573:2: error: implicit declaration of function 'of_iomap' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/wsp/wsp.c:76:3: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/wsp/psr2.c:40:2: error: implicit declaration of function 'of_get_flat_dt_root' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/wsp/psr2.c:42:2: error: implicit declaration of function 'of_flat_dt_is_compatible' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/wsp/chroma.c:34:2: error: implicit declaration of function 'of_get_flat_dt_root' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/wsp/chroma.c:36:2: error: implicit declaration of function 'of_flat_dt_is_compatible' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/wsp/h8.c:113:2: error: implicit declaration of function 'of_iomap' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/wsp/opb_pic.c:237:2: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/wsp/opb_pic.c:302:3: error: implicit declaration of function 'irq_of_parse_and_map' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/wsp/scom_wsp.c:37:2: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/wsp/wsp_pci.c:676:2: error: implicit declaration of function 'of_iomap' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/wsp/wsp_pci.c:1100:2: error: implicit declaration of function 'irq_of_parse_and_map' [-Werror=implicit-function-declaration]
arch/powerpc/kernel/epapr_paravirt.c:41:2: error: implicit declaration of function 'of_get_flat_dt_prop' [-Werror=implicit-function-declaration]
arch/powerpc/kernel/epapr_paravirt.c:67:2: error: implicit declaration of function 'of_scan_flat_dt' [-Werror=implicit-function-declaration]
arch/powerpc/sysdev/ehv_pic.c:288:3: error: implicit declaration of function 'of_iomap' [-Werror=implicit-function-declaration]
arch/powerpc/sysdev/fsl_ifc.c:228:2: error: implicit declaration of function 'of_iomap' [-Werror=implicit-function-declaration]
arch/powerpc/sysdev/fsl_ifc.c:236:2: error: implicit declaration of function 'irq_of_parse_and_map' [-Werror=implicit-function-declaration]
arch/powerpc/sysdev/fsl_rio.c:355:2: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
arch/powerpc/sysdev/fsl_rio.c:424:2: error: implicit declaration of function 'irq_of_parse_and_map' [-Werror=implicit-function-declaration]
arch/powerpc/sysdev/fsl_rmu.c:1094:2: error: implicit declaration of function 'irq_of_parse_and_map' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/85xx/p5020_ds.c:41:2: error: implicit declaration of function 'of_get_flat_dt_root' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/85xx/p5020_ds.c:46:2: error: implicit declaration of function 'of_flat_dt_is_compatible' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/85xx/t4240_qds.c:41:2: error: implicit declaration of function 'of_get_flat_dt_root' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/85xx/t4240_qds.c:46:2: error: implicit declaration of function 'of_flat_dt_is_compatible' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/85xx/b4_qds.c:41:2: error: implicit declaration of function 'of_get_flat_dt_root' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/85xx/b4_qds.c:46:2: error: implicit declaration of function 'of_flat_dt_is_compatible' [-Werror=implicit-function-declaration]
drivers/ata/sata_fsl.c:1478:2: error: implicit declaration of function 'of_iomap' [-Werror=implicit-function-declaration]
drivers/ata/sata_fsl.c:1503:2: error: implicit declaration of function 'irq_of_parse_and_map' [-Werror=implicit-function-declaration]
drivers/dma/fsldma.c:1232:2: error: implicit declaration of function 'of_iomap' [-Werror=implicit-function-declaration]
drivers/dma/fsldma.c:1239:2: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
drivers/dma/fsldma.c:1292:2: error: implicit declaration of function 'irq_of_parse_and_map' [-Werror=implicit-function-declaration]
drivers/crypto/caam/ctrl.c:216:2: error: implicit declaration of function 'of_iomap' [-Werror=implicit-function-declaration]
drivers/crypto/caam/ctrl.c:227:2: error: implicit declaration of function 'of_irq_to_resource' [-Werror=implicit-function-declaration]
drivers/crypto/caam/jr.c:406:2: error: implicit declaration of function 'of_irq_to_resource' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-mpc8xxx.c:348:2: error: implicit declaration of function 'irq_of_parse_and_map' [-Werror=implicit-function-declaration]
drivers/spi/spi-fsl-cpm.c:256:2: error: implicit declaration of function 'of_iomap' [-Werror=implicit-function-declaration]
drivers/spi/spi-fsl-espi.c:701:2: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
drivers/spi/spi-fsl-espi.c:705:2: error: implicit declaration of function 'of_irq_to_resource' [-Werror=implicit-function-declaration]
drivers/mtd/nand/fsl_ifc_nand.c:948:2: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
arch/powerpc/kernel/setup_32.c:130:2: error: implicit declaration of function 'early_init_devtree' [-Werror=implicit-function-declaration]
arch/powerpc/kernel/setup_32.c:275:2: error: implicit declaration of function 'unflatten_device_tree' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c:210:3: error: implicit declaration of function 'of_translate_address' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/embedded6xx/flipper-pic.c:151:2: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/embedded6xx/gamecube.c:66:2: error: implicit declaration of function 'of_get_flat_dt_root' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/embedded6xx/gamecube.c:67:2: error: implicit declaration of function 'of_flat_dt_is_compatible' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/embedded6xx/linkstation.c:146:2: error: implicit declaration of function 'of_get_flat_dt_root' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/embedded6xx/linkstation.c:148:2: error: implicit declaration of function 'of_flat_dt_is_compatible' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/embedded6xx/wii.c:134:2: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/embedded6xx/wii.c:210:2: error: implicit declaration of function 'of_get_flat_dt_root' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/embedded6xx/wii.c:211:2: error: implicit declaration of function 'of_flat_dt_is_compatible' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/embedded6xx/hlwd-pic.c:165:2: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/embedded6xx/hlwd-pic.c:212:4: error: implicit declaration of function 'irq_of_parse_and_map' [-Werror=implicit-function-declaration]
fs/nfs/direct.c:130:21: error: 'nter' undeclared (first use in this function)
fs/nfs/direct.c:130:25: error: 'struct iov_iter' has no member named 'r_segs'
dummychip.c:(.text+0x1e11d): undefined reference to `of_node_to_nid'
dummychip.c:(.text+0x1e192): undefined reference to `of_node_to_nid'

[warnings]
drivers/staging/dgap/dgap_conf.h:165:0: warning: "IO_FIELD" redefined [enabled by default]
drivers/staging/dgap/dgap_conf.h:165:0: warning: "IO_FIELD" redefined [enabled by default]
drivers/staging/dgap/dgap_conf.h:165:0: warning: "IO_FIELD" redefined [enabled by default]
Error(include/linux/regulator/driver.h:52): cannot understand prototype: 'struct regulator_linear_range '
include/trace/ftrace.h:662:18: warning: unused variable '__count' [-Wunused-variable]
include/trace/ftrace.h:662:6: warning: unused variable '__addr' [-Wunused-variable]
sound/soc/davinci/davinci-pcm.c:191:2: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'dma_addr_t' [-Wformat=]
sound/soc/davinci/davinci-pcm.c:811:36: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
arch/powerpc/kernel/epapr_paravirt.c:41:8: warning: assignment makes pointer from integer without a cast [enabled by default]
arch/powerpc/platforms/pasemi/gpio_mdio.c:322:12: warning: assignment makes pointer from integer without a cast [enabled by default]
arch/powerpc/platforms/powernv/opal.c:49:8: warning: assignment makes pointer from integer without a cast [enabled by default]
arch/powerpc/platforms/powernv/opal.c:50:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/ata/sata_fsl.c:1478:11: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/dma/fsldma.c:1232:13: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/dma/fsldma.c:1336:13: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/crypto/caam/ctrl.c:216:7: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/spi/spi-fsl-cpm.c:256:11: warning: assignment makes pointer from integer without a cast [enabled by default]
sound/soc/davinci/davinci-pcm.c:810:2: warning: format '%d' expects argument of type 'int', but argument 5 has type 'size_t' [-Wformat]
warning: (SND_AM33XX_SOC_EVM) selects SND_DAVINCI_SOC which has unmet direct dependencies (SOUND && !M68K && !UML && SND && SND_SOC && (ARCH_DAVINCI || SOC_AM33XX))
warning: (SND_AM33XX_SOC_EVM) selects SND_DAVINCI_SOC which has unmet direct dependencies (SOUND && !M68K && !UML && SND && SND_SOC && (ARCH_DAVINCI || SOC_AM33XX))
warning: (SND_AM33XX_SOC_EVM) selects SND_DAVINCI_SOC which has unmet direct dependencies (SOUND && !M68K && !UML && SND && SND_SOC && (ARCH_DAVINCI || SOC_AM33XX))

[sparse]
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: macro "__field" requires 2 arguments, but only 1 given
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: macro "__field" requires 2 arguments, but only 1 given
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: macro "__field" requires 2 arguments, but only 1 given
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: macro "__field" requires 2 arguments, but only 1 given
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: macro "__field" requires 2 arguments, but only 1 given
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: macro "__field" requires 2 arguments, but only 1 given
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: macro "__field" requires 2 arguments, but only 1 given
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: macro "__field" requires 2 arguments, but only 1 given
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: expected ; at end of declaration
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: Trying to use reserved word 'if' as identifier
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: unknown member
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: incompatible types for operation (+)
drivers/net/wireless/ath/ath10k/./trace.h:140:1: sparse: too many arguments for function perf_trace_buf_submit
drivers/net/wireless/ath/ath10k/./trace.h:164:1: sparse: too many arguments for function perf_trace_buf_submit
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: cannot dereference this type
fs/nfs/direct.c:128:9: sparse: no member 'r_segs' in struct iov_iter
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: Expected } at end of struct-union-enum-specifier
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: got char
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: Expected ; at the end of type declaration
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: got }
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: Expected ; at end of statement
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: Expected ) in function declarator
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: no member 'ret' in struct ftrace_raw_ath10k_wmi_cmd
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: undefined identifier '__field'
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: undefined identifier 'event_call'
drivers/net/wireless/ath/ath10k/./trace.h:113:1: sparse: expected structure or union
sound/soc/davinci/davinci-pcm.c:807:21: sparse: undefined identifier 'dma_alloc_writecombine'
sound/soc/davinci/davinci-pcm.c:836:17: sparse: undefined identifier 'dma_free_writecombine'

[coccinelle]
drivers/hwmon/lm95234.c:704:1-3: WARNING: PTR_RET can be used
drivers/hwmon/ltc4261.c:243:1-3: WARNING: PTR_RET can be used
drivers/hwmon/jc42.c:521:1-3: WARNING: PTR_RET can be used
drivers/base/dmabuf-sync.c:204:27-33: ERROR: reference preceded by free on line 200
drivers/base/dmabuf-sync.c:339:20-24: ERROR: invalid reference to the index variable of the iterator on line 302
drivers/clk/clk-mux.c:208:1-13: alloc with no test, possible model on line 214

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
